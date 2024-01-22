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
        Schema::table('car_plates', function (Blueprint $table) {
            $table->foreignId('user_id')->nullable()->change();
            $table->foreignId('showroom_id')->nullable()->after('user_id')->constrained('showrooms')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('car_plates', function (Blueprint $table) {
            $table->dropForeign(['showroom_id']);
            $table->dropColumn('showroom_id');
        });
    }
};
