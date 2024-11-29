<?php

namespace App\Http\Controllers;

use App\Services\PostService;
use Illuminate\Http\Request;
use App\Services\FirebaseService;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Firebase;
use Kreait\Firebase\Storage\Bucket;
use Tymon\JWTAuth\Exceptions\JWTException;

class PostController extends Controller
{
    protected $postService;
    protected $firebaseService;

    public function __construct(PostService $postService, FirebaseService $firebaseService)
    {
        $this->postService = $postService;
        $this->firebaseService = $firebaseService;
    }

    public function index(Request $request)
    {
        $filters = [
            'category_id' => $request->query('category_id'),
            'area_id' => $request->query('area_id'),
            'company_id' => $request->query('company_id'),
            'form_of_work_ids' => $request->query('form_of_work_ids', []),
            'experience_levels' => $request->query('experience_levels', []),
            'salary_min' => $request->query('salary_min'),
            'salary_max' => $request->query('salary_max')
        ];

        $pageSize = $request->query('s', 5);
        $page = $request->query('p', 1);
        $search = $request->query('q', "");

        if ($this->hasFilters($filters)) {
            $posts = $this->postService->advancedSearchPosts($filters, $pageSize, $page);
        } else {
            $posts = $this->postService->getAllPosts($pageSize, $page, $search);
        }

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    private function hasFilters($filters)
    {
        foreach ($filters as $key => $value) {
            if (!empty($value)) {
                return true;
            }
        }
        return false;
    }

    public function show($id)
    {
        return response()->json([
            'code' => 200,
            'message' => 'Post retrieved successfully',
            'data' => $this->postService->getPostById($id)
        ]);
    }

    public function store(Request $request)
    {
        $post = $this->postService->createPost($request->all());
        return response()->json($post, 201);
    }

    public function update(Request $request, $id)
    {
        $post = $this->postService->updatePost($id, $request->all());
        return response()->json($post);
    }

    public function destroy($id)
    {
        $this->postService->deletePost($id);
        return response()->json([
            'code' => 204,
            'message' => 'Post deleted successfully'
        ], 204);
    }

    public function getByCategory($categoryId, Request $request)
    {
        $pageSize = $request->query('s', 10);
        $page = $request->query('p', 1);

        $posts = $this->postService->getPostsByCategory($categoryId, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function getByCompany($companyId, Request $request)
    {
        $pageSize = $request->query('s', 10);
        $page = $request->query('p', 1);

        $posts = $this->postService->getPostsByCompany($companyId, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function getByFormOfWork($formOfWorkId, Request $request)
    {
        $pageSize = $request->query('pageSize', 10);
        $page = $request->query('page', 1);

        $posts = $this->postService->getPostsByFormOfWork($formOfWorkId, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function getByArea($areaId, Request $request)
    {
        $pageSize = $request->query('pageSize', 10);
        $page = $request->query('page', 1);

        $posts = $this->postService->getPostsByArea($areaId, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function getByCategoryAndCompany($companyId, $categoryId, Request $request)
    {
        $pageSize = $request->query('pageSize', 10);
        $page = $request->query('page', 1);

        $posts = $this->postService->getPostsByCategoryAndCompany($categoryId, $companyId, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function getByTag($tagId, Request $request)
    {
        $pageSize = $request->query('pageSize', 10);
        $page = $request->query('page', 1);

        $posts = $this->postService->getPostsByTag($tagId, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function advancedSearch(Request $request)
    {
        $filters = [
            'category_id' => $request->query('category_id'),
            'company_id' => $request->query('company_id'),
            'area_id' => $request->query('area_id'),
            'form_of_work_ids' => $request->query('form_of_work_ids', []),
            'experience_levels' => $request->query('experience_levels', []),
            // 'posted_within_days' => $request->query('posted_within_days', []),
            'salary_min' => $request->query('salary_min'),
            'salary_max' => $request->query('salary_max')
        ];

        $pageSize = $request->query('s', 10);
        $page = $request->query('p', 1);

        $posts = $this->postService->advancedSearchPosts($filters, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function apply(Request $request, $postId)
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json([
                'code' => 401,
                'message' => 'Unauthorized'
            ], 401);
        }

        $request->validate([
            'cv' => 'file|mimes:pdf,doc,docx',
            'cover_letter' => 'nullable|string',
            'subject' => 'nullable|string',
        ]);

        // if($request->file('cv')) {
        //     $cvUrl = $this->firebaseService->uploadFile($request->file('cv'));
        // } else {
        //     $cvUrl = "";
        // }

        // $cvUrl = $this->firebaseService->uploadFile($request->file('cv'));
        $cvUrl = "";

        $data = [
            'cv' => $cvUrl,
            'cover_letter' => $request->input('cover_letter'),
            'subject' => $request->input('subject'),
        ];

        $application = $this->postService->applyForJob($user, $postId, $data);

        return response()->json([
            'code' => 200,
            'message' => 'Job application submitted successfully',
            'data' => $application
        ], 200);
    }

    public function getUserAppliedPosts(Request $request)
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json([
                'code' => 401,
                'message' => 'Unauthorized'
            ], 401);
        }

        $pageSize = $request->query('s', 10);
        $page = $request->query('p', 1);

        $result = $this->postService->getUserAppliedPosts($user->id, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $result['data'],
            'pagination' => $result['pagination']
        ], 200);
    }

    public function getPostsByKeywordAndCategoryAndArea(Request $request) {
        $keyword = $request->query('keyword');
        $categoryId = $request->query('category_id');
        $areaId = $request->query('area_id');
        $pageSize = $request->query('s', 10);
        $page = $request->query('p', 1);

        $posts = $this->postService->getPostsByKeywordAndCategoryAndArea($keyword, $categoryId, $areaId, $pageSize, $page);

        return response()->json([
            'code' => 200,
            'message' => 'Posts retrieved successfully',
            'data' => $posts->items(),
            'pagination' => [
                'total' => $posts->total(),
                'size' => $posts->perPage(),
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'from' => $posts->firstItem(),
                'to' => $posts->lastItem(),
            ]
        ], 200);
    }

    public function getTopNewestPosts()
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
            $posts = $this->postService->getTopNewestPosts();
    
            return response()->json([
                'code' => 200,
                'message' => 'Top 5 newest posts retrieved successfully',
                'data' => $posts
            ], 200);
        } catch(JWTException $e) {
            throw new JWTException('Unauthorized', 401);
        }
    }
}