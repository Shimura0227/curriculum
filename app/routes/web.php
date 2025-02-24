<?php

use Illuminate\Support\Facades\Route;
use app\Http\Controllers\HomeController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\DisplayController;
use app\Http\Controllers\PostsController;
use app\Http\Controllers\UsersController;
use Doctrine\DBAL\Logging\Middleware;
use Illuminate\Support\Facades\Auth;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/



Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');

/*Route::redirect('/register/confirm', '/register')->name('signup');
Route::post('/register', [App\Http\Controllers\Auth\RegisterController::class, 'confirm'])->name('signup.conf');
Route::post('/register/confirm', [App\Http\Controllers\Auth\RegisterController::class, 'confirm'])->name('signup.conf');
Route::post('/register/complete', [App\Http\Controllers\Auth\RegisterController::class, 'register'])->name('signup.comp');
*/

Route::get('/signup', [RegisterController::class, 'signupForm'])->name('signup');
Route::post('/signup/confirm', [RegisterController::class, 'signupPost'])->name('signup.confirm');
Route::get('/signup/confirm', [RegisterController::class, 'confirm']);
Route::post('/signup/complete', [RegisterController::class, 'signupComplete'])->name('signup.complete');
Route::get('/signup/complete', [RegisterController::class, 'complete']);
Route::get('/users/delete/complete', [DisplayController::class, 'userDeleteComp'])->name('userDeleteComp');

Route::group(['middleware' => 'auth'], function () {
    Route::get('/main', [DisplayController::class, 'main']);
    Route::get('/search', [DisplayController::class, 'search'])->name('search');
    Route::post('/comment', [DisplayController::class, 'commentSubmit'])->name('commentSubmit');
    Route::post('/reply', [DisplayController::class, 'replySubmit'])->name('replySubmit');
    Route::get('/iconDelete', [DisplayController::class, 'iconDelete'])->name('iconDelete');
    Route::get('/followList', [DisplayController::class, 'followList'])->name('followList');
    Route::get('/bookmarkList', [DisplayController::class, 'bookmarkList'])->name('bookmarkList');
    Route::get('/logout', [DisplayController::class, 'logout'])->name('logout');
    Route::get('/createBookmark/{post}', [DisplayController::class, 'createBookmark'])->name('createBookmark');
    Route::get('/deleteBookmark/{post}', [DisplayController::class, 'deleteBookmark'])->name('deleteBookmark');
    Route::get('/createFollow/{user}', [DisplayController::class, 'createFollow'])->name('createFollow');
    Route::get('/deleteFollow/{user}', [DisplayController::class, 'deleteFollow'])->name('deleteFollow');
    Route::post('/posts/create/confirm', [DisplayController::class, 'postConf'])->name('postConf');
    Route::post('/posts/{post}/edit/confirm', [DisplayController::class, 'postEditConf'])->name('postEditConf');
    Route::get('/posts/{post}/delete/confirm', [DisplayController::class, 'postDeleteConf'])->name('postDeleteConf');
    Route::get('/users/{user}/delete/confirm', [DisplayController::class, 'userDeleteConf'])->name('userDeleteConf');
    Route::resource('posts', 'PostsController');
    Route::resource('users', 'UsersController');
});
