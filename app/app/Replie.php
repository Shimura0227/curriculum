<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Replie extends Model
{
    //
    protected $fillable = [
        'user_id',
        'comment_id',
        'replyContents',
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function comment(){
        return $this->belongsTo(Comment::class);
    }
}
