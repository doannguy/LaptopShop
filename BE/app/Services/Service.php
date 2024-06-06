<?php

namespace App\Services;

abstract class Service
{
    protected $model;

    public function __construct()
    {
        $this->setModel();
    }
    abstract public function setModel();

    public function getAll()
    {
        return $this->model->get();
    }

    public function get($id)
    {
        return $this->model->find($id);
    }

    public function store($data)
    {
        return $this->model->create($data);
    }

    public function delete($ids)
    {
        return $this->model->whereIn("id",$ids)->delete();
    }

    public function update($id, $data)
    {
        $result = $this->model->find($id);
        return $result->update($data);
    }
}

