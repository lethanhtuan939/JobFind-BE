<?php

namespace App\Services;

use App\Models\Category;

class CategoryService
{
    protected $category;

    public function __construct(Category $category)
    {
        $this->category = $category;
    }

    public function getAllCategories()
    {
        return $this->category->all();
    }

    public function getCategoryById($id)
    {
        return $this->category->find($id);
    }

    public function createCategory(array $data)
    {
        return $this->category->create($data);
    }

    public function updateCategory($id, array $data)
    {
        $category = $this->getCategoryById($id);

        if ($category) {
            $category->update($data);
            return $category;
        }

        return null;
    }

    public function deleteCategory($id)
    {
        $category = $this->getCategoryById($id);

        if ($category) {
            $category->delete();
            return true;
        }

        return false;
    }
}
