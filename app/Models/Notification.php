<?php

namespace App\Models;

use App\Notifications\CarNotification;
use App\Notifications\GeneralNotification;
use App\Notifications\PlateNotification;
use App\Notifications\ShowroomApprovedCarNotification;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Notification extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'notifications';

    public function getIdIncrement()
    {
        return $this->id_increment;
    }

    public function getTitle(): string
    {
        $data = json_decode($this->data);
        return ! isset($data->title) ? 'AutoMobile' : $data->title;
    }

    public function getMessage(): string
    {
        $data = json_decode($this->data);
        return ! isset($data->message) ? '' : $data->message;
    }

    public function getTypeNotification()
    {
        if($this->type == GeneralNotification::class){
            return 'general';
        }elseif($this->type == ShowroomApprovedCarNotification::class){
            return 'approved_showroom_car';
        }elseif($this->type == CarNotification::class){
            return 'approved_showroom_car';
        }elseif($this->type == PlateNotification::class){
            return 'plate_added';
        }
    }

    public function getNavigateId()
    {
        $data = json_decode($this->data);
        return ! isset($data->id) ? null : $data->id;
    }

    public function getRole()
    {
        $data = json_decode($this->data);
        return ! isset($data->role) ? '' : $data->role;
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('d-m-Y');
    }

    public function getAgo(): string
    {
        return $this->created_at->diffForHumans();
    }

}
