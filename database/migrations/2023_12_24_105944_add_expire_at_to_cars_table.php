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
        Schema::table('cars', function (Blueprint $table) {
            $table->enum('ad_type',['basic','featured'])->nullable()->after('description');
            $table->date('expired_at')->nullable()->after('ad_type');
        });

        Schema::table('car_plates', function (Blueprint $table) {
            $table->date('expired_at')->nullable()->after('ad_type');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('cars', function (Blueprint $table) {
            //
        });
    }
};
