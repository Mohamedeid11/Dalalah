<?php

namespace App\Traits;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\File;
use ZipArchive;


trait HandleUploadFile
{
    
    /**
     * Undocumented function.
     *
     * @param UploadedFile|null $image
     * @return void
     */
    public function updateFile($image, $prefix =''): void
    {
        if (isset($image)) {
            $this->clearMediaCollection($this->getTable().$prefix);
            $this->addMedia($image)->toMediaCollection($this->getTable().$prefix);
        }
    }

    public function updateFiles($images , $prefix =''): void
    {
        if (isset($images)) {
            $this->clearMediaCollection($this->getTable());
            foreach ($images as $key => $image) {
                $this->addMedia($image)->toMediaCollection($this->getTable().$prefix);
            }
        }
    }

    public function storeFile(?UploadedFile $image , $prefix =''): void
    {
        if (isset($image)) {
            $this->addMedia($image)->toMediaCollection($this->getTable().$prefix);
        }
    }

    public function storeFiles(array $images , $prefix =''): void
    {
        if (! empty($images)) {
            foreach ($images as $key => $image) {
                $this->addMedia($image)->toMediaCollection($this->getTable().$prefix);
            }
        }
    }

    public function deleteFiles($prefix =''): void
    {
        $this->clearMediaCollection($this->getTable().$prefix);
    }
    
}
