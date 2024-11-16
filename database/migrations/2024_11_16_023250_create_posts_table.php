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
        Schema::create('post', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('title');
            $table->text('description');
            $table->string('status');
            $table->unsignedBigInteger('company_id')->nullable();
            $table->unsignedBigInteger('area_id')->nullable();
            $table->timestamp('due_at')->nullable();
            $table->string('benefit')->nullable();
            $table->unsignedBigInteger('form_of_work_id')->nullable();
            $table->integer('amount')->nullable();
            $table->decimal('salary', 10, 2)->nullable();
            $table->unsignedBigInteger('category_id')->nullable();

            $table->foreign('company_id')->references('id')->on('company')->onDelete('set null');
            $table->foreign('area_id')->references('id')->on('area')->onDelete('set null');
            $table->foreign('form_of_work_id')->references('id')->on('form_of_work')->onDelete('set null');
            $table->foreign('category_id')->references('id')->on('category')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts');
    }
};
