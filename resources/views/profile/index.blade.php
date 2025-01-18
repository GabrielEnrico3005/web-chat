@extends('layouts.app')

@section('title', __('My Profile'))

@section('content')
    <div class="container py-4">


        <div class="row">
            <div class="col-12 d-flex justify-content-end justify-items-center">
                <div class="d-flex justify-items-center">
                    <a type="button" href="{{ route('purchase.coin') }}" class="btn btn-circle btn-success me-2">
                        <i class="fa fa-plus"></i>
                    </a>
                    <span class="h4 fw-bold my-auto">
                        <i class="fa fa-wallet"></i> {{ number_format($user->getWalletBalance(), 0, ',', '.') }}
                    </span>
                </div>
                <div>
                    <a type="button" href="{{ route('profile.visible') }}" class="btn btn-circle btn-primary ms-5">
                        @if($user->profile->visibility=='visible')
                        <i class="fa fa-eye"></i> {{__('Hidden My Profile')}}
                        @else
                        <i class="fa fa-eye-slash"></i> {{__('Show My Profile')}}
                        @endif
                    </a>
                </div>
                



            </div>
            <div class="col-12 d-flex align-items-end">
                <!-- Foto Profil -->
                @if($user->profile->visibility=='unvisible')
                    <img src="{{ asset('storage/avatars/' .$user->profile->bear) }}" alt="{{ $user->name }}"
                    class="img-thumbnail rounded-circle me-3" style="width: 150px; height: 150px; object-fit: cover;">
                @elseif ($user->avatars()->where('is_active', true)->first())
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
                <p>{{ __('My Profile!') }}</p>
                <form action="{{ route('profile.update') }}" method="POST">
                    @csrf
                    <div class="px-2">
                        <p class="h5">{{ __('Account Information') }}</p>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="name" class="form-label">{{ __('Name') }}</label>
                                <input type="text" id="name" name="name" class="form-control"
                                    value="{{ $user->name }}">
                            </div>
                            <div class="col-md-6 col-12">
                                <label for="email" class="form-label">{{ __('Email') }}</label>
                                <input type="email" id="email" name="email" class="form-control"
                                    value="{{ $user->email }}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="password" class="form-label">{{ __('Password') }}
                                    ({{ __('Leave blank if not change') }})</label>
                                <input type="password" id="password" name="password" class="form-control">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="px-2">
                        <p class="h5">{{ __('Profile Information') }}</p>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="gender" class="form-label">{{ __('Gender') }}</label>
                                <select id="gender" name="gender" class="form-select">
                                    <option value="male" {{ $user->profile->gender == 'male' ? 'selected' : '' }}>
                                        {{ __('Male') }}</option>
                                    <option value="female" {{ $user->profile->gender == 'female' ? 'selected' : '' }}>
                                        {{ __('Female') }}</option>
                                </select>
                            </div>
                            <div class="col-md-6 col-12">
                                <label for="linkedin" class="form-label">{{ __('LinkedIn Username') }} <small
                                        class="text-muted">https://www.linkedin.com/in/<span
                                            class="text-danger fw-bold">{{ __(key: 'username') }}</span></small></label>
                                <input type="text" id="linkedin" name="linkedin" class="form-control"
                                    value="{{ $user->profile->linkedin }}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="mobile_number" class="form-label">{{ __('Mobile Number') }}</label>
                                <input type="number" id="mobile_number" name="mobile_number" class="form-control"
                                    value="{{ $user->profile->mobile_number }}">
                            </div>
                            <div class="col-md-6 col-12">
                                <label for="dob" class="form-label">{{ __('Date of Birth') }}</label>
                                <input type="date" id="dob" name="dob" class="form-control"
                                    value="{{ $user->profile->dob }}">
                            </div>
                        </div>
                    </div>
                    <div class="px-2">
                        <p class="h5">{{ __('Interests') }}</p>
                        <div class="mb-3">
                            <label for="profession" class="form-label">{{ __('Profession') }}</label>
                            <select id="profession" name="profession[]" class="form-select select2" multiple>
                                @foreach ($professions as $profession)
                                    <option value="{{ $profession->id }}"
                                        {{ in_array($profession->id, $user->profile->professions()->pluck('professions.id')->toArray()) ? 'selected' : '' }}>
                                        {{ $profession->name }}
                                    </option>
                                @endforeach
                            </select>

                        </div>
                        <div class="mb-3">
                            <label for="city" class="form-label">{{ __('Preferred Location') }}</label>
                            <select id="city" name="city[]" class="form-select select2" multiple>
                                @foreach ($cities as $city)
                                    <option value="{{ $city->id }}"
                                        {{ in_array($city->id, $user->profile->cities()->pluck('cities.id')->toArray()) ? 'selected' : '' }}>
                                        {{ $city->city }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-warning w-100 mt-2">{{ __('Save') }}</button>
                </form>

                <!-- Tombol Pesan jika sudah berteman -->
                <hr>
                <p class="h4 fw-bold mt-5">{{ __('Friend List') }}</p>
                @if (auth()->user()->friendshipVisible()->exists())
                    <div class="row row-cols-1 row-cols-md-4 g-4">
                        @foreach (auth()->user()->friendshipVisible()->get() as $f)
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
                <p class="h4 fw-bold mt-5">{{ __('Collector Angel') }}</p>
                @if (auth()->user()->avatars->count() > 0)
                    <div class="d-flex flex-wrap">
                        @foreach (auth()->user()->avatars as $a)
                            <div class="col-md-2 col-4 px-2 text-center">
                                <img src="{{ asset('storage/avatars/' . $a->profession->image) }}"
                                    alt="{{ $user->name }}" class="img-thumbnail rounded-circle"
                                    style="width: 150px; height: 150px; object-fit: cover;">
                                @if ($user->avatars()->where('is_active', true)->first()->id == $a->id)
                                    <span class="text-success">{{ __('Selected') }}</span>
                                @else
                                    <a class="btn btn-danger"
                                        href="{{ route('profile.avatar.update', ['id' => $a->id]) }}">{{ __('Select') }}</a>
                                @endif
                            </div>
                        @endforeach
                    </div>
                
                @else
                    <div class="text-muted text-center mt-4 mb-5">
                        <p>{{ __('Collector Angel is not available.') }}</p>
                    </div>
                @endif
                <div class="mt-2 text-center">
                    <!-- Button to trigger modal -->
                    <button type="button" class="btn btn-info" data-bs-toggle="modal"
                        data-bs-target="#professionModal">
                        {{ __('Buy Avatars') }}
                    </button>
                </div>
                <!-- Modal for Profession -->
                <div class="modal fade" id="professionModal" tabindex="-1" aria-labelledby="professionModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="professionModalLabel">{{ __('Buy Avatars') }}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="max-height: 60vh; overflow-y: auto;">
                                <div class="row">
                                    @foreach ($avatars as $profession)
                                        <div class="col-md-4 mb-3">
                                            <div class="card">
                                                <img src="{{ asset('storage/avatars/' . $profession->image) }}"
                                                    class="card-img-top" alt="{{ $profession->name }}">
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">{{ $profession->name }}</h5>
                                                    <p class="card-text">
                                                        {{ __('Price: ') }}{{ number_format($profession->avatar_price, 0, ',', '.') }}
                                                    </p>
                                                    <form action="{{ route('purchase.avatar', $profession->id) }}"
                                                        method="POST">
                                                        @csrf
                                                        <button type="submit"
                                                            class="btn btn-primary">{{ __('Buy') }}</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
@endsection
