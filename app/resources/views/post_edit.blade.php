@extends('layouts.app')

@section('content')

<div class="container">
  <div class="card">
    <div class="d-flex justify-content-center m-4">
      <h2>投稿編集</h2>
    </div>
    <form action="{{route('postEditConf',['post'=>$posts->id])}}" method="post" >
      @csrf
      <div class="d-flex flex-column m-3">
        <div class="d-flex flex-column m-3">
          <label name="title" id="title">タイトル</label>
          <input type="text" name="title" id="title" value="{{($posts->title)}}">
          <label name="movie" id="movie">動画URL</label>
          <input type="text" name="movie" id="movie" value="{{($posts->movie)}}">
          <label name="contents" id="contents">投稿本文</label>
          <textarea type="text" class="form-control" name="contents" id="contents" rows="10">{{($posts->contents)}}</textarea>
          <input type="hidden" name="id" id="id" value="{{($posts->id)}}">
        </div>
        <div class="d-flex justify-content-end">
          <button class="btn btn-info" type="submit">編集確認</button>
        </div>
      </div>
    </form>
  </div>
</div>

@endsection
