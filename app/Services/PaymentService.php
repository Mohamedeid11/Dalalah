<?php

namespace App\Services;

use Alaaelsaid\LaravelUrwayPayment\Facade\Urway;
use App\Models\Payment;


class PaymentService {

    public function getData()
    {
            return Payment::orderBy('id','DESC')->paginate(15);
    }

    public function urWayPayment($user ,$payment)
    {
        //process the payment
        $payment_url = Urway::getPaymentUrl([
            'trackid' => $payment->id,
            'email' => $user->email,
            'amount' => $payment->amount,
            'redirect_url' => route('payment.success'), // put your redirect url here, feel free to use url() method,
        ]);

        return $payment_url;
    }

    public function testUrWayPayment($user ,$payment)
    {
        //process the payment
        $payment_url = Urway::getPaymentUrl([
            'trackid' => 'Test-'. $payment->id ,
            'email' => 'test.test@gmail.com',
            'amount' => $payment->amount,
            'redirect_url' => route('payment.success'),
        ]);

        return $payment_url;
    }

}
