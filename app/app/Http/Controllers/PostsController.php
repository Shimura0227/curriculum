<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Post;
use App\User;
use App\Comment;
use App\Bookmark;
use App\Replie;
use App\Follow;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //


        return view('post_regist');
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
        if ($request->input('back') == 'back') {
            return redirect(route('posts.create'))->withInput();
        }

        $post = new Post;

        $columns = ['user_id', 'title', 'movie', 'contents'];

        foreach ($columns as $column) {
            $post->$column = $request->$column;
        }

        $post->save();

        return redirect('/main');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
        $loginUser_id = Auth::id();

        $postUser_id = $post->user_id;
        $user = User::find($postUser_id);

        $comments = Comment::with(['user:id,name,image', 'replies', 'replies.user:id,name,image'])
            ->where('comments.post_id', ($post->id))
            ->get();

        $bookmarks = Bookmark::where('user_id', (Auth::id()))
            ->where('post_id', ($post->id))
            ->first();

        return view('post_detail', compact('post', 'user', 'comments', 'bookmarks', 'loginUser_id'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        //
        $posts = Post::find($post)
        ->first();

        

        return view('post_edit', compact('posts'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        //
        if ($request->input('back') == 'back') {
            return redirect(route('posts.edit',['post'=>$post]))->withInput();
        }

        $posts = Post::where('id',$post->id)->first();

        $columns = ['user_id','title', 'movie', 'contents'];

        foreach ($columns as $column) {
            $posts->$column = $request->$column;
        }
        

        $posts->save();

        return redirect(route('posts.show',['post'=>($posts->id)]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        //

        $posts = Post::where('id',$post->id)->first();

        $posts->delete();

        return redirect('/main');
    }
}
