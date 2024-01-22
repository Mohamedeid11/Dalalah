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
        Schema::create('car_plates', function (Blueprint $table) {
            $table->id();
            $table->string('letter_ar');
            $table->string('letter_en');
            $table->integer('plate_number');
            $table->decimal('price',10,2);
            $table->enum('plate_type',['transfer','private']);
            $table->enum('bought_status',['not_sold','sold']);
            $table->enum('ad_type',['basic','featured'])->nullable();
            $table->string('is_hide')->default(0);
            $table->string('is_paused')->default(0);
            $table->string('is_approved')->default(0);

            // foreign keys and relations
            $table->foreignId('user_id')->nullable()->constrained('users');
            $table->foreignId('city_id')->nullable()->constrained('cities');
            $table->foreignId('district_id')->nullable()->constrained('districts');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('car_plates');
    }
};
