<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;

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
}
