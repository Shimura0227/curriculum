@extends('layouts.app')

@section('content')
<form action="{{route('users.update',['user'=>($user->id)])}}" method="post">
  @csrf
  @method('PATCH')
  <label name="image" id="image">アイコン</label>
  <input type="file" name="image" id="image" value="{{$user->image}}">
  <label name="name" id="name">ユーザー名</label>
  <textarea name="name" id="name" >{{$user->name}}</textarea>
  <label name="profile" id="profile">プロフィール</label>
  <textarea name="profile" id="profile">{{$user->profile}}</textarea>
  <p>この内容で保存しますか？</p>
  <button type="submit">保存</button>
</form>

@endsection
