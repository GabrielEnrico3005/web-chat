@extends('layouts.app')

@section('title', 'Messages')

@section('content')
    <div class="container py-4">
        <h3 class="mb-4">{{__('Messages')}}</h3>
        @if ($threads->count() > 0)
            <ul class="list-group">
                @foreach ($threads as $thread)
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center">
                            @if ($thread['contact']->profile->visibility == 'unvisible')
                                @php
                                    // random nomor 1-3
                                    $random_bear = rand(1, 3);
                                    $path_bear = "bear-$random_bear.png";
                                @endphp
                                <img src="{{ asset('storage/avatars/' . $path_bear) }}" alt="{{ $thread['contact']->name }}"
                                    class="img-thumbnail rounded-circle me-3"
                                    style="width: 50px; height: 50px; object-fit: cover;">
                            @elseif ($thread['contact']->avatars()->where('is_active', true)->first())
                                <img src="{{ asset('storage/avatars/' . $thread['contact']->avatars()->where('is_active', true)->first()->profession->image) }}"
                                    alt="{{ $thread['contact']->name }}" class="img-thumbnail rounded-circle me-3"
                                    style="width: 50px; height: 50px; object-fit: cover;">
                            @else
                                <div class="bg-secondary text-white rounded-circle d-flex justify-content-center align-items-center me-3"
                                    style="width: 50px; height: 50px; font-size: 24px;">
                                    {{ strtoupper(substr($thread['contact']->name, 0, 1)) }}
                                </div>
                            @endif
                            
                            <div>
                                <h5 class="mb-0">{{ $thread['contact']->name }}</h5>
                                <p class="mb-0 text-muted" style="font-size: 0.9em;">
                                    @if($thread['type']=="avatar")
                                    {{(__('Avatar Chat'))}}
                                    @else
                                    {{ Str::limit($thread['last_message'],100) }}
                                    @endif
                                </p>
                            </div>
                        </div>
                        <div>
                            <span class="text-muted" style="font-size: 0.8em;">
                                {{ $thread['last_time']->diffForHumans() }}
                            </span>
                            <a href="{{ route('messages.index', $thread['contact']->id) }}"
                                class="btn btn-sm btn-primary ms-3">
                                {{__('Open Chat')}}
                            </a>
                        </div>
                    </li>
                @endforeach
            </ul>
        @else
            <p class="text-muted">{{__('No messages available')}}.</p>
        @endif
    </div>
@endsection
