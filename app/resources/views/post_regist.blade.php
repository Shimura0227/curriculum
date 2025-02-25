@extends('layouts.app')

@section('content')

<div class="container">
  <div class="card">
    <div class="d-flex justify-content-center m-4">
      <h2>投稿登録</h2>
    </div>
    <form action="{{route('postConf')}}" method="post" >
      @csrf
      <div class="d-flex flex-column m-3">
        <div class="d-flex flex-column m-3">
          <label name="title" id="title">タイトル</label>
          <input type="text" name="title" id="title" value="{{old('title')}}">
          <label name="movie" id="movie">動画URL</label>
          <input type="text" name="movie" id="movie" value="{{old('movie')}}">
          <label name="contents" id="contents">投稿本文</label>
          <textarea type="text" class="form-control" name="contents" id="contents" rows="10">{{old('contents')}}</textarea>
          <input type="hidden" name="user_id" id="user_id" value="{{Auth::id()}}">
        </div>
        <div class="d-flex justify-content-end">
          <button class="btn btn-info" type="submit">投稿確認</button>
        </div>
      </div>
    </form>
  </div>
</div>

@endsection
