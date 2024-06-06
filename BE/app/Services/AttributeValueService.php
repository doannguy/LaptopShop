<?php

namespace App\Services;
use App\Models\AttributeValue;

class AttributeValueService extends Service
{
    public function setModel() {
        $this->model = new AttributeValue();
    }
    public function getByAttributeId($id) {
        return $this->model->where('attribute_id', $id)->get();
    }
}
