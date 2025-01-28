@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">会員登録</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('signup.post') }}">
                        @csrf
                        <div class="md-form">
                            <label for="name">ユーザー名</label>
                            <input class="form-control @error('name') is-invalid @enderror" type="text" id="name" name="name" value="{{ old('name') }}">

                            @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                        </div>
                 
                        <div class="md-form">
                            <label for="name">メールアドレス</label>
                            <input class="form-control @error('email') is-invalid @enderror" type="email" id="email" name="email" value="{{ old('email') }}">

                            @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                        </div>
                 
                        <div class="md-form">
                            <label for="password">パスワード</label>
                            <input class="form-control @error('password') is-invalid @enderror" type="password" id="password" name="password" value="{{ old('password') }}">

                            @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror

                            <div class="md-form">
                                <label for="password">パスワード再入力</label>
                                <input class="form-control" type="password" id="password" name="password" value="{{ old('password') }}">
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
