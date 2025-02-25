<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Post;
use App\Follow;
use App\like;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $user = Auth::user();
        $posts = Auth::user()->posts()->latest()->paginate(20);

        return view('profile', compact('user', 'posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
        if ($user->id == Auth::id()) {
            return redirect(route('users.index'));
        }

        $posts = Post::where('user_id', ($user->id))->latest()->paginate(20);

        $likes = Like::where('user_id', ($user->id))->get();
        $likes_count = count($likes);

        $follows = Follow::where('followUser_id', (Auth::id()))
            ->where('user_id', ($user->id))
            ->first();

        return view('profile_other', compact('user', 'posts', 'follows','likes_count'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
        $this->authorize('update', $user);
        $user = Auth::user();
        return view('user_edit', compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
        $user = Auth::user();
        $updateUser = $request->all();

        if ($request->image != null) {
            $profileImagePath = $request->image->store('public/profiles');
            $updateUser['image'] = $profileImagePath;
        }

        $user->fill($updateUser)->save();

        return redirect('/users');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //

        $users = User::where('id', $user->id)->first();
        $users->delete();

        return redirect('/users/delete/complete');
    }
}
