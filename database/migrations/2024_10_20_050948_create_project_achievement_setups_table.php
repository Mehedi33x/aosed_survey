<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_achievement_setups', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_id')->constrained()->onDelete('cascade');
            $table->foreignId('indicator_id')->constrained()->onDelete('cascade');
            $table->integer('activity_point')->nullable();
            $table->integer('activity_att_lt_30')->nullable();
            $table->integer('activity_att_lt_50')->nullable();
            $table->integer('activity_att_lt_80')->nullable();
            $table->integer('activity_att_lt_100')->nullable();
            $table->integer('survey_point_lt_30')->nullable();
            $table->integer('survey_point_lt_50')->nullable();
            $table->integer('survey_point_lt_80')->nullable();
            $table->integer('survey_point_lt_100')->nullable();
            $table->enum('status', ['active', 'deactive'])->default('deactive');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('project_achievement_setups');
    }
};
