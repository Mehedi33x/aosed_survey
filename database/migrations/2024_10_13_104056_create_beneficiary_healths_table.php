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
        Schema::create('beneficiary_healths', function (Blueprint $table) {
            $table->id();
            $table->foreignId('beneficiary_id');
            // $table->string('title')->nullable();
            $table->foreignId('disease_id');
            $table->integer('height')->nullable();
            $table->integer('weight')->nullable();
            $table->string('physical_condition')->nullable();
            $table->text('remarks')->nullable();
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
        Schema::dropIfExists('beneficiary_healths');
    }
};
