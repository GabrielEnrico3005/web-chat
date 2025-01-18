@extends('layouts.app')

@section('content')
<div class="container">
    <h3 class="mb-4">{{ __('Notifications') }}</h3>
    @forelse ($notifications as $notification)
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">{{ $notification->title }}</h5>
                <p class="card-text">{{ $notification->message }}</p>
                <p class="card-text text-muted">
                    <small>{{ $notification->created_at->diffForHumans() }}</small>
                </p>
            </div>
        </div>
    @empty
        <div class="alert alert-info" role="alert">
            {{ __('No notifications found.') }}
        </div>
    @endforelse

    <div class="mt-3">
        {{ $notifications->links() }}
    </div>
</div>
@endsection
