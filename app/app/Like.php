<?php

namespace App;

use COM;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    //
    public function user(){
        return $this->belongsTo(User::class);
    }

    public function post(){
        return $this->belongsTo(Post::class);
    }

    public function comment(){
        return $this->belongsTo(Comment::class);
    }
}
