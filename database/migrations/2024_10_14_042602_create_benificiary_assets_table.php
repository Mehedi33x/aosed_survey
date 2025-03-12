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
        Schema::create('benificiary_assets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('beneficiary_id')->nullable();
            $table->foreignId('asset_id')->nullable();
            $table->string('title')->nullable();
            $table->string('condition')->nullable();
            $table->string('sourch_of_ownership')->nullable();
            $table->integer('qty')->nullable();
            $table->text('description')->nullable();
            $table->integer('ownership_year')->nullable();
            $table->decimal('present_value',12,2)->nullable();
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
        Schema::dropIfExists('benificiary_assets');
    }
};
