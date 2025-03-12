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
        Schema::create('beneficiary_diseases', function (Blueprint $table) {
            $table->id();
            $table->foreignId('beneficiary_id');
            $table->foreignId('disease_id');
            $table->date('affected_date')->nullable();
            $table->date('recovery_date')->nullable();
            $table->integer('is_continue')->nullable();
            $table->integer('is_infectious')->nullable();
            $table->text('how_to_affected')->nullable();
            // $table->integer('sorting')->default(0);
            // $table->enum('status', ['active', 'deactive'])->default('active');
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
        Schema::dropIfExists('beneficiary_diseases');
    }
};
