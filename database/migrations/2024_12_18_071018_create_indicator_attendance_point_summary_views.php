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
                `indicator_attendance_point_summary_views` AS
            SELECT
                `indicator_attendance_summary_views`.`project_id`,
                `indicator_attendance_summary_views`.`indicator_id`,
                CASE
                    WHEN `indicator_attendance_summary_views`.`present_percentage_by_indicator` < 30 THEN `project_achievement_setups`.`activity_att_lt_30`
                    WHEN `indicator_attendance_summary_views`.`present_percentage_by_indicator` < 50 THEN `project_achievement_setups`.`activity_att_lt_50`
                    WHEN `indicator_attendance_summary_views`.`present_percentage_by_indicator` < 80 THEN `project_achievement_setups`.`activity_att_lt_80`
                    WHEN `indicator_attendance_summary_views`.`present_percentage_by_indicator` <= 100 THEN `project_achievement_setups`.`activity_att_lt_100`
                    ELSE 0
                END AS `indicator_attendance_point`
            FROM
                `indicator_attendance_summary_views`
                INNER JOIN `project_achievement_setups` ON `indicator_attendance_summary_views`.`project_id` = `project_achievement_setups`.`project_id`
                AND `indicator_attendance_summary_views`.`indicator_id` = `project_achievement_setups`.`indicator_id`;
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
        DB::statement("DROP VIEW IF EXISTS `indicator_attendance_point_summary_views`");
    }
};
