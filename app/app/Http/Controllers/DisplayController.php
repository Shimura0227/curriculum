<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Comment;
use App\Replie;
use App\Bookmark;
use App\like;
use App\Follow;

class DisplayController extends Controller
{
    //

    public function main()
    {

        $posts = Post::latest()->paginate(20);

        return view('mainpage', compact('posts'));
    }

    public function search()
    {

        $posts = Post::latest()->paginate(20);

        return view('search', compact('posts'));
    }

    public function commentSubmit(Request $request){

        $comment = new Comment;

        $columns = ['user_id', 'post_id', 'commentContents'];

        foreach ($columns as $column) {
            $comment->$column = $request->$column;
        }

        $comment->save();

        $post_id=$comment->post_id;

        return redirect(route('posts.show',['post'=>$post_id]));
    }

    public function replySubmit(Request $request){

        $reply = new Replie;

        $columns = ['user_id', 'comment_id', 'replyContents'];

        foreach ($columns as $column) {
            $reply->$column = $request->$column;
        }

        $reply->save();

        $replies = Replie::with(['comment:id,post_id'])
        ->first();

        $post_id=$replies->comment->post_id;

        return redirect(route('posts.show',['post'=>$post_id]));
    }


}
