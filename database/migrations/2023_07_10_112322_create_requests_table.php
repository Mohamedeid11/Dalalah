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
        Schema::create('requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('brand_id')->nullable()->constrained('brands')->cascadeOnDelete();
            $table->foreignId('car_model_id')->nullable()->constrained('car_models')->cascadeOnDelete();
            $table->foreignId('car_model_extension_id')->nullable()->constrained('car_model_extensions')->cascadeOnDelete();
            $table->string('year')->nullable();
            $table->string('mileage')->nullable();
            $table->foreignId('city_id')->nullable()->constrained('cities');
            $table->foreignId('district_id')->nullable()->constrained('districts');
            $table->string('name')->nullable();
            $table->string('phone')->nullable();
            $table->string('is_approved')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('requests');
    }
    
};
