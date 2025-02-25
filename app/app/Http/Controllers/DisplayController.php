<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use App\Http\Requests\CommentRequest;
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

    public function search(Request $request)
    {
        $postSearch = Post::latest();

        if (empty($request['keyword'])) {
            $posts = $postSearch->paginate(20);
        } else {
            if ($request['category'] == "all") {
                $posts = $postSearch->where('title', 'like', "%{$request['keyword']}%")
                    ->orwhere('contents', 'like', "%{$request['keyword']}%")->paginate(20);
            } elseif ($request['category'] == "title") {
                $posts = $postSearch->where('title', 'like', "%{$request['keyword']}%")->paginate(20);
            } elseif ($request['category'] == "contents") {
                $posts = $postSearch->where('contents', 'like', "%{$request['keyword']}%")->paginate(20);
            }
        }



        return view('search', compact('posts'));
    }

    public function commentSubmit(CommentRequest $request)
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

        return redirect(route('posts.show', ['post' => ($post->id)]));
    }

    public function deleteBookmark(Post $post)
    {

        $bookmarks = Bookmark::where('user_id', (Auth::id()))
            ->where('post_id', ($post->id))
            ->first();

        $bookmarks->delete();

        return redirect(route('posts.show', ['post' => ($post->id)]));
    }

    public function createFollow(User $user)
    {

        $follow = new Follow;

        $follow->followUser_id = auth::id();
        $follow->user_id = $user->id;

        $follow->save();

        return redirect(route('users.show', ['user' => ($user->id)]));
    }

    public function createLike(Comment $comment)
    {

        $like = new Like;

        $like->user_id = auth::id();
        $like->comment_id = $comment->id;

        $like->save();

        return redirect(route('posts.show', ['post' => ($comment->post_id)]));
    }

    public function deleteFollow(User $user)
    {

        $follow = Follow::where('followUser_id', (Auth::id()))
            ->where('user_id', ($user->id))
            ->first();

            $follow->delete();

        return redirect(route('users.show', ['user' => ($user->id)]));
    }

    public function postConf(PostRequest $request)
    {
        //
        return view(
            'post_conf',
            ['input' => $request]
        );
    }

    public function postEditConf(Request $request)
    {
        //
        return view(
            'post_edit_conf',
            ['posts' => $request]
        );
    }

    public function postDeleteConf(Post $post)
    {
        //
        $posts = Post::find($post)
            ->first();

        return view('post_delete_conf', compact('posts'));
    }

    public function followList()
    {
        //
        $follows = Follow::with('user',)
        ->where('followUser_id', (Auth::id()))
            ->latest()->paginate(20);

        return view('follows', compact('follows'));
    }

    public function bookmarkList()
    {
        //
        $bookmarks = Bookmark::with(['post'])
            ->where('user_id', (Auth::id()))
            ->latest()->paginate(20);

        return view('bookmarks', compact('bookmarks'));
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/login');
    }

    public function userDeleteConf(User $user)
    {
        $users = User::find($user)
            ->first();

        return view('user_delete_conf', compact('user'));
    }

    public function userDeleteComp(User $user)
    {

        return view('user_delete_comp');
    }
}
