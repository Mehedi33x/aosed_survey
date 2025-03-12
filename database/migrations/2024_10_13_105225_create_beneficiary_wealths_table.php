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
        Schema::create('beneficiary_wealths', function (Blueprint $table) {
            $table->id();
            $table->foreignId('beneficiary_id');
            $table->foreignId('wealth_id');
            $table->string('condition')->nullable();
            $table->string('sourch_of_ownership')->nullable();
            $table->integer('qty')->nullable();
            $table->text('description')->nullable();
            $table->integer('ownership_year')->nullable();
            $table->decimal('present_value',12,2);
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
        Schema::dropIfExists('beneficiary_wealths');
    }
};
