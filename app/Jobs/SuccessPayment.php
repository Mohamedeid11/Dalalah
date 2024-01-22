<?php

namespace App\Jobs;

use Throwable;
use App\Models\Payment;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SuccessPayment implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $id;

    /**
     * Create a new job instance.
     */
    public function __construct($id)
    {
        $this->id = $id;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $payment = Payment::findOrFail($this->id);

        if ($payment->ad){
            $payment->ad->update(['is_hide' => '0' , 'is_approved' => '1' , 'ad_type' => 'featured']);
        }

        if (isset($payment->package_id)){
            $expiredData = now()->today()->addMonths($payment->package->period);
            $payment->paymentable->update(['package_id' => $payment->package_id,'expired_date' => $expiredData->toDateString()]);
        }
    }

    /**
     * Throw exception on fail job
     *
     * @param Throwable $exception
     *
     * @return void
     */
    public function failed(Throwable $exception)
    {
        dump( $exception->getMessage() );
    }
}
