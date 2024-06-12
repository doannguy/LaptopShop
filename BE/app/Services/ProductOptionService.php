<?php

namespace App\Services;
use App\Models\ProductMedia;
use App\Models\ProductOption;

class ProductOptionService extends Service
{
    public function setModel() {
        return new ProductOption();
    }
    function mediaService()
    {
        return app(MediaService::class);
    }
    public function store($data, ) {
        $product_option = $this->model->create([
            'name' => $data['name'],
            "amount" => $data["amount"],
            "price" => $data["price"],
            "current_price" => $data["current_price"],
            "status" => $data["status"],
            "product_id" => $data["product_id"],
        ]);
        $product_option_image_file = $data["product_option_image_file"];
        // create product media
        $product_medias = [];
        if (isset($product_option_image_file)) {
            foreach ($product_option_image_file as  $image_file) {
                $media = $this->mediaService()->saveFile($image_file, 'product_option', 'product/product_option');
                $product_medias[] = [
                    "media_id" => $media->id,
                ];
            }
          $product_option->productMedia()->attach($product_medias);

        } else {
            throw new \Exception("Thiếu ảnh sản phẩm", 400);
        }
        // create product attribute values
        $product_attribute_values = $data["product_attribute_values"];
        if(isset($product_attribute_values) && count($product_attribute_values) > 0) {
            $product_option->attributeValues()->attach($product_attribute_values);
        }

        return true;
    }
    public function delete($id) {
        $product_option = $this->model->find($id);
        $productMedia = $product_option->productMedia;
        foreach ($productMedia as $media) {
            $this->mediaService()->deleteFile($media->id);
        }
        $product_option->productMedia()->detach();
        // xóa product attribute values
        $product_option->attributeValues()->detach();
        return $product_option->delete();
    }
}
