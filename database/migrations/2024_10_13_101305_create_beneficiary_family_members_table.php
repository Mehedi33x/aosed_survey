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
        Schema::create('beneficiary_family_members', function (Blueprint $table) {
            $table->id();
            $table->foreignId('beneficiary_id');
            $table->foreignId('relation_id');
            $table->string('title')->nullable();
            $table->string('name')->nullable();
            $table->date('family_date_of_birth')->nullable();
            $table->integer('family_nid')->nullable();
            $table->enum('gender',['male','female','others'])->nullable();
            $table->enum('marital_status',['married','unmarried','divorced'])->nullable();
            $table->string('last_education_info')->nullable();
            $table->integer('earn')->nullable();
            $table->foreignId('occupation_id')->nullable();
            $table->decimal('yearly_income', 12, 2);
            $table->integer('is_student')->nullable();
            $table->integer('goes_to_school')->nullable();
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
        Schema::dropIfExists('beneficiary_family_members');
    }
};
