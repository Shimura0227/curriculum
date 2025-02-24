@extends('layouts.app')

@section('content')
<div class="container">
  <div class="card">
    <div class="d-flex justify-content-center m-4">
      <h2 class="text-danger">削除しますか？</h2>
    </div>
      <form action="{{route('users.destroy',['user'=>($user->id)])}}" method="post">
        @csrf
        @method('DELETE')
            <input type="hidden" name="id" id="id" value="{{$user->id}}">
          <div class="d-flex justify-content-between m-3">
            <a type="button" class="btn btn-secondary" href="/main">戻る</a>
            <button class="btn btn-danger" type="submit">削除</button>
          </div>
        </div>
      </form>
  </div>
</div>

@endsection