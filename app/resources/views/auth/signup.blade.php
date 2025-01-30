@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">会員登録</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('signup.confirm') }}">
                        @csrf
                        <div class="md-form">
                            <label for="name">ユーザー名</label>
                            <input class="form-control {{$errors->has('name') ? 'is-invalid' : '' }}" type="text" id="name" name="name" value="{{ old('name') }}">

                            @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong> {{ $errors->first('name') }}</strong>
                                    </span>
                            @endif
                        </div>
                 
                        <div class="md-form">
                            <label for="email">メールアドレス</label>
                            <input class="form-control {{$errors->has('email') ? 'is-invalid' : '' }}" type="email" id="email" name="email" value="{{ old('email') }}">

                            @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong> {{ $errors->first('email') }}</strong>
                                    </span>
                            @endif
                        </div>
                 
                        <div class="md-form">
                            <label for="password">パスワード</label>
                            <input class="form-control {{$errors->has('password') ? 'is-invalid' : '' }}" type="password" id="password" name="password" value="{{ old('password') }}">

                            @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong> {{ $errors->first('password') }}</strong>
                                    </span>
                            @endif

                            <div class="md-form">
                                <label for="password_confirmation">パスワード再入力</label>
                                <input class="form-control" type="password" id="password_confirmation" name="password_confirmation" value="{{ old('password_confirmation')}}">
                        </div>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-primary text-center" type="submit">新規登録</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
