@extends('layouts.app')

@section('title', 'Login')

@section('content')
<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-12 mt-5">
                <p class="my-auto"><i class="fa fa-sign-in fa-2x"></i> <span class="card-title h3 ms-1">  {{ __('Login') }}</span>
                </p>
                <hr>
                <p class="text-muted">| {{ __('Please fill the form below to login.') }}</p>
                <form action="{{ route('login.process') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="email" class="form-label">{{__('Email')}}</label>
                        <input type="email" id="email" name="email" class="form-control" value="{{ old('email') }}"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">{{__('Password')}}</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-warning">{{__('Login')}}</button>
                    </div>
                </form>

                <div class="text-center mt-3">
                    <a href="{{ route('register') }}">{{__('Don\'t have an account? Register')}}</a>
                </div>
            </div>
        </div>
    </div>
@endsection
