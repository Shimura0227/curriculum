@extends('layouts.app')

@section('content')
<div class="">
  <div class="card mb-3 mx-auto d-flex align-middle" style="width: 65%;">
    <div class="card-body">
      <h5 class="card-title">{{$post->title}}</h5>
      <h6 class="card-subtitle mb-2 text-body-secondary">{{$post->created_at}}</h6>
      <div class="movie"></div>
      <p class="card-text">{{$post->contents}}</p>

    </div>
  </div>
</div>


@endsection
