@extends('layouts.app')

@section('content')
<div class="text-center">
    <p>登録完了しました！</p>
</div>

<div class="d-flex justify-content-center">
    <a href="{{route('/login')}}"><button class="btn btn-primary text-center" >ログイン画面へ</button></a>
</div>
@endsection
