<?php

namespace App\Observers;

use App\Models\Showroom;

class ShowroomObserver
{

    /**
     * Handle the category "creating" event.
     *
     * @param  \App\Model\Showroom  $showroom
     * @return void
     */
    public function creating(Showroom $showroom)
    {
       
        if(Showroom::max('code') == null){
            $showroom->code = 1400;
            return;
        }

        if (is_null($showroom->code)) {
            $showroom->code = Showroom::max('code') + 8;
            return;
        }

        $lowerPriorityShowrooms = Showroom::where('code', '>=', $showroom->code)->get();

        foreach ($lowerPriorityShowrooms as $lowerPriorityShowroom) {
            $lowerPriorityShowroom->code++;
            $lowerPriorityShowroom->saveQuietly();
        }
    }

    /**
     * Handle the category "deleted" event.
     *
     * @param  \App\Category  $category
     * @return void
     */
    public function deleted(Showroom $showroom)
    {
        $lowerPriorityShowrooms = Showroom::where('code', '>', $showroom->code)->get();

        foreach ($lowerPriorityShowrooms as $lowerPriorityShowroom) {
            $lowerPriorityShowroom->code--;
            $lowerPriorityShowroom->saveQuietly();
        }
    }

}
