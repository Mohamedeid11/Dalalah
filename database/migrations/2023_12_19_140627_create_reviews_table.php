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
        Schema::create('reviews', function (Blueprint $table) {
            $table->id();
            $table->text('body');
            $table->enum('reported',[0 , 1])->default(0);
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('car_id')->nullable()->constrained('cars')->cascadeOnDelete();
            $table->foreignId('plate_id')->nullable()->constrained('car_plates')->cascadeOnDelete();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reviews');
    }
};
