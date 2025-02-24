@extends('layouts.app')

@section('content')
<div class="container d-flex flex-column">
  <div class="d-flex flex-column">
    <div class="d-flex justify-content-center">
      <h2>フォロー一覧</h2>
    </div>
    <div class="mb-3 mt-4 d-flex justify-content-center">
      {{ $follows->links() }}
    </div>  
    @foreach($follows as $follow)
    <div class="card mb-3 mx-auto d-flex align-middle" style="width: 60%;">
      <a href="{{route('users.show',['user'=>($follow->user_id)])}}" class="text-reset link-underline link-underline-opacity-0">
        <div class="row g-0">
          <div class="col-md-4">
            <div class="m-3">
              @if ($follow->user->image === null)
                <img class="rounded-circle" src="{{ asset('default.png') }}" alt="プロフィール画像" width="100" height="100">
              @else
                <img class="rounded-circle" src="{{ Storage::url($follow->user->image) }}" alt="プロフィール画像" width="100" height="100">
              @endif
            </div>
          </div>
          <div class="col-md-8">
            <div class="text-left card-body">
              <h5 class="card-title">{{$follow->user->name}}</h5>
              <p class="card-text">{{mb_strimwidth(($follow->user->profile),0,200,'…','UTF-8')}}</p>
              <p class="card-text"><small class="text-body-secondary">{{$follow->user->created_at}}</small></p>
            </div>
          </div>
        </div>
      </a>
    </div>
    @endforeach
    <div class="mb-3 mt-4 d-flex justify-content-center">
      {{ $follows->links() }}
    </div>
  </div>
</div>
@endsection
