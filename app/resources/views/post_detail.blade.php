@extends('layouts.app')

@section('content')
<div class="">
  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 65%;">
    <div class="card-body">      
        <h2 class="card-title">{{$post->title}}</h2>
        <h6 class="card-subtitle mb-2 text-body-secondary d-flex justify-content-end">{{$post->created_at}}</h6>
      <div class="d-flex flex-row align-items-center">
        <div class="m-1">
          <a href="{{route('users.show',['user'=>($user->id)])}}">
          @if ($user->image === null)
            <img class="rounded-circle" src="{{ asset('default.png') }}" alt="プロフィール画像" width="40" height="40">
          @else
            <img class="rounded-circle" src="{{ Storage::url($user->image) }}" alt="プロフィール画像" width="40" height="40">
          @endif
          </a>
        </div>
          <h6 class="card-subtitle mb-2 text-body-secondary text-secondary">
            <a href="{{route('users.show',['user'=>($user->id)])}}" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover text-secondary">{{$user->name}}
        </a></h6>
      </div>
      <div class="movie"></div>
      <p class="card-text">{{$post->contents}}</p>

      @if ($loginUser_id == $user->id)
      <div class="d-flex justify-content-between">
        <a type="button" class="btn btn-secondary m-5" href="{{route('postDeleteConf',['post'=>($post->id)])}}">削除</a>
        <a type="button" class="btn btn-secondary m-5" href="{{route('posts.edit',['post'=>($post->id)])}}">編集</a>
      </div>
      @else
      <div class="d-flex justify-content-end">
        @if (empty($bookmarks))
        <a type="button" class="btn btn-info m-3" href="{{route('createBookmark',['post'=>($post->id)])}}">ブックマーク</a>
        @else
        <a type="button" class="btn btn-info m-3" href="{{route('deleteBookmark',['post'=>($post->id)])}}">ブックマーク削除</a>
        @endif
      </div>
      @endif

    </div>
  </div>

  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 65%;">
    <div class="m-3">
      <div class="">
        <form method="post" action="{{route('commentSubmit')}}">
          @csrf
            <textarea class="form-control w-100 h-70 rounded" name="commentContents" id="commentContents" placeholder="コメント入力"></textarea>
            <input type="hidden" name="user_id" id="user_id" value="{{Auth::id()}}">
            <input type="hidden" name="post_id" id="post_id" value="{{$post->id}}">
            <div class="d-flex justify-content-end mt-3">
              <button class="" type="submit">送信</button>
            </div>
        </form>
      </div>
    </div>
  </div>


  @foreach($comments as $comment)

  <div class="card mb-3 mx-auto" style="width: 65%;">

    <div class="row g-0">

      <div class="col-md-2">
        <div class="m-4">
          <a href="{{route('users.show',['user'=>($comment->user->id)])}}" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover text-dark">
          @if ($user->image === null)
            <img class="rounded-circle" src="{{ asset('default.png') }}" alt="プロフィール画像" width="65" height="65">
          @else
            <img class="rounded-circle" src="{{ Storage::url($user->image) }}" alt="プロフィール画像" width="65" height="65">
          @endif
          </a>
        </div>
      </div>
      <div class="card-body">
        <h6 class="card-title text-dark">
          <a href="{{route('users.show',['user'=>($comment->user->id)])}}" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover text-dark">
          {{$comment->user->name}}
          </a>
        </h6>
        <h6 class="card-subtitle mb-2 text-body-secondary d-flex justify-content-end">{{$comment->created_at}}</h6>
        <p class="card-text">{{$comment->commentContents}}</p>
      </div>

      <div class="card mb-3 mx-auto d-flex align-middle border border-0" style="width:90%;">
        <div class="m-3">
          <div class="">
            <form method="post" action="{{route('replySubmit')}}">
              @csrf
                <textarea class="form-control w-100 h-70 rounded" name="replyContents" id="replyContents" placeholder="コメント入力"></textarea>
                <input type="hidden" name="user_id" id="user_id" value="{{Auth::id()}}">
                <input type="hidden" name="comment_id" id="comment_id" value="{{$comment->id}}">
                <div class="d-flex justify-content-end mt-3">
                  <button class="" type="submit">送信</button>
                </div>
            </form>
          </div>
        </div>
      </div>

    </div>
      @foreach($comment->replies as $reply)

    <div class="d-flex justify-content-end">

      <div class="card mb-3  border border-0" style="width: 80%;">
        <div class="row g-0">

          <div class="col-md-2">
            <div class="m-4">
              <a href="{{route('users.show',['user'=>($comment->user->id)])}}" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover text-dark">
              @if ($user->image === null)
                <img class="rounded-circle" src="{{ asset('default.png') }}" alt="プロフィール画像" width="60" height="60">
              @else
                <img class="rounded-circle" src="{{ Storage::url($user->image) }}" alt="プロフィール画像"  width="60" height="60">
              @endif
              </a>
            </div>
          </div>
          <div class="card-body">
            <h6 class="card-title text-dark">
              <a href="{{route('users.show',['user'=>($comment->user->id)])}}" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover text-dark">
              {{$reply->user->name}}
              </a>
            </h6>
            <h6 class="card-subtitle mb-2 text-body-secondary d-flex justify-content-end">{{$reply->created_at}}</h6>
            <p class="card-text">{{$reply->replyContents}}</p>
          </div>

        </div>
      </div>

    </div>  

    @endforeach

  </div>

  @endforeach

</div>


@endsection
