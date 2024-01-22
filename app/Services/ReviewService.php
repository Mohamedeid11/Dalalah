<?php

namespace App\Services;

use App\Models\Admin;
use App\Models\Car;
use App\Models\CarModel;
use App\Models\CarModelExtension;
use App\Models\CarModelYear;
use App\Models\CarPlate;
use App\Models\CarReport;
use App\Models\Review;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\CarNotification;
use App\Notifications\CarStatusSoldNotification;
use Dflydev\DotAccessData\Data;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;

class ReviewService {


    public function getMobileData(array $data ,int $paginate = 15, $order = 'DESC')
    {
        if (isset($data['car_id'])) {

            return Review::where(['car_id' => $data['car_id']])->orderBy('id' , $order)->paginate($paginate);
        }
        if (isset($data['plate_id'])){

            return Review::where('plate_id', $data['plate_id'])->orderBy('id' , $order)->paginate($paginate);
        }
    }

    public function getReportedData(int $paginate = 15, $order = 'DESC')
    {
        return Review::reported()->orderBy('id' , $order)->paginate($paginate);
    }

    public function storeMobileData(array $data)
    {
        if (isset($data['car_id'])){
            // Find the Car
            $car = Car::findOrFail($data['car_id']);

            // Create a new comment instance
            $review = new Review([
                'body' => $data['body'],
            ]);

            if (auth('end-user-api')->check()){
                // Associate the review with the authenticated user
                $review->user()->associate(auth('end-user-api')->user());

            }elseif (auth('showroom-api')->check()){
                // Associate the review with the authenticated user
                $review->showroom()->associate(auth('showroom-api')->user());
            }

            // Save the review to the post's reviews relationship
            $car->reviews()->save($review);

        }elseif(isset($data['plate_id'])){
            // Find the Plate
            $plate = CarPlate::findOrFail($data['plate_id']);
            // Create a new comment instance
            $review = new Review([
                'body' => $data['body'],
            ]);

            if (auth('end-user-api')->check()){
                // Associate the review with the authenticated user
                $review->user()->associate(auth('end-user-api')->user());

            }elseif (auth('showroom-api')->check()){
                // Associate the review with the authenticated user
                $review->showroom()->associate(auth('showroom-api')->user());
            }

            // Save the review to the post's reviews relationship
            $plate->reviews()->save($review);
        }

        return $review;
    }

    public function update($review , $data)
    {
        $review->update($data);
        return $review;
    }



}
