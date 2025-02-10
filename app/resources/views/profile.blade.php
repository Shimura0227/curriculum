@extends('layouts.app')

@section('content')
    
<div class="mx-auto">

  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 60%;">
    <div class="row g-0">
      <div class="col-md-4">
        @if($user->image == null)
          <img src="/storage/noimage.png" class="img-fluid rounded-start">
        @else
          <img src="/storage/{{$user->image}}" class="img-fluid rounded-start">
        @endif
      </div>
      <div class="col-md-8">
        <div class="text-left card-body">
          <h5 class="card-title">{{$user->name}}</h5>
          <p class="card-text">{{$user->profile}}</p>
          <p class="card-text"><small class="text-body-secondary">{{$user->created_at}}</small></p>
        </div>
      </div>
    </div>
  </div>

  <a type="button" class="btn btn-secondary m-5" href="{{route('users.edit',['user'=>($user->id)])}}">編集</a>
  <a type="button" class="btn btn-secondary m-5" href="#!">投稿登録</a>
  <a type="button" class="btn btn-secondary m-5" href="#!">ログアウト</a>

  <div class="mb-3 mt-4 d-flex justify-content-center">
    {{ $posts->links() }}
  </div>  
  @foreach($posts as $post)
  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 60%;">
    <a href="#!" class="text-reset link-underline link-underline-opacity-0">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="..." class="img-fluid rounded-start" alt="...">
        </div>
        <div class="col-md-8">
          <div class="text-left card-body">
            <h5 class="card-title">{{$post->title}}</h5>
            <p class="card-text">{{mb_strimwidth(($post->contents),0,200,'…','UTF-8')}}</p>
            <p class="card-text"><small class="text-body-secondary">{{$post->created_at}}</small></p>
          </div>
        </div>
      </div>
    </a>
  </div>
  @endforeach
  <div class="mb-3 mt-4 d-flex justify-content-center">
    {{ $posts->links() }}
  </div>
</div>

@endsection
