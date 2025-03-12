<?php

use Illuminate\Support\Facades\Route;

Route::redirect('/', 'nsl-admin')->name('home');

// Admin Route...
Route::group(['prefix' => '', 'as' => 'admin.'], function () {
    Route::get('/nsl-admin', [App\Http\Controllers\Auth\AdminLoginController::class, 'login'])->name('nsl_admin');
    Route::post('/nsl-login', [App\Http\Controllers\Auth\AdminLoginController::class, 'login']);
    Route::get('/login-check', [App\Http\Controllers\Auth\AdminLoginController::class, 'loginCheck'])->name('loginCheck');

});

// CKEditor files management only for authenticated user
Route::view('ckfinder/ckfinder', 'ckfinder.ckfinder')->name('ckfinder.ckfinder')->middleware('auth:admin');
