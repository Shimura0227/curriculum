@extends('layouts.app')

@section('content')
<div class="container">
  <div class="card">
    <div class="d-flex justify-content-center m-4">
      <h2 class="text-danger">削除しますか？</h2>
    </div>
      <form action="{{route('posts.destroy',['post'=>($posts->id)])}}" method="post">
        @csrf
        @method('DELETE')
        <div class="d-flex flex-column m-3">
          <div class="d-flex flex-column m-3">
            <label name="title" id="title">タイトル</label>
            {{$posts["title"]}}
            <input type="hidden" name="title" id="title" value="{{$posts["title"]}}">
            <label name="movie" id="movie">動画URL</label>
            {{$posts["movie"]}}
            <input type="hidden" name="movie" id="movie" value="{{$posts["movie"]}}">
            <label name="contents" id="contents">投稿本文</label>
            {!! nl2br(htmlspecialchars($posts["contents"])) !!}
            <input type="hidden" name="contents" id="contents" value="{{$posts["contents"]}}">
            <input type="hidden" name="user_id" id="user_id" value="{{Auth::id()}}">
          </div>
          <div class="d-flex justify-content-between m-3">
            <a type="button" class="btn btn-secondary" href="{{route('posts.show',['post'=>($posts->id)])}}">戻る</a>
            <button class="btn btn-danger" type="submit">削除</button>
          </div>
        </div>
      </form>
  </div>
</div>

@endsection
