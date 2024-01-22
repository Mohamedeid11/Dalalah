<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Http\Requests\Admin\RoleStoreRequest;
use App\Http\Requests\Admin\RoleUpdateRequest;
use App\Models\Permission;
use App\ViewModels\RoleViewModel;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('permission:roles.read', ['only' => ['index']]);
        $this->middleware('permission:roles.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:roles.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:roles.delete', ['only' => ['destroy']]);
    }

    public function index()
    {
        $roles = Role::paginate();
        return view('admin.pages.roles.index',compact('roles'));
    }

    public function create()
    {
        return view('admin.pages.roles.form' , new RoleViewModel());
    }

    public function store(RoleStoreRequest $roleRequest)
    {
        $role =  Role::create($roleRequest->validated() + ['guard_name' => 'admin']);
        $role->givePermissionTo($roleRequest->permissions);
        Session()->flash('success', 'Role Added Successfully');
        return redirect()->route('admin.role.index');
    }

    public function show(Role $role)
    {
        return view('admin.pages.roles.show' , new RoleViewModel($role));
    }

    public function edit(Role $role)
    {
        return view('admin.pages.roles.form' , new RoleViewModel($role));
    }

    public function  update(RoleUpdateRequest $roleRequest ,Role $role)
    {
        $role->update($roleRequest->validated());
        $role->syncPermissions($roleRequest->permissions);
        Session()->flash('success', 'Role Updated Successfully');
        return redirect()->route('admin.role.index');
    }

    public function destroy(Role $role)
    {
        $role->delete();
        Session()->flash('success', 'Role Deleted Successfully');
        return redirect()->back();
    }
  
}
