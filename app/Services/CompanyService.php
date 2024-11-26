<?php

namespace App\Services;

use App\Models\Company;

class CompanyService
{
    protected $company;

    public function __construct(Company $company)
    {
        $this->company = $company;
    }

    public function getAllCompanies()
    {
        return $this->company->all();
    }

    public function getCompanyById($id)
    {
        return $this->company->find($id);
    }

    public function createCompany($params)
    {
        return $this->company->create($params);
    }

    public function updateCompany($id, $params)
    {
        $company = $this->getCompanyById($id);

        if ($company) {
            $company->update($params);
            return $company;
        }

        return null;
    }

    public function deleteCompany($id)
    {
        $company = $this->getCompanyById($id);

        if ($company) {
            $company->delete();
            return true;
        }

        return false;
    }
}
