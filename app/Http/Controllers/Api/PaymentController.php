<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Payment\FeaturedPaymentRequest;
use App\Http\Requests\Api\Payment\PackagePaymentRequest;
use App\Http\Resources\PackageResource;
use App\Http\Resources\PaginationCollection;
use App\Jobs\SuccessPayment;
use App\Models\Car;
use App\Models\CarPlate;
use App\Models\Package;
use App\Models\Payment;
use App\Services\PaymentService;
use Illuminate\Http\Request;


class PaymentController extends Controller
{
    public $PaymentService;

    public function __construct()
    {
        $this->PaymentService = new PaymentService();

    }
    /**
     * payment method.
     */
    public function PackagePayment(PackagePaymentRequest $request)
    {
        $showroom = auth('showroom-api')->user();
        $package = Package::findOrFail($request->package_id);
        if ($request->Result == 'Successful') {


            $payment = new Payment([
                'paymentId' => $request->PaymentId,
                'paymentType' => $request->PaymentType,
                'status' => $request->Result,
                'payment_type' => 'package',
                'payment_from' => 'mobile',
                'amount' => $package->price,
                'package_id' => $package->id,
            ]);

            $showroom->payments()->save($payment);

            dispatch(new SuccessPayment($payment->id));
            return $this->returnSuccess('your payment done successfully');

        }else{
            return $this->returnWrong('Payment' . $request->Result);
        }

  // old integration
//        $url = $this->PaymentService->urWayPayment($showroom, $payment);
//        return $this->returnJSON($url);

    }

    public function featuredPayment(FeaturedPaymentRequest $request)
    {
        $user = auth('end-user-api')->user() ?? auth('showroom-api')->user();

        // here to get the ad by the type
         if ($request->ad_type == 'car'){
             $Ad = Car::findorFail($request->ad_id);
         }elseif ($request->ad_type == 'plate'){
             $Ad = CarPlate::findOrFail($request->ad_id);
         }

        if ($request->Result == 'Successful') {

            $payment = new Payment([
                'paymentId'     => $request->PaymentId,
                'paymentType'   => $request->PaymentType,
                'status'        => $request->Result,
                'payment_from'  => 'mobile',
                'payment_type'  => 'featured_ad',
                'amount'        => setting('feature_duration_price','en'),
            ]);

            // storing the user and the Ad to payment
            $user->payments()->save($payment);
            $Ad->payments()->save($payment);

            dispatch(new SuccessPayment($payment->id));
            return $this->returnSuccess('your payment done successfully');

        }else{
            return $this->returnWrong('Payment' . $request->Result);
        }

           // old integration
//        $url = $this->PaymentService->urWayPayment($user, $payment);
//        return $this->returnJSON($url);
    }

    public function success(Request $request)
    {
        if ($request->Result == 'Successful'){
/*            //this when comes from testing for testing only
            $id = explode("-", $request->TrackId);
*/
            dispatch(new SuccessPayment($request->TrackId));

            return $this->returnSuccess('your payment done successfully');
        }else{
            Payment::where('id' ,$request->TrackId)->update(['status' => $request->Result]);
            return $this->returnWrong();
        }
    }

    public function getPackages(){
        $packages = Package::paginate(15);
        return $this->returnAllDataJSON(PackageResource::collection($packages) ,  new PaginationCollection($packages));
    }

}
