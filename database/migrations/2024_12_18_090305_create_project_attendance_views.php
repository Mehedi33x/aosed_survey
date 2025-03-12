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
                `project_attendance_views` AS
            SELECT
                `project_id`,
                (
                    SUM(COALESCE(`indicator_attendance_point`, 0)) / COUNT(COALESCE(`indicator_id`, 0))
                ) AS `average_attendance`
            FROM
                `indicator_attendance_point_summary_views`
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
        DB::statement("DROP VIEW IF EXISTS `project_attendance_views`");
    }
};
