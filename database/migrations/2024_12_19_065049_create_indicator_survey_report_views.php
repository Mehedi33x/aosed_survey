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
                `indicator_survey_report_views` AS
            SELECT
                `project_id`,
                `indicator_id`,
                (
                    SUM(`average_activity_survey_mark`) / COUNT(`activity_id`)
                ) AS `average_indicator_survey_mark`
            FROM
                `activity_survey_report_views`
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
        DB::statement("DROP VIEW IF EXISTS `indicator_survey_report_views`");
    }
};
