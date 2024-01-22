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
        Schema::create('car_options', function (Blueprint $table) {
            $table->foreignId('car_id')->constrained('cars')->cascadeOnDelete();
            $table->foreignId('feature_option_id')->constrained('feature_options')->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('car_options');
    }
    
};
