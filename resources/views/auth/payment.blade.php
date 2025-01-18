@extends('layouts.app')

@section('title', 'Payment')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-12 mt-5">
                <p><i class="fa fa-receipt fa-3x"></i> <span class="ms-1 card-title h3">   {{ __('Payment of Registration Fee') }}</span></p>
                <p class="text-muted">| {{ __('Please fill the form below to pay the registration fee.') }}</p>
                <hr>

                @if (session('error'))
                    <div class="alert alert-warning">
                        {{ session('error') }}
                    </div>
                @endif

                @if (session('overpaid'))
                    <div class="alert alert-info" id="info-alert">
                        <p>{{ __('Sorry, you overpaid') }} {{ number_format(session('overpaid'), 0, ',', '.') }}.</p>
                        <p>{{ __('Would you like to enter this balance in your wallet') }}?</p>
                        <form action="{{ route('payment.process') }}" method="POST">
                            @csrf
                            <input type="number" value="{{session('amout')}}" id="" name="payment_amount" class="form-control d-none" required>
                            <button type="submit" name="wallet_option" value="yes"
                                class="btn btn-primary">{{ __('Yes') }}</button>
                            <a id="btn-no" href="#" name="wallet_option" 
                                class="btn btn-secondary">{{ __('No') }}</a>
                        </form>
                    </div>
                @endif

                <form action="{{ route('payment.process') }}" method="POST">
                    @csrf
                    <div class="text-center mt-5">
                        <p class="text-muted mb-0">{{ __('Amount to Pay') }}</p>
                        <p class="fw-bold h1 text-danger">{{ number_format($registrationPrice, 0, ',', '.') }}</p>
                    </div>
                    <div class="mb-3">
                        <label for="payment_amount" class="form-label">{{ __('Enter Amount') }}</label>
                        <input type="number" id="payment_amount" name="payment_amount" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">{{ __('Pay') }}</button>
                </form>
            </div>
        </div>
    </div>
@endsection
@push('script')
<script>
    $('#btn-no').on('click', function() {
        $('#info-alert').remove();
        // set fokus
        $('#payment_amount').focus();
    });
</script>
@endpush
