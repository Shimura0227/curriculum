@extends('layouts.app')

@section('content')
<div class="text-center">
  <div class="d-flex justify-content-around flex-column">
    <div class="d-flex justify-content-center">
      <a type="button" href="{{route('posts.create')}}" class="btn btn-secondary m-5" role="button">新規投稿画面へ</a>
      <a type="button" href="{{route('search')}}" class="btn btn-secondary m-5" role="button">検索画面へ</a>
    </div>
</div>      
<div class="mx-auto">
  <div class="mb-3 mt-4 d-flex justify-content-center">
    {{ $posts->links() }}
  </div>  
  @foreach($posts as $post)
  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 70%;">
    <a href="{{route('posts.show',['post'=>($post->id)])}}" class="text-reset link-underline link-underline-opacity-0">
      <div class="row g-0">
        <div class="col-md-4">
          <div class="m-3">
          <img src="https://img.youtube.com/vi/{{$post['movie_id']}}/mqdefault.jpg" class="img-fluid rounded-start" alt="...">
          </div>
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
