<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AdminStoreRequest;
use App\Http\Requests\Admin\AdminUpdateRequest;
use App\Models\Admin;
use App\ViewModels\AdminViewModel;
use RealRashid\SweetAlert\Facades\Alert;

class AdminController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('permission:admins.read', ['only' => ['index']]);
        $this->middleware('permission:admins.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:admins.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:admins.delete', ['only' => ['destroy']]);
    }
   
    public function index()
    {
        $admins = Admin::paginate();
        return view('admin.pages.admins.index',compact('admins'));
    }
   
    public function create()
    {
        return view('admin.pages.admins.form', new AdminViewModel());
    }
    
    public function store(AdminStoreRequest $request)
    {
        $admin = Admin::create($request->validated());
        $admin->assignRole($request->role);
        Session()->flash('success', 'Admin Added Successfully');
        return redirect()->route('admin.admin.index');
    }

    public function edit(Admin $admin)
    {
        return view('admin.pages.admins.form', new AdminViewModel($admin));
    }

    public function update(AdminUpdateRequest $request,Admin $admin)
    {
        $data = $request->validated();
        $data['password'] = $request->password == null ? $admin->password : $request->password;
        $admin->update($data);
        Session()->flash('success', 'Admin Updated Successfully');
        $admin->syncRoles($request->role);
        return redirect()->route('admin.admin.index');
    }

    public function destroy(Admin $admin)
    {
        $admin->delete();
        Session()->flash('success', 'Admin Deleted Successfully');
        return redirect()->back();
    }
    
}
