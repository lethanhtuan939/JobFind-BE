<?php

namespace App\Services;

use App\Models\Post;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Carbon\Carbon;

class PostService
{
    public function getAllPosts($pageSize = 5, $page = 1, $search = null)
    {
        $query = Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category']);
        
        if($search) {
            $query->where(function ($q) use ($search) {
                $q->Where('title', 'like', '%' . $search . '%')
                ->orWhere('description', 'like', '%' . $search . '%')
                ->orWhere('status', 'like', '%' . $search . '%')
                ->orWhere('benefit', 'like', '%' . $search . '%');
            });

        }

        return $query->paginate($pageSize, ['*'], 'page', $page);
    }

    public function getPostById($id)
    {
        return Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category'])->findOrFail($id);
    }

    public function createPost(array $data)
    {
        $this->validatePost($data);

        $tags = $data['tags'] ?? [];
        $levels = $data['levels'] ?? [];
        $positions = $data['positions'] ?? [];
        $users = $data['users'] ?? [];

        unset($data['tags'], $data['levels'], $data['positions'], $data['users']);

        $post = Post::create($data);

        $post->tags()->sync($tags);
        $post->levels()->sync($levels);
        $post->positions()->sync($positions);
        $post->users()->sync($users);

        return $post->load(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category']);
    }

    public function updatePost($id, array $data)
    {
        $this->validatePost($data);

        $post = Post::findOrFail($id);

        $tags = $data['tags'] ?? [];
        $levels = $data['levels'] ?? [];
        $positions = $data['positions'] ?? [];
        $users = $data['users'] ?? [];

        unset($data['tags'], $data['levels'], $data['positions'], $data['users']);

        $post->update($data);

        $post->tags()->sync($tags);
        $post->levels()->sync($levels);
        $post->positions()->sync($positions);
        $post->users()->sync($users);

        return $post->load(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category']);
    }

    public function deletePost($id)
    {
        $post = Post::findOrFail($id);
        if($post) {
            $post->status = 'deleted';
            $post->save();
        }

        return $post;
    }

    public function getPostsByCategory($categoryId, $pageSize = 10, $page = 1)
    {
        return Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category'])
            ->where('category_id', $categoryId)
            ->paginate($pageSize, ['*'], 'page', $page);
    }

    public function getPostsByCompany($companyId, $pageSize = 10, $page = 1)
    {
        return Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category'])
            ->where('company_id', $companyId)
            ->paginate($pageSize, ['*'], 'page', $page);
    }

    public function getPostsByFormOfWork($formOfWorkId, $pageSize = 10, $page = 1)
    {
        return Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category'])
            ->where('form_of_work_id', $formOfWorkId)
            ->paginate($pageSize, ['*'], 'page', $page);
    }

    public function getPostsByArea($areaId, $pageSize = 10, $page = 1)
    {
        return Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category'])
            ->where('area_id', $areaId)
            ->paginate($pageSize, ['*'], 'page', $page);
    }

    public function getPostsByTag($tagId, $pageSize = 10, $page = 1)
    {
        return Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category'])
            ->whereHas('tags', function ($query) use ($tagId) {
                $query->where('tags.id', $tagId);
            })
            ->paginate($pageSize, ['*'], 'page', $page);
    }

    public function getPostsByCategoryAndCompany($categoryId, $companyId, $pageSize = 10, $page = 1)
    {
        return Post::with(['tags', 'levels', 'positions', 'users', 'company', 'area', 'formOfWork', 'category'])
            ->where('category_id', $categoryId)
            ->where('company_id', $companyId)
            ->paginate($pageSize, ['*'], 'page', $page);
    }
    
    public function advancedSearchPosts($filters, $pageSize = 10, $page = 1, $search = null)
    {
        $query = Post::with(['company', 'category', 'formOfWork', 'tags', 'levels', 'positions', 'area']);

        if (!empty($search)) {
            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', '%' . $search . '%')
                  ->orWhere('description', 'like', '%' . $search . '%')
                  ->orWhere('status', 'like', '%' . $search . '%')
                  ->orWhere('benefit', 'like', '%' . $search . '%');
            });
        }

        if (!empty($filters['category_id'])) {
            $query->where('category_id', $filters['category_id']);
        }

        if (!empty($filters['company_id'])) {
            $query->where('company_id', $filters['company_id']);
        }

        if (!empty($filters['area_id'])) {
            $query->where('area_id', $filters['area_id']);
        }

        if (!empty($filters['form_of_work_ids'])) {
            $query->whereIn('form_of_work_id', $filters['form_of_work_ids']);
        }

        if (!empty($filters['experience_levels'])) {
            $query->whereHas('levels', function ($q) use ($filters) {
                $q->whereIn('name', $filters['experience_levels']);
            });
        }

        if (!empty($filters['posted_within_days'])) {
            $query->where(function ($q) use ($filters) {
                foreach ($filters['posted_within_days'] as $days) {
                    $date = Carbon::now()->subDays($days);
                    $q->orWhere('created_at', '>=', $date);
                }
            });
        }

        if (!empty($filters['salary_min'])) {
            $query->where('salary', '>=', $filters['salary_min']);
        }

        if (!empty($filters['salary_max'])) {
            $query->where('salary', '<=', $filters['salary_max']);
        }

        return $query->paginate($pageSize, ['*'], 'page', $page);
    }

    public function applyForJob($user, $postId, $data)
    {
        $post = Post::findOrFail($postId);
        $data['status'] = 'Applied';

        $post->users()->attach($user, $data);

        return $post->users()->where('user_id', $user->id)->first();
    }

    public function getUserAppliedPosts($userId, $pageSize = 10, $page = 1)
    {
        $user = User::findOrFail($userId);
        $posts = $user->posts()
            ->with(['company', 'category', 'formOfWork', 'tags', 'levels', 'positions'])
            ->paginate($pageSize, ['*'], 'page', $page);

        $userPosts = $posts->map(function ($post) use ($user) {
            return [
                'user' => $user,
                'post' => $post,
                'coverLetter' => $post->pivot->cover_letter,
                'subject' => $post->pivot->subject,
                'status' => $post->pivot->status,
                'created_at' => $post->pivot->created_at,
                'updated_at' => $post->pivot->updated_at,
            ];
        });

        return [
            'data' => $userPosts,
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ];
    }

    public function getTopNewestPosts($limit = 5)
    {
        return Post::with(['company', 'category', 'formOfWork', 'tags', 'levels', 'positions', 'area'])
            ->orderBy('created_at', 'desc')
            ->limit($limit)
            ->get();
    }

    private function validatePost(array $data)
    {
        $validator = Validator::make($data, [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'status' => 'required|string',
            'company_id' => 'nullable|exists:company,id',
            'area_id' => 'nullable|exists:area,id',
            'due_at' => 'nullable|date',
            'benefit' => 'nullable|string',
            'form_of_work_id' => 'nullable|exists:form_of_work,id',
            'amount' => 'nullable|integer',
            'salary' => 'nullable|numeric',
            'category_id' => 'nullable|exists:category,id',
            'tags' => 'array',
            'tags.*' => 'exists:tag,id',
            'levels' => 'array',
            'levels.*' => 'exists:level,id',
            'positions' => 'array',
            'positions.*' => 'exists:position,id',
            'users' => 'array',
            'users.*' => 'exists:user,id',
        ]);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
    }
}