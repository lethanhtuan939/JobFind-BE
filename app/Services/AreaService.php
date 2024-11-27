<?php

namespace App\Services;

use App\Models\Area;

class AreaService
{
    protected $area;

    public function __construct(Area $area)
    {
        $this->area = $area;
    }

    public function getAllAreas()
    {
        return $this->area->all();
    }

    public function getAreaById($id)
    {
        return $this->area->find($id);
    }

    public function createArea($params)
    {
        return $this->area->create($params);
    }

    public function updateArea($id, $params)
    {
        $area = $this->getAreaById($id);
        if ($area) {
            $area->update($params);
            return $area;
        }
        return null;
    }

    public function deleteArea($id)
    {
        $area = $this->getAreaById($id);
        if ($area) {
            $area->delete();
            return true;
        }
        return false;
    }
}
