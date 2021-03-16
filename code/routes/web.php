<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return "You are not allowed to access this page.";
});

$router->group(['middleware' => 'client.credentials'], function () use ($router) {
    $router->group(['prefix' => 'users'], function () use ($router) {
        $router->get('/', ['uses' => 'UserController@index']);
        $router->post('/', ['uses' => 'UserController@store']);
        $router->put('/{user}', ['uses' => 'UserController@update']);
        $router->delete('/{user}', ['uses' => 'UserController@destroy']);
        $router->get('/{user}', ['uses' => 'UserController@show']);
    });
});

$router->group(['middleware' => 'auth:api'], function () use ($router) {
    $router->group(['prefix' => 'users'], function () use ($router) {
        $router->get('/me', ['uses' => 'UserController@me']);
    });
});
