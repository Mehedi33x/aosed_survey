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
                `activity_attendance_summary_views` AS
            WITH
                with_present_counts AS(
                SELECT
                    `beneficiary_assigns`.`project_id`,
                    `beneficiary_assigns`.`indicator_id`,
                    `beneficiary_assigns`.`activity_id`,
                    COUNT(`beneficiary_assigns`.`id`) AS `beneficiary_assign_count`,
                    (
                    SELECT
                        COUNT(
                            `beneficiary_attendance_details`.`id`
                        )
                    FROM
                        `beneficiary_attendances`
                    INNER JOIN `beneficiary_attendance_details` ON `beneficiary_attendances`.`id` = `beneficiary_attendance_details`.`beneficiary_attendance_id`
                    WHERE
                        `beneficiary_assigns`.`project_id` = `beneficiary_attendances`.`project_id` AND `beneficiary_assigns`.`indicator_id` = `beneficiary_attendances`.`indicator_id` AND `beneficiary_assigns`.`activity_id` = `beneficiary_attendances`.`activity_id` AND `beneficiary_attendance_details`.`attendance` = 1
                ) AS `beneficiary_present_count`
            FROM
                `beneficiary_assigns`
            GROUP BY
                `beneficiary_assigns`.`project_id`,
                `beneficiary_assigns`.`indicator_id`,
                `beneficiary_assigns`.`activity_id`
            )
            SELECT
                *,
                (
                    `beneficiary_present_count` * 100
                ) / `beneficiary_assign_count` AS `present_percentage`
            FROM
                with_present_counts
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
        DB::statement("DROP VIEW IF EXISTS `activity_attendance_summary_views`");
    }
};
