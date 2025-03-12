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
        Schema::create('activity_infos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('project_id');
            $table->unsignedBigInteger('indicator_id');
            $table->unsignedBigInteger('activity_id');
            $table->unsignedBigInteger('group_id');
            $table->unsignedBigInteger('execute_by');
            $table->date('execute_date')->nullable();
            $table->integer('total_beneficiary')->default(0);
            $table->text('file')->nullable();
            $table->text('remarks')->nullable();
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
        Schema::dropIfExists('activity_infos');
    }
};
