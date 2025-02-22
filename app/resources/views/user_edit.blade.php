@extends('layouts.app')

@section('content')
<div class="container">
  <div class="card">
    <form action="{{route('users.update',['user'=>($user->id)])}}" method="post" enctype="multipart/form-data" class="m-3">
      @csrf
      @method('PATCH')
      <div class="d-flex flex-column">
        <p>アイコン</p>
        <label for="image">
          
          @if ($user->image === null)
            <img class="rounded-circle" src="{{ asset('default.png') }}" alt="プロフィール画像" width="100" height="100">
          @else
            <img class="rounded-circle" src="{{ Storage::url($user->image) }}" alt="プロフィール画像" width="100" height="100">
          @endif
        </label>
        <div class="w-50 m-3">
          <input id="image" name="image" type="file" class="" accept="image/png, image/jpeg">
        </div>
        <div>
          <div>
            <div>
          <a href="{{route('iconDelete',['user'=>($user->id)])}}" class="btn btn-danger" role="button">アイコン削除</a>
            </div>
          </div>
        </div>
        <label name="name" id="name">ユーザー名</label>
        <div class="w-75">
        <textarea name="name" id="name" width="100" >{{$user->name}}</textarea>
        </div>

        <label name="profile" id="profile">プロフィール</label>
        <textarea name="profile" id="profile">{{$user->profile}}</textarea>

      </div>  

      <p>この内容で保存しますか？</p>
      <button type="submit">保存</button>
    </form>
  </div>
</div>

@endsection
