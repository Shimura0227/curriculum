<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
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

    public function commentSubmit(Request $request)
    {

        $comment = new Comment;

        $columns = ['user_id', 'post_id', 'commentContents'];

        foreach ($columns as $column) {
            $comment->$column = $request->$column;
        }

        $comment->save();

        $post_id = $comment->post_id;

        return redirect(route('posts.show', ['post' => $post_id]));
    }



    public function replySubmit(Request $request)
    {

        $reply = new Replie;

        $columns = ['user_id', 'comment_id', 'replyContents'];

        foreach ($columns as $column) {
            $reply->$column = $request->$column;
        }

        $reply->save();

        $comment = Comment::where('id', ($reply->comment_id))
            ->first();

        $post_id = $comment->post_id;

        return redirect(route('posts.show', ['post' => $post_id]));
    }

    public function iconDelete(User $user)
    {

        $loginUser = Auth::user();
        $loginUser->image = null;

        $loginUser->save();

        return redirect(route('users.edit', ['user' => (Auth::id())]));
    }

    public function createBookmark(Post $post)
    {

        $bookmark = new Bookmark;

        $bookmark->user_id = auth::id();
        $bookmark->post_id = $post->id;

        $bookmark->save();

        return redirect(route('posts.show',['post'=>($post->id)]));
    }

    public function deleteBookmark(Post $post)
    {

        $bookmarks = Bookmark::where('user_id', (Auth::id()))
        ->where('post_id',($post->id))
        ->first();

        $bookmarks->delete();

        return redirect(route('posts.show',['post'=>($post->id)]));
    }
}
