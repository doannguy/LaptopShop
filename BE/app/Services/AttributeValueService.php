<?php

namespace App\Services;
use App\Models\AttributeValue;

class AttributeValueService extends Service
{
    public function setModel() {
        return new AttributeValue();
    }
    public function getByAttributeId($id) {
        return $this->model->where('attribute_id', $id)->get();
    }
}
