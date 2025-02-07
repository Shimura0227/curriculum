@extends('layouts.app')

@section('content')
<form action="">
  @csrf
  <label name="title" id="title">タイトル</label>
  <input type="text" name="title" id="title">
  <label name="movie" id="movie">動画URL</label>
  <input type="text" name="movie" id="movie">
  <label name="contents" id="contents">投稿本文</label>
  <input type="text" name="contents" id="contents">
  <button type="submit">投稿確認</button>
</form>

@endsection
