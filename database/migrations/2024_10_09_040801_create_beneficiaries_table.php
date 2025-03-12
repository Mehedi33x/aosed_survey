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
        Schema::create('beneficiaries', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();
            $table->string('full_name')->nullable();
            $table->string('name_bangla')->nullable();
            $table->string('beneficiary_no')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->string('nid')->nullable();
            $table->string('birth_certificate_no')->nullable();
            $table->string('mobile_no')->nullable();
            $table->string('emergencey_contact')->nullable();
            $table->string('email')->nullable();
            $table->string('image')->nullable();
            $table->enum('gender',['male','female','others'])->nullable();
            $table->enum('marital_status',['married','unmarried','divorced'])->nullable();
            $table->text('birth_certificate')->nullable();
            $table->longText('present_address')->nullable();
            $table->foreignId('pre_state_id')->nullable();
            $table->foreignId('pre_district_id')->nullable();
            $table->foreignId('pre_upazilla_id')->nullable();
            $table->foreignId('pre_thana_id')->nullable();
            $table->longText('permanent_address')->nullable();
            $table->foreignId('per_state_id')->nullable();
            $table->foreignId('per_district_id')->nullable();
            $table->foreignId('per_upazilla_id')->nullable();
            $table->foreignId('per_thana_id')->nullable();
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
        Schema::dropIfExists('beneficiaries');
    }
};
