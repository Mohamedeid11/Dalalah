<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Permission as SpatiePermission;

class Permission extends SpatiePermission
{
    use HasFactory;
    
    public static function permissionsByGroups(string | null $name = ''): Collection
    {
        return self::where('name', 'LIKE', ["%{$name}%"])->get()
            ->groupBy(function ($permissions) {
                $permission = ucfirst(Str::beforeLast($permissions->name, '.'));
                $permission = Str::replace('-', ' ', $permission);

                return __($permission);
            })->mapWithKeys(function ($permissions, $permissionGroupName) {
                return [
                    $permissionGroupName => $permissions
                        ->map(fn ($permission) => [
                            'id' => $permission->id,
                            'name' => __(self::readablePermissionName($permission)),
                            'full_name' => __($permission->name),
                        ])
                        ->toArray(),
                ];
            });
    }

    public static function readablePermissionName($permission)
    {
        $string = Str::afterLast($permission->name, '.');
        $string = ucwords($string);

        return $string;
    }

    public static function getGroupedPermissions(): Collection
    {
        return static::select('id', 'name')->get()->groupBy(function (self $permissions) {
            return Str::beforeLast($permissions->name, '.');
        })->mapWithKeys(function (Collection $permissions, string $permissionGroupName) {
            return [
                $permissionGroupName => $permissions
                    ->map(fn (self $permission) => [
                        'id' => $permission->id,
                        'name' => Str::afterLast($permission->name, '.'),
                        'full_name' => $permission->name,
                    ])->toArray(),
            ];
        });
    }
    
}
