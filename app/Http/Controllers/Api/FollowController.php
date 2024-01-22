<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ShowroomResource;
use App\Models\Showroom;
use App\Notifications\GeneralNotification;
use App\Notifications\PlateNotification;
use App\Services\Firebase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;

class FollowController extends Controller
{


    public function followShowroom($id)
    {
        $showroom = Showroom::findOrFail($id);
        $user = auth('end-user-api')->user();

        // Check if the user already follows the showroom
        if (!$user->showrooms->contains($id)) {

            $user->showrooms()->attach($showroom);

            $data = [
                'title'     => __('site.someone_followed_you'),
                'message'   => $user->name . __('site.followed_you'),
                'role'      => 'showroom',
            ];

            Notification::send($showroom, new GeneralNotification($data));
            Firebase::send(__('site.someone_followed_you') ,
                $user->name . __('site.followed_you'), [], 'general', [], $showroom->fcm_token);

            return $this->returnSuccess(__('site.showroom_followed_Successfully'));
        }else{

            $user->showrooms()->detach($showroom);

            $data = [
                'title'     => __('site.someone_unfollowed_you'),
                'message'   => $user->name . __('site.unfollowed_you'),
                'role'      => 'showroom',
            ];

            Notification::send($showroom, new GeneralNotification($data));
            Firebase::send(__('site.someone_unfollowed_you') ,
                $user->name . __('site.unfollowed_you'), [], 'general', [], $showroom->fcm_token);

            return $this->returnSuccess(__('site.showroom_unfollowed_Successfully'));
        }
    }
    public function getFollowedShowrooms()
    {
        $followed_showrooms = auth('end-user-api')->user()->showrooms;

        return $this->returnJSON( ShowroomResource::collection($followed_showrooms));
    }

    public function unfollowShowroom($id)
    {
        $showroom = Showroom::findOrFail($id);
        auth('end-user-api')->user()->showrooms()->detach($showroom);
        return $this->returnSuccess(__('site.showroom_unfollowed_Successfully'));
    }
}
