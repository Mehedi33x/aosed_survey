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
                `indicator_survey_point_report_views` AS
            SELECT
                `indicator_survey_report_views`.`project_id`,
                `indicator_survey_report_views`.`indicator_id`,
                CASE
                    WHEN `indicator_survey_report_views`.`average_indicator_survey_mark` < 30 THEN `project_achievement_setups`.`survey_point_lt_30`
                    WHEN `indicator_survey_report_views`.`average_indicator_survey_mark` < 50 THEN `project_achievement_setups`.`survey_point_lt_50`
                    WHEN `indicator_survey_report_views`.`average_indicator_survey_mark` < 80 THEN `project_achievement_setups`.`survey_point_lt_80`
                    WHEN `indicator_survey_report_views`.`average_indicator_survey_mark` <= 100 THEN `project_achievement_setups`.`survey_point_lt_100`
                    ELSE 0
                END AS `indicator_survey_point`
            FROM
                `indicator_survey_report_views`
                INNER JOIN `project_achievement_setups` ON `indicator_survey_report_views`.`project_id` = `project_achievement_setups`.`project_id`
                AND `indicator_survey_report_views`.`indicator_id` = `project_achievement_setups`.`indicator_id`;
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
        DB::statement("DROP VIEW IF EXISTS `indicator_survey_point_report_views`");
    }
};
