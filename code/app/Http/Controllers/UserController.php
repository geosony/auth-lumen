<?php

namespace App\Http\Controllers;

use App\Models\User;

use App\Traits\ApiResponser;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    use ApiResponser;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     *  Return list of users
     *  @return Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all();

        return $this->sendResponse($users);
    }

    /**
     *  Create a new user
     *  @return Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'name' => 'required|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|max:8|confirmed',
        ];

        $this->validate($request, $rules);
        $fields = $request->all();
        $fields['password'] = Hash::make($request->password);

        $user = User::create();

        return $this->sendResponse($user, Response::HTTP_CREATED);
    }

    /**
     *  get an user
     *  @return Illuminate\Http\Response
     */
    public function show($user)
    {
        $userDetails = User::findOrFail($user);

        return $this->sendResponse($userDetails);
    }

    /**
     *  Update an user
     *  @return Illuminate\Http\Response
     */
    public function update(Request $request, $user)
    {
        $rules = [
            'name' => 'max:255',
            'email' => 'required|email|unique:users,email,' . $user,
            'password' => 'required|max:8|confirmed',
        ];

        $this->validate($request, $rules);

        $userDetails = User::findOrFail($user);

        $userDetails->fill($request->all());

        if ($request->has('password')) {
            $userDetails->password = Hash::make($request->password);
        }

        if ($userDetails->isClean()) {
            return $this->errorResponse('Atleast one value need to be changed', Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $userDetails->save();

        return $this->sendResponse($userDetails);
    }

    /**
     *  Remove an user
     *  @return Illuminate\Http\Response
     */
    public function destroy($user)
    {
        $userDetails = User::findOrFail($user);

        $userDetails->delete();

        return $this->sendResponse($userDetails);
    }

    /**
     *  Identify existing user
     *  @return Illuminate\Http\Response
     */
    public function me(Request $request)
    {
        return $this->sendResponse($request->user());
    }
}
