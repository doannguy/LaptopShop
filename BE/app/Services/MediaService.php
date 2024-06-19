<?php

namespace App\Services;

use App\Models\Media;
use Illuminate\Http\File;
use Illuminate\Support\Facades\Storage;

class MediaService
{
    protected $disk;
    public function __construct()
    {
        $this->disk = Storage::disk('public');
    }
    public function saveFile($file, $type, $directory = 'uploads',)
    {
        $filename = uniqid() . '.' . $file->getClientOriginalExtension();
        $mimeType = $file->getClientMimeType();
        $this->disk->putFileAs($directory, new File($file->getRealPath()), $filename);
        $path = $directory . '/' . $filename;
       $media = Media::create([
            'type' => $type,
            'path' => $path,
            'mime_type' => $mimeType
        ]);
        return $media;
    }
    public function deleteFile($media_id)
    {
        $media = Media::find($media_id);

        if(!$media) {
            return false;
        }
        $path = $media->path;
        if ($this->disk->exists($path)) {
            $this->disk->delete($path);
            $media->delete();
            return true;
        }
        return false;
    }
    public function fileExists($filename, $directory = 'uploads')
    {
        return $this->disk->exists($directory . '/' . $filename);
    }
    public function getFileUrl($filename, $directory = 'uploads')
    {
        $url = $this->disk->url($directory . '/' . $filename);

        if (app()->environment('local')) {
            if (!str_starts_with($url, 'http://')) {
                $url = 'http://' . str_replace('https://', '', $url);
            }
        } else {
            if (!str_starts_with($url, 'https://')) {
                $url = 'https://' . str_replace('http://', '', $url);
            }
        }
        return $url;
    }
}
