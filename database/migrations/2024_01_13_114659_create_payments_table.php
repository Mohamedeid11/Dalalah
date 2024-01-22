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
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->decimal('amount',10,2);
            $table->string('status');

            // this for users (showroom - user)
            $table->unsignedBigInteger('paymentable_id');
            $table->string('paymentable_type');

            $table->enum('payment_type', ['package', 'featured_ad'])
                ->comment('i have two types of payment first is for showroom package | second is for featured ads');

            // this for ads (car - car plate)
            $table->unsignedBigInteger('ad_id')->nullable();
            $table->string('ad_type')->nullable();

            $table->unsignedBigInteger('package_id')->nullable();
            $table->foreign('package_id')->references('id')->on('packages');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
