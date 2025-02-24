@extends('layouts.app')

@section('content')
    
<div class="mx-auto">

  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 60%;">
    <div class="row g-0">
      <div class="col-md-4">
        <div class="m-3">
          @if ($user->image === null)
            <img class="rounded-circle" src="{{ asset('default.png') }}" alt="プロフィール画像" width="100" height="100">
          @else
            <img class="rounded-circle" src="{{ Storage::url($user->image) }}" alt="プロフィール画像" width="100" height="100">
          @endif
        </div>
      </div>
      <div class="col-md-8">
        <div class="text-left card-body">
          <h5 class="card-title">{{$user->name}}</h5>
          <p class="card-text">{{$user->profile}}</p>
          <p class="card-text"><small class="text-body-secondary">{{$user->created_at}}</small></p>
        </div>
      </div>
    </div>
    <div class="d-flex justify-content-end">
      @if (empty($follows))
      <a type="button" class="btn btn-info m-3" href="{{route('createFollow',['user'=>($user->id)])}}">フォロー</a>
      @else
      <a type="button" class="btn btn-info m-3" href="{{route('deleteFollow',['user'=>($user->id)])}}">フォロー中</a>
      @endif
    </div>
  </div>

  <div class="mb-3 mt-4 d-flex justify-content-center">
    {{ $posts->links() }}
  </div>  
  @foreach($posts as $post)
  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 60%;">
    <a href="{{route('posts.show',['post'=>($post->id)])}}" class="text-reset link-underline link-underline-opacity-0">
      <div class="row g-0">
        <div class="col-md-4">
          
          


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
