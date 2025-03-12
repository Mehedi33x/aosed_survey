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
                `indicator_attendance_summary_views` AS
            SELECT
                `project_id`,
                `indicator_id`,
                SUM(`present_percentage`) AS `present_percentage_count`,
                COUNT(`activity_id`) AS `activity_count`,
                SUM(`present_percentage`) / COUNT(`activity_id`) AS `present_percentage_by_indicator`
            FROM
                `activity_attendance_summary_views`
            GROUP BY
                `project_id`,
                `indicator_id`
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
        DB::statement("DROP VIEW IF EXISTS `indicator_attendance_summary_views`");
    }
};
