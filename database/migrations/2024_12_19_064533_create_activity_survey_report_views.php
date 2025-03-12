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
                `activity_survey_report_views` AS
            SELECT
                `project_id`,
                `indicator_id`,
                `activity_id`,
                (
                    SUM(`average_survey_mark`) / COUNT(`survey_id`)
                ) AS `average_activity_survey_mark`
            FROM
                `survey_report_views`
            GROUP BY
                `project_id`,
                `indicator_id`,
                `activity_id`
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
        DB::statement("DROP VIEW IF EXISTS `activity_survey_report_views`");
    }
};
