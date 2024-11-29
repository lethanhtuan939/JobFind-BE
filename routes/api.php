<?php

use App\Http\Controllers\AreaController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\FormOfWorkController;
use App\Http\Controllers\LevelController;
use App\Http\Controllers\PositionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TagController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PostController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('v1/levels', [LevelController::class, 'index']);

Route::middleware(['auth:api', 'admin'])->group(function () {
    Route::post('/levels', [LevelController::class, 'store']);
    Route::get('/levels/{id}', [LevelController::class, 'show']);
    Route::put('/levels/{id}', [LevelController::class, 'update']);
    Route::delete('/levels/{id}', [LevelController::class, 'destroy']);
});

Route::get('v1/positions', [PositionController::class, 'index']);
Route::middleware(['auth:api', 'admin'])->group(function () {
    Route::post('/positions', [PositionController::class, 'store']);
    Route::get('/positions/{id}', [PositionController::class, 'show']);
    Route::put('/positions/{id}', [PositionController::class, 'update']);
    Route::delete('/positions/{id}', [PositionController::class, 'destroy']);
});
Route::get('v1/areas', [AreaController::class, 'index']);
Route::middleware('auth:api')->group(function () {
    Route::post('/areas', [AreaController::class, 'store']); 
    Route::get('/areas/{id}', [AreaController::class, 'show']);
    Route::put('/areas/{id}', [AreaController::class, 'update']);
    Route::delete('/areas/{id}', [AreaController::class, 'destroy']);
});


// Route::get('v1/companies', [CompanyController::class, 'index']);
// Route::middleware('auth:api')->group(function () {
//     Route::post('/', [CompanyController::class, 'store']);
//     Route::get('/companies/{id}', [CompanyController::class, 'show']);
//     Route::put('/companies/{id}', [CompanyController::class, 'update']);
//     Route::delete('/companies/{id}', [CompanyController::class, 'destroy']);
// });

Route::group([
    'middleware' => 'api', 'jwt.auth', 'auth',
    'prefix' => 'v1/companies'
], function($router) {
    Route::get('/', [CompanyController::class, 'index']);
    Route::get('/{id}', [CompanyController::class, 'show']);
    Route::post('/', [CompanyController::class, 'store']);
    Route::put('/{id}', [CompanyController::class, 'update']);
    Route::delete('/{id}', [CompanyController::class, 'destroy']);
});

Route::get('v1/form-of-works', [FormOfWorkController::class, 'index']);
Route::middleware('auth:api')->group(function () {
    Route::post('/form-of-works', [FormOfWorkController::class, 'store']);
    Route::get('/form-of-works/{id}', [FormOfWorkController::class, 'show']);
    Route::put('/form-of-works/{id}', [FormOfWorkController::class, 'update']);
    Route::delete('/form-of-works/{id}', [FormOfWorkController::class, 'destroy']);
});

Route::get('v1/categories', [CategoryController::class, 'index']);
Route::middleware('auth:api')->group(function () {
    Route::post('/categories', [CategoryController::class, 'store']);
    Route::get('/categories/{id}', [CategoryController::class, 'show']);
    Route::put('/categories/{id}', [CategoryController::class, 'update']);
    Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);
});


Route::group([
    'middleware' => 'api',
    'prefix' => 'v1/auth'
], function($router) {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/verify-otp', [AuthController::class, 'verifyOtp']);
    Route::post('/resend-otp', [AuthController::class, 'resendOtp']);
    Route::post('/login', [AuthController::class, 'login'])->name('login');
    Route::get('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    Route::get('/social', [AuthController::class, 'socialLogin']);
    Route::post('/social/callback', [AuthController::class, 'socialCallback']);
    Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);
    Route::post('/check-token', [AuthController::class, 'checkToken']);
});

Route::group([
    'middleware' => 'api', 'jwt.auth', 'auth',
    'prefix' => 'v1/tags'
], function($router) {
    Route::get('/all', [TagController::class, 'findAll']);
    Route::get('/', [TagController::class, 'index']);
    Route::get('/{id}', [TagController::class, 'show']);
    Route::post('/', [TagController::class, 'store']);
    Route::put('/{id}', [TagController::class, 'update']);
    Route::delete('/{id}', [TagController::class, 'destroy']);
});

Route::group([
    'middleware' => 'auth.jwt', 'role:ADMIN,HR',
    'prefix' => 'v1/roles'
], function($router) {
    Route::get('/', [RoleController::class, 'index']);
    Route::get('/all', [RoleController::class, 'all']);
    Route::get('/{id}', [RoleController::class, 'show']);
    Route::post('/', [RoleController::class, 'store']);
    Route::put('/{id}', [RoleController::class, 'update']);
    Route::delete('/{id}', [RoleController::class, 'destroy']);
});

Route::group([
    'middleware' => 'api', 'jwt.auth', 'auth',
    'prefix' => 'v1/users'
], function($router) {
    Route::get('/', [UserController::class, 'index']);
    Route::get('/{id}', [UserController::class, 'show']);
    Route::post('/', [UserController::class, 'store']);
    Route::put('/{id}', [UserController::class, 'update']);
    Route::delete('/{id}', [UserController::class, 'destroy']);
    Route::post('/active/{id}', [UserController::class, 'active'])->middleware('auth.jwt', 'role:ADMIN',);
    Route::post('/{userId}/roles', [UserController::class, 'addRoleToUser'])->middleware('auth.jwt', 'role:ADMIN',);
    Route::put('/{userId}/status', [UserController::class, 'changeStatus'])->middleware('auth.jwt', 'role:ADMIN,HR');
});

Route::group([
    'prefix' => 'v1/posts'
], function($router) {
    Route::get('/newest', [PostController::class, 'getTopNewestPosts']);
    Route::get('/applied', [PostController::class, 'getUserAppliedPosts']);
    Route::get('/category/{categoryId}', [PostController::class, 'getByCategory']);
    Route::get('/company/{companyId}', [PostController::class, 'getByCompany']);
    Route::get('/form-of-work/{formOfWorkId}', [PostController::class, 'getByFormOfWork']);
    Route::get('/area/{areaId}', [PostController::class, 'getByArea']);
    Route::get('/tag/{tagId}', [PostController::class, 'getByTag']);
    Route::get('/company/{companyId}/category/{categoryId}', [PostController::class, 'getByCategoryAndCompany']);
    Route::get('/{id}', [PostController::class, 'show']);
    Route::get('/', [PostController::class, 'index']);
    Route::post('/', [PostController::class, 'store'])->middleware('auth.jwt', 'role:ADMIN,HR');
    Route::post('/{postId}/apply', [PostController::class, 'apply']);
    Route::put('/{id}', [PostController::class, 'update'])->middleware('auth.jwt','role:ADMIN,HR');
    Route::delete('/{id}', [PostController::class, 'destroy'])->middleware('auth.jwt','role:ADMIN,HR');
});