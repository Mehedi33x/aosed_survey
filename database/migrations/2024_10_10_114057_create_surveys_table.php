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
        Schema::create('surveys', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('survey_number');
            $table->foreignId('project_id')->nullable();
            $table->foreignId('indicator_id')->nullable();
            $table->foreignId('activity_id')->nullable();
            $table->string('title',200)->nullable();
            $table->dateTime('survey_date')->nullable();
            $table->text('remarks')->nullable();
            $table->string('latitude',50)->nullable();
            $table->string('longitude',50)->nullable();
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
        Schema::dropIfExists('surveys');
    }
};
