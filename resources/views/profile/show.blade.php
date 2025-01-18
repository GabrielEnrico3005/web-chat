@extends('layouts.app')

@section('title', __('Profile'))

@section('content')
    <div class="container py-4">


        <div class="row">
            <div class="col-12 d-flex align-items-end">
                <!-- Foto Profil -->
                @if ($user->avatars()->where('is_active', true)->first())
                    <img src="{{ asset('storage/avatars/' . $user->avatars()->where('is_active', true)->first()->profession->image) }}" alt="{{ $user->name }}"
                        class="img-thumbnail rounded-circle me-3" style="width: 150px; height: 150px; object-fit: cover;">
                @else
                    <div class="bg-secondary text-white rounded-circle d-flex justify-content-center align-items-center me-3"
                        style="width: 150px; height: 150px; font-size: 24px;">
                        {{ strtoupper(substr($user->name, 0, 1)) }}
                    </div>
                @endif
                <span class="mb-0 h2 fw-bold ml-2">{{ $user->name }}</span>
            </div>


            <div class="col-12">
                <hr>
                <div class="d-flex justify-content-end">
                    <form method="POST" action="{{ route('add-friend', $user->id) }}">
                        @csrf
                        @if (auth()->user())
                            @if (auth()->user()->friendship->contains($user))
                                @if (auth()->user()->friendship()->where('friend_id', $user->id)->where('status', 'unverified')->exists())
                                    <i class="fas fa-user-friends"></i> <span
                                        class="text-muted">{{ __('Waiting confirmation.') }}
                                    @else
                                        <button type="submit" name="friend_option" value="remove"
                                            class="btn btn-danger btn-sm">
                                            <i class="fas fa-user-minus"></i> {{ __('Remove Friend') }}
                                        </button>
                                @endif
                            @elseif (auth()->user()->friendshipRequests()->where('user_id', $user->id)->first())
                                @if (auth()->user()->friendshipRequests()->where('user_id', $user->id)->first()->status == 'unverified')
                                    <input name="friends_id" class="d-none"
                                        value="{{ auth()->user()->friendshipRequests()->where('user_id', $user->id)->first()->id }}">
                                    <button type="submit" name="friend_option" value="confirm"
                                        class="btn btn-success btn-sm">
                                        <i class="fas fa-user-check"></i> {{ __('Confirm Friend') }}
                                    </button>
                                @endif
                            @else
                                <button type="submit" name="friend_option" value="add" class="btn btn-primary btn-sm">
                                    <i class="fas fa-user-plus"></i> {{ __('Add Friend') }}
                                </button>
                            @endif
                        @else
                            <button type="submit" name="friend_option" value="add" class="btn btn-primary btn-sm">
                                <i class="fas fa-user-plus"></i> {{ __('Add Friend') }}
                            </button>
                        @endif
                    </form>
                    @if ($isFriend)
                    <a href="{{ route('messages.index', ['id' => $user->id]) }}" class="btn btn-primary ms-3 btn-sm">
                        <i class="fas fa-comment"></i> {{ __('Send Message') }}
                    </a>
                @endif
                </div>
                <p>{{ __('Welcome to my profile!') }}</p>
                <div class="mb-3">
                    <strong>{{ __('Gender') }}:</strong> {{ ucfirst($user->profile->gender) }}
                </div>
                <div class="mb-3">
                    <strong>{{ __('Date of Birth') }}:</strong>
                    {{ \Carbon\Carbon::parse($user->profile->dob)->format('d M Y') }}
                </div>
                <div class="mb-3">
                    <strong>{{ __('Profession Interest') }}:</strong>
                    {{-- {{ $user->profile->professions->pluck('name')->implode(', ') }} --}}
                    @if ($user->profile->professions->isNotEmpty())
                        @foreach ($user->profile->professions as $profession)
                            <span class="badge bg-info">{{ $profession->name }}</span>
                        @endforeach
                    @else
                        <span class="badge bg-secondary">{{ __('No professions listed') }}</span>
                    @endif
                </div>

                <!-- Tombol Pesan jika sudah berteman -->
                <hr>
                <p class="h4 fw-bold mt-5">{{__('Friend List')}}</p>
                @if ($user->friendshipVisible()->exists())
                    <div class="row row-cols-1 row-cols-md-4 g-4">
                        @foreach ($user->friendshipVisible()->get() as $f)
                        @if($f->user->profile->visibility=='visible')
                            <div class="col">
                                <div class="card h-100">
                                    <div
                                        class="card-body text-center d-flex flex-column align-items-center justify-content-center">
                                        @if ($f->user->avatars()->where('is_active', true)->first())
                                            <div class="avatar-container mb-3">
                                                <img src="{{ asset('storage/avatars/' . $f->user->avatars()->where('is_active', true)->first()->profession->image) }}"
                                                    alt="{{ $f->user->name }}" class="avatar-img">
                                            </div>
                                        @else
                                            <div
                                                class="bg-secondary text-white d-flex justify-content-center align-items-center mb-3 avatar-placeholder">
                                                {{ strtoupper(substr($f->user->name, 0, 1)) }}
                                            </div>
                                        @endif
                                        <h5 class="text-center"> <a href="{{ route('profile.show', ['id' => $f->user->id]) }}"
                                                class="text-decoration-none">{{ $f->user->name }}</a></h5>
                                    </div>
                                </div>
                            </div>   
                        @endif
                        @endforeach
                    </div>
                @else
                    <div class="text-muted text-center mt-4 mb-5">
                        <p>{{ __('Friend list is empty.') }}</p>
                    </div>
                @endif

                <hr>
                <p class="h4 fw-bold mt-5">{{__('Collector Angel')}}</p>
                @if($user->avatars->count()>0)
                <div class="d-flex  flex-wrap">
                    @foreach ($user->avatars as $a)
                    <div class="col-md-2 col-4 px-2 text-center mt-2">
                        <img src="{{ asset('storage/avatars/' . $a->profession->image) }}"
                            alt="{{ $user->name }}" class="img-thumbnail rounded-circle"
                            style="width: 150px; height: 150px; object-fit: cover;">
                    </div>
                    @endforeach
                </div>
                @else
                <div class="text-muted text-center mt-4 mb-5">
                    <p>{{__('Collector Angel is not available.')}}</p>
                </div>
                @endif
            </div>
        </div>
    </div>
@endsection
