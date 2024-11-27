<?php

namespace App\Services;

use App\Models\Level;

class LevelService
{
    protected $level;

    public function __construct(Level $level)
    {
        $this->level = $level;
    }

    public function getAllLevels()
    {
        return $this->level->all();
    }

    public function getLevelById($id)
    {
        return $this->level->find($id);
    }

    public function createLevel($params)
    {
        return $this->level->create($params);
    }

    public function updateLevel($id, $params)
    {
        $level = $this->getLevelById($id);

        if ($level) {
            $level->update($params);
            return $level;
        }

        return null;
    }

    public function deleteLevel($id)
    {
        $level = $this->getLevelById($id);

        if ($level) {
            $level->delete();
            return true;
        }

        return false;
    }
}