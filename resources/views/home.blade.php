@extends('layouts.app')

@section('title', 'Home')

@section('content')
    <div class="container py-4">
        <h2 class="mb-4 text-center">{{ __('Users List') }}</h2>

        <form method="GET" action="{{ route('home') }}" class="mb-4">
            <div class="row g-3">
                <div class="col-md-12">
                    <input type="text" name="search" class="form-control" placeholder="{{ __('Search by name') }}"
                        value="{{ request('search') }}">
                </div>
                <hr>
                <div class="col-md-4 col-12">
                    <select name="gender[]" multiple class="form-select select2"
                        data-placeholder="{{ __('Filter by gender') }}">
                        <option value="male"{{ in_array('male', request('gender', [])) ? 'selected' : '' }}>
                            {{ __('Male') }}
                        </option>
                        <option value="female" {{ in_array('female', request('gender', [])) ? 'selected' : '' }}>
                            {{ __('Female') }}
                        </option>
                    </select>
                </div>
                <div class="col-md-4 col-12">
                    <select name="city[]" multiple class="form-select select2"
                        data-placeholder="{{ __('Filter by city') }}">
                        <option></option>
                        @foreach ($cities as $city)
                            <option value="{{ $city->id }}"
                                {{ in_array($city->id, request('city', [])) ? 'selected' : '' }}>
                                {{ $city->city }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="col-md-4 col-12">
                    <select name="profession[]" multiple class="form-select select2"
                        data-placeholder="{{ __('Filter by profession') }}">
                        <option></option>
                        @foreach ($professions as $profession)
                            <option value="{{ $profession->id }}"
                                {{ in_array($profession->id, request('profession', [])) ? 'selected' : '' }}>
                                {{ $profession->name }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn btn-warning btn-sm">
                    <i class="fas fa-search"></i> {{ __('Filter') }}
                </button>
            </div>
        </form>

        <div class="row row-cols-1 row-cols-md-4 g-4">
            @foreach ($users as $user)
                <div class="col">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column align-items-center justify-content-center">
                            @if ($user->avatars()->where('is_active', true)->first())
                                            <div class="avatar-container mb-3">
                                                <img src="{{ asset('storage/avatars/' . $user->avatars()->where('is_active', true)->first()->profession->image) }}"
                                                    alt="{{ $user->name }}" class="avatar-img">
                                            </div>
                                        @else
                                            <div
                                                class="bg-secondary text-white d-flex justify-content-center align-items-center mb-3 avatar-placeholder">
                                                {{ strtoupper(substr($user->name, 0, 1)) }}
                                            </div>
                                        @endif
                            <h5 class="text-center"> <a href="{{ route('profile.show',['id'=> $user->id]) }}" class="text-decoration-none">{{ $user->name }}</a></h5>
                            <form method="POST" action="{{ route('add-friend', $user->id) }}">
                                @csrf
                                @if (auth()->user())
                                    @if (auth()->user()->friendship->contains($user))
                                        @if (auth()->user()->friendship()->where('friend_id', $user->id)->where('status', 'unverified')->exists())
                                            <span class="text-muted">{{ __('Waiting confirmation.') }}
                                            @else
                                                <button type="submit" name="friend_option" value="remove"
                                                    class="btn btn-danger btn-sm">
                                                    <i class="fas fa-user-minus"></i> {{ __('Remove Friend') }}
                                                </button>
                                        @endif
                                    @elseif (auth()->user()->friendshipRequests()->where('user_id', $user->id)->first())
                                        @if (auth()->user()->friendshipRequests()->where('user_id', $user->id)->first()->status == 'unverified')
                                        <input name="friends_id" class="d-none" value="{{auth()->user()->friendshipRequests()->where('user_id', $user->id)->first()->id}}">
                                            <button type="submit" name="friend_option" value="confirm"
                                                class="btn btn-success btn-sm">
                                                <i class="fas fa-user-check"></i> {{ __('Confirm Friend') }}
                                            </button>
                                        @endif
                                    @else
                                        <button type="submit" name="friend_option" value="add"
                                            class="btn btn-primary btn-sm">
                                            <i class="fas fa-user-plus"></i> {{ __('Add Friend') }}
                                        </button>
                                    @endif
                                @else
                                    <button type="submit" name="friend_option" value="add"
                                        class="btn btn-primary btn-sm">
                                        <i class="fas fa-user-plus"></i> {{ __('Add Friend') }}
                                    </button>
                                @endif
                            </form>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="mt-4">
            {{ $users->links() }}
        </div>
    </div>
@endsection
