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
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // Relasi ke tabel users
            $table->enum('gender', ['male', 'female']);
            $table->string('linkedin')->nullable();
            $table->string('mobile_number', 15);
            $table->date('dob');
            $table->enum('status', ['paid', 'unpaid'])->default('unpaid');
            $table->enum('visibility', ['visible', 'unvisible'])->default('visible');
            $table->integer('registration_price');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('profiles');
    }
};
