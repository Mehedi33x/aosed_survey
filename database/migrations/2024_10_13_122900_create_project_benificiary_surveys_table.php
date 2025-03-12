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
        Schema::create('project_benificiary_surveys', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_id')->nullable();
            $table->foreignId('activity_id')->nullable();
            $table->foreignId('question_id')->nullable();
            $table->string('title')->nullable();
            $table->text('answer')->nullable();
            $table->integer('sorting')->default(0);
            $table->enum('status', ['active', 'deactive'])->default('active');
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
        Schema::dropIfExists('project_benificiary_surveys');
    }
};
