<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('avatar_users', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('profession_id');
            $table->enum('status', ['confirmed', 'unconfirmed'])->default('unconfirmed');
            $table->unsignedBigInteger('from_user_id')->nullable();
            

            $table->foreign('profession_id')->references('id')->on('professions')->onDelete('cascade');
            $table->foreign('from_user_id')->references('id')->on('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('avatar_users');
    }
};
