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
                `project_achievement_views` AS
            WITH
                with_project_achievement AS (
                    SELECT
                        `apip_views`.`project_id` AS `project_id`,
                        `apip_views`.`apip` AS `single_achievement`
                    FROM
                        `apip_views`
                    UNION
                    SELECT
                        `project_attendance_views`.`project_id` AS `project_id`,
                        `project_attendance_views`.`average_attendance` AS `single_achievement`
                    FROM
                        `project_attendance_views`
                    UNION
                    SELECT
                        `project_survey_point_report_views`.`project_id` AS `project_id`,
                        `project_survey_point_report_views`.`average_survey` AS `single_achievement`
                    FROM
                        `project_survey_point_report_views`
                )
            SELECT
                `project_id`,
                SUM(COALESCE(`single_achievement`, 0)) AS `achievement`
            FROM
                `with_project_achievement`
            GROUP BY
                `project_id`
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
        DB::statement("DROP VIEW IF EXISTS `project_achievement_views`");
    }
};
