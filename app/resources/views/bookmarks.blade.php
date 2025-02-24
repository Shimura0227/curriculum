@extends('layouts.app')

@section('content')
<div class="container d-flex flex-column">

  <div class="mx-auto d-flex justify-content-center">
    <div class="d-flex flex-column">
      <div class="mx-auto d-flex justify-content-center">
        <h2>ブックマーク一覧</h2>
      </div>
      <div class="mb-3 mt-4 d-flex justify-content-center">
        {{ $bookmarks->links() }}
      </div>  
      @foreach($bookmarks as $bookmark)
      <div class="card mb-3 mx-auto d-flex align-middle" style="width: 90%;">
        <a href="{{route('posts.show',['post'=>($bookmark->post->id)])}}" class="text-reset link-underline link-underline-opacity-0">
          <div class="row g-0">
            <div class="col-md-8">
              <div class="text-left card-body">
                <h5 class="card-title">{{$bookmark->post->title}}</h5>
                <p class="card-text">{{mb_strimwidth(($bookmark->post->contents),0,200,'…','UTF-8')}}</p>
                <p class="card-text"><small class="text-body-secondary">{{$bookmark->post->created_at}}</small></p>
              </div>
            </div>
          </div>
        </a>
      </div>
      @endforeach
      <div class="mb-3 mt-4 d-flex justify-content-center">
        {{ $bookmarks->links() }}
      </div>
    </div>
  </div>
</div>
@endsection
