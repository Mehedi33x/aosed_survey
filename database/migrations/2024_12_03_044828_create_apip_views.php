<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $this->dropView();

        DB::statement("
            CREATE VIEW
                `apip_views` AS
            WITH
                activity_execute_view AS (
                    SELECT
                        `project_activities`.`project_id` AS `project_id`,
                        `project_activities`.`indicator_id` AS `indicator_id`,
                        IF (
                            COUNT(`activity_infos`.`id`) > 0,
                            COUNT(DISTINCT `project_activities`.`id`),
                            0
                        ) AS `eai`
                    FROM
                        `project_activities`
                        LEFT JOIN `activity_infos` ON `project_activities`.`id` = `activity_infos`.`activity_id`
                    GROUP BY
                        `project_activities`.`project_id`,
                        `project_activities`.`indicator_id`
                ),
                sap_view AS (
                    SELECT
                        `project_activities`.`project_id` AS `project_id`,
                        `project_activities`.`indicator_id` AS `indicator_id`,
                        `project_achievement_setups`.`activity_point` AS `ap`,
                        COUNT(`project_activities`.`id`) AS `tap`,
                        (
                            `project_achievement_setups`.`activity_point` / COUNT(`project_activities`.`id`)
                        ) AS `sap`
                    FROM
                        `project_activities`
                        LEFT JOIN `project_achievement_setups` ON `project_activities`.`indicator_id` = `project_achievement_setups`.`indicator_id`
                    GROUP BY
                        `project_activities`.`project_id`,
                        `project_activities`.`indicator_id`,
                        `project_achievement_setups`.`activity_point`
                ),
                pap_view AS (
                    SELECT
                        `sap_view`.`project_id` AS `project_id`,
                        `sap_view`.`indicator_id` AS `indicator_id`,
                        (`sap_view`.`sap` * `activity_execute_view`.`eai`) AS `pap`
                    FROM
                        `sap_view`
                        LEFT JOIN `activity_execute_view` ON `sap_view`.`project_id` = `activity_execute_view`.`project_id`
                        AND `sap_view`.`indicator_id` = `activity_execute_view`.`indicator_id`
                )
            SELECT
                `projects`.`id` AS `project_id`,
                IFNULL (
                    (
                        SELECT
                            SUM(`pap_view`.`pap`)
                        FROM
                            `pap_view`
                        WHERE
                            `pap_view`.`project_id` = `projects`.`id`
                    ),
                    0
                ) AS `total_pap`,
                COUNT(DISTINCT `indicators`.`id`) AS `ti`,
                (
                    IFNULL (
                        (
                            SELECT
                                SUM(`pap_view`.`pap`)
                            FROM
                                `pap_view`
                            WHERE
                                `pap_view`.`project_id` = `projects`.`id`
                        ),
                        0
                    ) / COUNT(DISTINCT `indicators`.`id`)
                ) AS `apip`
            FROM
                `projects`
                LEFT JOIN `indicators` ON `projects`.`id` = `indicators`.`project_id`
            GROUP BY
                `projects`.`id`
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        $this->dropView();
    }

    private function dropView()
    {
        DB::statement("DROP VIEW IF EXISTS `apip_views`");
    }
};
