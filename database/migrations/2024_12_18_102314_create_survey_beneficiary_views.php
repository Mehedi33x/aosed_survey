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
                `survey_beneficiary_views` AS
            SELECT
                `surveys`.`project_id`,
                `surveys`.`indicator_id`,
                `surveys`.`activity_id`,
                `surveys`.`id` AS `survey_id`,
                `survey_beneficiaries`.`id` AS `survey_beneficiary_id`,
                (
                    (
                        `survey_beneficiaries`.`total_mark` * 100
                    ) / `survey_question_mark_views`.`total_question_marks`
                ) AS `beneficiary_mark_percentage`
            FROM
                `surveys`
            INNER JOIN `survey_beneficiaries` ON `surveys`.`id` = `survey_beneficiaries`.`survey_id`
            INNER JOIN `survey_question_mark_views` ON `survey_question_mark_views`.`activity_id` = `surveys`.`activity_id`
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
        DB::statement("DROP VIEW IF EXISTS `survey_beneficiary_views`");
    }
};
