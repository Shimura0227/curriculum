@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">会員登録</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('signup.resister') }}">
                        @csrf

                        <div class="md-form">
                            <label for="name">ユーザー名</label>
                            {{ $input["name"] }}
                            <input class="form-control" type="hidden" id="name" name="name" required value="{{ $input["name"] }}">
                        </div>
                
                        <div class="md-form">
                            <label for="name">メールアドレス</label>
                            {{ $input["email"] }}
                            <input class="form-control" type="hidden" id="email" name="email" required value="{{ $input["email"] }}">
                        </div>
                
                        <div class="md-form">
                            <label for="password">パスワード</label>
                            {{ $input["password"] }}
                            <input class="form-control" type="hidden" id="password" name="password" required value="{{ $input["password"] }}">
                        </div>
                
                        <button class="btn btn-block blue-gradient mt-2 mb-2" type="submit" name="back"">戻って変更する</button>
                        <button class="btn btn-block blue-gradient mt-2 mb-2" type="submit">確認して登録する</button>
                
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
