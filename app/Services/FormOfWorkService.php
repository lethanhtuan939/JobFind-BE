<?php

namespace App\Services;

use App\Models\FormOfWork;

class FormOfWorkService
{
    protected $formOfWork;

    public function __construct(FormOfWork $formOfWork)
    {
        $this->formOfWork = $formOfWork;
    }

    public function getAllFormOfWorks()
    {
        return $this->formOfWork->all();
    }

    public function getFormOfWorkById($id)
    {
        return $this->formOfWork->find($id);
    }

    public function createFormOfWork(array $data)
    {
        return $this->formOfWork->create($data);
    }

    public function updateFormOfWork($id, array $data)
    {
        $formOfWork = $this->getFormOfWorkById($id);

        if ($formOfWork) {
            $formOfWork->update($data);
            return $formOfWork;
        }

        return null;
    }

    public function deleteFormOfWork($id)
    {
        $formOfWork = $this->getFormOfWorkById($id);

        if ($formOfWork) {
            $formOfWork->delete();
            return true;
        }

        return false;
    }
}
