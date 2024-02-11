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
        Schema::create('showrooms', function (Blueprint $table) {
            $table->id();
            $table->json('owner_name')->nullable();
            $table->json('showroom_name')->nullable();
            $table->json('description')->nullable();
            $table->string('code')->start_from(1400);
            $table->string('password');
            $table->string('fcm_token')->nullable();
            $table->string('phone')->nullable();
            $table->string('whatsapp')->nullable();
            $table->string('end_tax_card')->nullable();
            $table->json('address')->nullable();
            $table->enum('type',['showroom','agency']);
            $table->boolean('is_blocked')->default(0);
            $table->boolean('is_approved')->default(0);
            $table->softDeletes();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('showrooms');
    }

};
