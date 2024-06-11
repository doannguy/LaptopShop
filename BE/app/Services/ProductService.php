<?php

namespace App\Services;

use App\Models\Product;
use App\Models\ProductOption;
use Illuminate\Support\Facades\DB;

class ProductService extends Service
{
    function setModel()
    {
        $this->model = new Product();
    }
    function mediaService()
    {
        return app(MediaService::class);
    }
    function productOptionService()
    {
        return app(ProductOptionService::class);
    }

    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;
        $sort = $data['order'][0]['dir'] ?? 'desc';

        $query = $this->model::query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%");
        }

        $query->orderBy('id', $sort);
        $recordsFiltered = $recordsTotal = $query->count();
        $categories = $query->skip($skip)
            ->withCount(['productOptions'])
            ->take($pageLength)
            ->with(['brand', 'productSeri', 'thumbnailMedia'])
            ->get();

        return [
            "draw" => $data['draw'] ?? 1,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            'data' => $categories
        ];
    }

    public function store($data)
    {
        DB::beginTransaction();
        try {
            // Save product

            $product = new $this->model();
            $product->name = $data->name;
            $product->product_seri_id = $data->product_seri_id;
            $product->brand_id = $data->brand_id;
            $media_thumbnail = $this->mediaService()->saveFile($data->thumbnail, 'thumbnail', 'product/thumbnail');
            $product->thumbnail = $media_thumbnail->id;
            $product->short_description = $data->short_description;
            $product->description = $data->description;
            // create slug
            $slug = $product->name;
            $product->slug = \Str::slug($slug, '-');

            $product->save();
            // Save product option
            $product_options_json = json_decode($data->product_options, true);
            foreach ($product_options_json as $key => $value) {
                $value['key'] = $key;
                $value['product_id'] = $product->id;
                $value["product_option_image_file"] = $data["product_option_image_" . $key];
                $this->productOptionService()->store($value);
            }
            DB::commit();
            return true;
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::info($e);
            // xóa thumbnail đã lưu
            $this->mediaService()->deleteFile($media_thumbnail->id);
            throw new \Exception($e->getMessage(), 400);
        }
    }

    public function delete($data)
    {
        try {
            $product = Product::find($data['id']);
            $this->mediaService()->deleteFile($product->thumbnail);
            $product->thumbnailMedia()->delete();
            // Xóa product Options
            $product_options = $product->productOptions;
            foreach ($product_options as $product_option) {
                $this->productOptionService()->delete($product_option->id);
            }
            $product->delete();
            return true;
        } catch (\Throwable $th) {
            \Log::info($th);
            return false;
        }

    }
    public function filterProductList($filterData)
    {
        $page = $filterData['page'] ?? 1;
        $pageSize = $filterData['pageSize'] ?? 10;
        $query = ProductOption::query();
        $brandCount = [];
        $seriCount = [];
        $orderBy = $filterData['orderBy'] ?? 'id';
        $orderDir = $filterData['orderDir'] ?? 'asc';
        $query->with(['product', 'productMedia']);
        if (isset($filterData['search'])) {
            $query->whereHas('product', function ($query) use ($filterData) {
                $query->where('name', 'like', "%" . $filterData['search'] . "%");
            });
        }
        if (isset($filterData['product_seri'])) {
            $query->whereHas('product', function ($query) use ($filterData) {
                $query->where('product_seri_id', $filterData['product_seri']);
            });

        }
        if (isset($filterData['brand'])) {
            $query->whereHas('product', function ($query) use ($filterData) {
                $query->where('brand_id', $filterData['brand']);
            });
        }
        $query->where('status', ProductOption::STATUS['active']);
        $totalProduct = $query->count();
        $productOptionTotal = $query->get();
        foreach ($productOptionTotal as $productOption) {
            $brandCount[$productOption->product->brand_id] = isset($brandCount[$productOption->product->brand_id]) ? [...$brandCount[$productOption->product->brand_id], 'count' => $brandCount[$productOption->product->brand_id]['count'] + 1] : ['count' => 1, 'label' => $productOption->product->brand->name];
            $seriCount[$productOption->product->product_seri_id] = isset($seriCount[$productOption->product->product_seri_id]) ? [...$seriCount[$productOption->product->product_seri_id], 'count' => $seriCount[$productOption->product->product_seri_id]['count'] + 1] : ['count' => 1, 'label' => $productOption->product->productSeri->name];
        }

        $query->orderBy($orderBy, $orderDir);
        $query->offset(($page - 1) * $pageSize);
        $query->limit($pageSize);
        $totalPages = ceil($totalProduct / $pageSize);
        $products = $query->get();
        return [
            'products' => $products,
            'totalPages' => $totalPages,
            'totalProduct' => $totalProduct,
            'brandCount' => $brandCount,
            'seriCount' => $seriCount
        ];
    }
    function getProductDetail($id) {
        $product = Product::where('id', $id)->with(['productOptions' => function ($query) {
            $query->with(['productMedia', 'attributeValues']);
        }]);

        return $product->first();

    }
}