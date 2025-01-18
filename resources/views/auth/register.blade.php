@extends('layouts.app')

@section('title', __('Register'))

@section('content')
    {{-- {{dd(config('app.locale'))}} --}}
    <div class="container">
        <!-- Card Wrapper -->
        <div class="row justify-content-center">
            <div class="col-md-10 col-12 mt-5">
                <p><i class="fa fa-user-plus fa-3x"></i> <span class="ms-1 card-title h3">   {{ __('Create new Account') }}</span></p>
                <hr>
                <p class="text-muted">| {{ __('Please fill the form below to create a new account.') }}</p>
                <form action="{{ route('register') }}" method="POST">
                    @csrf
                    <div class="px-2">
                        <p class="h5">{{__('Account Information')}}</p>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="name" class="form-label">{{ __('Name') }}</label>
                                <input type="text" id="name" name="name" class="form-control"
                                    value="{{ old('name') }}">
                            </div>
                            <div class="col-md-6 col-12">
                                <label for="email" class="form-label">{{ __('Email') }}</label>
                                <input type="email" id="email" name="email" class="form-control"
                                    value="{{ old('email') }}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="password" class="form-label">{{ __('Password') }}</label>
                                <input type="password" id="password" name="password" class="form-control">
                            </div>
                            <div class="col-md-6 col-12">
                                <label for="password_confirmation" class="form-label">{{ __('Confirm Password') }}</label>
                                <input type="password" id="password_confirmation" name="password_confirmation"
                                    class="form-control">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="px-2">
                        <p class="h5">{{__('Profile Information')}}</p>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="gender" class="form-label">{{ __('Gender') }}</label>
                                <select id="gender" name="gender" class="form-select">
                                    <option value="male" {{ old('gender') == 'male' ? 'selected' : '' }}>
                                        {{ __('Male') }}</option>
                                    <option value="female" {{ old('gender') == 'female' ? 'selected' : '' }}>
                                        {{ __('Female') }}</option>
                                </select>
                            </div>
                            <div class="col-md-6 col-12">
                                <label for="linkedin" class="form-label">{{ __('LinkedIn Username') }} <small class="text-muted">https://www.linkedin.com/in/<span class="text-danger fw-bold">{{__(key: 'username')}}</span></small></label>
                                <input type="text" id="linkedin" name="linkedin" class="form-control"
                                    value="{{ old('linkedin') }}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                <label for="mobile_number" class="form-label">{{ __('Mobile Number') }}</label>
                                <input type="number" id="mobile_number" name="mobile_number" class="form-control"
                                    value="{{ old('mobile_number') }}">
                            </div>
                            <div class="col-md-6 col-12">
                                <label for="dob" class="form-label">{{ __('Date of Birth') }}</label>
                                <input type="date" id="dob" name="dob" class="form-control"
                                    value="{{ old('dob') }}">
                            </div>
                        </div>
                    </div>
                    <div class="px-2">
                        <p class="h5">{{__('Interests')}}</p>
                        <div class="mb-3">
                            <label for="profession" class="form-label">{{ __('Profession') }}</label>
                            <select id="profession" name="profession[]" class="form-select select2" multiple>
                                @foreach ($professions as $profession)
                                    <option value="{{ $profession->id }}"
                                        {{ in_array($profession->id, old('profession', [])) ? 'selected' : '' }}>
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
                                        {{ in_array($city->id, old('city', [])) ? 'selected' : '' }}>
                                        {{ $city->city }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    @php 
                        $reg_price = rand(100000, 125000);
                    @endphp
                    <div class="mb-3 d-none">
                        <label for="registration_price" class="form-label">{{ __('Registration Price') }}</label>
                        <input type="text" id="registration_price" name="registration_price" class="form-control" value="{{ $reg_price }}" >
                    </div>
                    <hr>
                    
                    <div class="mt-2 text-center mb-4">
                        <small class="text-muted">
                            {{ __('By registering, you agree to pay the registration fee of') }} 
                            <strong>Rp {{ number_format($reg_price, 0, ',', '.') }}</strong>.
                        </small>
                    </div>
                    
                    <button type="submit" class="btn btn-warning w-100">{{ __('Register') }}</button>
                </form>
            </div>
        </div>
    </div>
@endsection
