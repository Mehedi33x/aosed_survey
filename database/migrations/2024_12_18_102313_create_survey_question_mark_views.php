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
                `survey_question_mark_views` AS
            SELECT
                `survey_forms`.`project_id`,
                `survey_forms`.`indicator_id`,
                `survey_forms`.`activity_id`,
                SUM(`survey_questions`.`mark`) AS `total_question_marks`
            FROM
                `survey_forms`
            INNER JOIN `survey_questions` ON `survey_forms`.`id` = `survey_questions`.`survey_form_id`
            GROUP BY
                `survey_forms`.`project_id`,
                `survey_forms`.`indicator_id`,
                `survey_forms`.`activity_id`
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
        DB::statement("DROP VIEW IF EXISTS `survey_question_mark_views`");
    }
};
