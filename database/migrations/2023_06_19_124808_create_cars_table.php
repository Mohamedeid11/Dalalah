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
        Schema::create('cars', function (Blueprint $table) {
            $table->id();
            $table->string('model_name');
            $table->unsignedBigInteger('model_id');
            $table->json('title')->nullable();
            $table->foreignId('brand_id')->constrained('brands')->cascadeOnDelete();
            $table->foreignId('car_model_id')->constrained('car_models')->cascadeOnDelete();
            $table->foreignId('car_model_extension_id')->constrained('car_model_extensions')->cascadeOnDelete();
            $table->foreignId('branch_id')->nullable()->constrained('branches');
            $table->foreignId('city_id')->nullable()->constrained('cities');
            $table->foreignId('district_id')->nullable()->constrained('districts');
            $table->foreignId('car_type_id')->nullable()->constrained('car_types');
            $table->string('year');
            $table->string('color')->nullable();
            $table->foreignId('color_id')->nullable()->constrained('colors');
            $table->string('is_hide')->default(0);
            $table->string('is_approved')->default(0);
            $table->enum('drive_type',['manual','automatic']);
            $table->enum('body_type',['hatchback','sedan']);
            $table->enum('fuel_type',['gasoline','diesel','natural_gas','electrical','hybrid']);
            $table->enum('status',['new','used','certificated_used']);
            $table->enum('status_buyed',['pending','approved','sold']);
            $table->string('vin')->nullable();
            $table->decimal('price',10,2);
            $table->string('doors')->nullable();
            $table->string('engine')->nullable();
            $table->string('cylinders');
            $table->string('mileage')->nullable();
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cars');
    }

};
