@extends('layouts.app')

@section('content')
<div class="">
  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 65%;">
    <div class="card-body">
      <h2 class="card-title">{{$post->title}}</h2>
      <h6 class="card-subtitle mb-2 text-body-secondary d-flex justify-content-end">{{$post->created_at}}</h6>
        <h6 class="card-subtitle mb-2 text-body-secondary text-secondary">
          <a href="{{route('users.show',['user'=>($user->id)])}}" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover text-secondary">{{$user->name}}
      </a></h6>
      <div class="movie"></div>
      <p class="card-text">{{$post->contents}}</p>

      @if ($loginUser_id == $user->id)
      <div class="d-flex justify-content-between">
        <a type="button" class="btn btn-secondary m-5" href="#!">削除</a>
        <a type="button" class="btn btn-secondary m-5" href="#!">編集</a>
      </div>
      @endif

    </div>
  </div>

  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 65%;">
    <div class="m-3">
      <div class="">
        <form method="post" action="">
          @csrf
            <textarea class="form-control w-100 h-70 rounded" name="contents" id="contents" placeholder="コメント入力">
            </textarea>
            <div class="d-flex justify-content-end mt-3">
              <button class="" type="submit">送信</button>
            </div>
        </form>
      </div>
    </div>
  </div>


  @foreach($comments as $comment)

  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 65%;">

    <div class="card-body">
      <h5 class="card-title text-dark">
        <a href="{{route('users.show',['user'=>($comment->user->id)])}}" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover text-dark">
        {{$comment->user->name}}
        </a>
      </h5>
      <h6 class="card-subtitle mb-2 text-body-secondary d-flex justify-content-end">{{$comment->created_at}}</h6>
      <p class="card-text">{{$post->contents}}</p>
      <div class="d-flex justify-content-between">
        <a type="button" class="btn btn-secondary m-5" href="#!">削除</a>
        <a type="button" class="btn btn-secondary m-5" href="#!">編集</a>
      </div>

    </div>
  </div>

  @endforeach

</div>


@endsection
