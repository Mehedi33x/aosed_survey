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
                `survey_report_views` AS
            SELECT
                `project_id`,
                `indicator_id`,
                `activity_id`,
                `survey_id`,
                (
                    SUM(`beneficiary_mark_percentage`) / COUNT(`survey_beneficiary_id`)
                ) AS `average_survey_mark`
            FROM
                `survey_beneficiary_views`
            GROUP BY
                `project_id`,
                `indicator_id`,
                `activity_id`,
                `survey_id`;
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
        DB::statement("DROP VIEW IF EXISTS `survey_report_views`");
    }
};
