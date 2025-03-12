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
        Schema::create('beneficiary_occupations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('beneficiary_id');
            $table->foreignId('occupation_id');
            $table->tinyInteger('is_primary')->nullable();
            $table->integer('working_hour')->nullable();
            $table->text('occupation_risk')->nullable();
            $table->text('work_location')->nullable();
            $table->decimal('monthly_income', 12, 2);
            $table->decimal('past_year_income',12,2);
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
        Schema::dropIfExists('beneficiary_occupations');
    }
};
