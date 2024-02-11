<?php

namespace App\Services;

use App\Models\Restaurant\Restaurant;
use App\Models\Showroom;
use App\Models\User;
use LaravelFCM\Facades\FCM;
use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;
use Spatie\Permission\Commands\Show;

class Firebase
{

    public static function send(string $title, string $body, array $users = [],
        string $userType = 'user' , array $optionalData = [] ,$tokens = '')
    {
        $optionBuilder = new OptionsBuilder();
        $optionBuilder->setTimeToLive(60 * 20);

        $notificationBuilder = new PayloadNotificationBuilder($title);
        $notificationBuilder->setBody($body)->setSound('default');

        $dataBuilder = new PayloadDataBuilder();
        $dataBuilder->addData($optionalData);
        $option = $optionBuilder->build();
        $notification = $notificationBuilder->build();
        $data = $dataBuilder->build();

		// $tokens = 'eEb5JLM9AcU73bLPF3viYc:APA91bGM9lWe1R61vHwiqOqX2onF2nD42YiXHlvygNL-agXdIYUQS4JRRZkugf6z5qB_JxTkyYVJwTwaIiMQ4v40zlaAuTQWjYx29mqZ9imYKFq2AW70o27q0xYG_zPDeICR3wptzQxn';
        // $tokens = 'dcIHpSGsPi3PDO3HIdXbig:APA91bGRSWH6sHJoLB4lrNWv-4A85lgFbm7JWpS7MrUE5eE82QR5RP2oDDphHA-c-bOiqcbxz37NAHFsD4_1S3uzMGZdewFx8kl2D3oxz0i14_zYhhcWtnQBDP4B4Uu5a_lYsunEuffl';
        if ($tokens != null){
//            dd($tokens);
            $downstreamResponse = FCM::sendTo($tokens, $option, $notification, $data);
            $downstreamResponse->numberSuccess();

        }else {
            if ($userType == 'user') {
                $query = User::whereIn('id', $users)->whereNotNull('fcm_token');
            } elseif ($userType == 'showroom') {
                $query = Showroom::whereIn('id', $users)->whereNotNull('fcm_token');
            }

            $query->chunk(100, function ($usersChunk) use ($option, $notification, $data) {

                $tokens = $usersChunk->pluck('fcm_token')->toArray();
                $downstreamResponse = FCM::sendTo($tokens, $option, $notification, $data);

                $downstreamResponse->numberSuccess();

                // $downstreamResponse->numberFailure();
                // $downstreamResponse->numberModification();
                // // return Array - you must remove all this tokens in your database
                // $downstreamResponse->tokensToDelete();
                // // return Array (key : oldToken, value : new token - you must change the token in your database)
                // $downstreamResponse->tokensToModify();
                // // return Array - you should try to resend the message to the tokens in the array
                // $downstreamResponse->tokensToRetry();
                // // return Array (key:token, value:error) - in production you should remove from your database the tokens present in this array
                // $downstreamResponse->tokensWithError();
            });
        }
    }

}
