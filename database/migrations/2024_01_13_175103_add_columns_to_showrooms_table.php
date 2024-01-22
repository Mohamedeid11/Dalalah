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
        Schema::table('showrooms', function (Blueprint $table) {
            $table->string('email')->after('code');

            $table->foreignId('city_id')->nullable()->constrained('cities')->cascadeOnDelete();
            $table->foreignId('district_id')->nullable()->constrained('districts')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('showrooms', function (Blueprint $table) {
            $table->dropForeign(['city_id']);
            $table->dropColumn('city_id');

            $table->dropForeign(['district_id']);
            $table->dropColumn('district_id');
        });
    }
};
