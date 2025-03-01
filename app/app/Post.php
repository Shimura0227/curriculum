<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class Post extends Model
{
    //
    use SoftDeletes;

    protected $fillable = [
        'user_id',
        'title',
        'movie',
        'contents',
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function comments(){
        return $this->hasMany(Comment::class);
    }

    public function bookmarks(){
        return $this->hasMany(Bookmark::class);
    }
}
