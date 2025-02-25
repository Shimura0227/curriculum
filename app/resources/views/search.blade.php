@extends('layouts.app')

@section('content')
<div class="text-center">
  <div class="d-flex justify-content-around flex-column">
    <div class="d-flex justify-content-center">
      <div class="m-5 w-50">
        <form action="" method="GET">
          @csrf
          <div class="d-flex flex-column">
            <input type="text" name="keyword" id="keyword">
            <div class="d-flex justify-content-between mt-2">
              <select name="category" data-toggle="select" required>
                <option value="all">全て</option>
                <option value="title">タイトル</option>
                <option value="contents">内容</option>
              </select>
              <input type="submit" value="検索">
            </div>
          </div>
        </form>
    </div>
  </div>
</div>    
<div class="mx-auto">
  <div class="mb-3 mt-4 d-flex justify-content-center">
    {{ $posts->links() }}
  </div>  
  @foreach($posts as $post)
  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 80%;">
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
