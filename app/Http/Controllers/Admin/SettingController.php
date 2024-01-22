<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Setting\AboutRequest;
use App\Http\Requests\Admin\Setting\ContactRequest;
use App\Http\Requests\Admin\Setting\HomeRequest;
use App\Http\Requests\Admin\Setting\SocialRequest;
use App\Models\Setting;
use App\Models\Showroom;
use App\Models\User;
use Illuminate\Support\Facades\Cache;


class SettingController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:setting.read', ['only' => ['homeForm','socialForm']]);
        $this->middleware('permission:setting.edit', ['only' => ['updateHome', 'updateSocial']]);
    }

    public function homeForm()
    {
        return view('admin.pages.setting.home');
    }

    public function updateHome(HomeRequest $request)
    {

        foreach($request->validated() as $key => $record){
            Setting::where('option',$key)->update(['value'=>$record]);
        }

        if($request->site_logo){
            $this->addStaticImage($request->site_logo , 'site_logo');
        }

        if($request->about_section_img){
            $this->addStaticImage($request->about_section_img , 'about_section_img');
        }

        if($request->show_section_img){
            $this->addStaticImage($request->show_section_img , 'show_section_img');
        }

        $this->cacheSetting();
        session()->flash('success', __('Setting Updated Successfully'));
        return back();

    }

    public function socialForm()
    {
        return view('admin.pages.setting.social');
    }

    public function updateSocial(SocialRequest $request)
    {
        foreach($request->except('_token') as $key => $record){
            Setting::where('option',$key)->update(['value'=>$record]);
        }

        $this->cacheSetting();
        session()->flash('success', __('Setting Updated Successfully'));
        return back();
    }

    public function FeatureForm()
    {
        return view('admin.pages.setting.feature');
    }

    public function updateFeature(SocialRequest $request)
    {
        foreach($request->except('_token') as $key => $record){
            Setting::where('option',$key)->update(['value'=>$record]);
        }

        $this->cacheSetting();
        session()->flash('success', __('Setting Updated Successfully'));
        return back();
    }

    public function addStaticImage($image , $name)
    {
        $record = Setting::where('option',$name)->first();
        $record->deleteFiles();
        $record->storeFile($image);
        $record->update(['value'=>['en'=> $record->getFirstMediaUrl('settings')]]);
    }

    public function cacheSetting()
    {
        Cache::forget('settings');
        Cache::rememberForever('settings', function () {
                 return Setting::get();
        });
    }

    public function userEmailVerification(User $user){
        $user->update(['email_verified_at' => now()]);
        return redirect()->route('end-user.index');
    }

    public function showroomEmailVerification(Showroom $showroom){
        $showroom->update(['email_verified_at' => now()]);
        return redirect()->route('end-user.index');
    }

    public function paymentStatus(){
        $payment =Setting::where('option','show_payment')->update([ 'value' => json_encode( !setting('show_payment','en'))]);
        $this->cacheSetting();

        session()->flash('success', __('Payment Changed Successfully'));
        return redirect()->back();
    }
}
