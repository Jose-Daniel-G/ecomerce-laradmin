@extends('layouts.auth')

@section('title', 'Iniciar Sesión')

@section('content')
<div class="register_wrap section_padding_b">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-7 col-md-9">
                <div class="register_form padding_default shadow_sm">
                    <h4 class="title_2">Login</h4>
                    <p class="mb-4 text_md">Login if you are a returning customer</p>

                    <!-- Formulario de Login funcional de Laravel -->
                    <form method="POST" action="{{ route('welcome.login') }}">
                        @csrf

                        <div class="row">
                            <!-- Email -->
                            <div class="col-12">
                                <div class="single_billing_inp">
                                    <label for="email">Email Address <span>*</span></label>
                                    <input id="email" type="email" name="email" value="{{ old('email') }}" required autofocus placeholder="example@mail.com">
                                    @error('email')
                                        <span class="text-danger small">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="col-12">
                                <div class="single_billing_inp">
                                    <label for="password">Password <span>*</span></label>
                                    <input id="password" type="password" name="password" required autocomplete="current-password" placeholder="type password">
                                    @error('password')
                                        <span class="text-danger small">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <!-- Remember + Forgot -->
                            <div class="col-12 mt-2 d-flex justify-content-between align-items-center">
                                <div class="check_2 d-flex align-items-center">
                                    <input type="checkbox" class="check_inp" id="remember_me" name="remember">
                                    <label for="remember_me">Remember Me</label>
                                </div>

                                @if (Route::has('password.request'))
                                    <a href="{{ route('password.request') }}" class="text-color">Forgot Password?</a>
                                @endif
                            </div>

                            <!-- Botón -->
                            <div class="col-12 mt-3">
                                <button type="submit" class="default_btn xs_btn rounded px-4 d-block w-100">
                                    Login
                                </button>
                            </div>
                        </div>
                    </form>

                    <div class="dif_regway my-3">
                        <span class="txt">Or login with</span>
                    </div>

                    {{-- <div class="d-flex">
                        <a href="#" class="default_btn xs_btn rounded px-4 d-block w-50 text-capitalize bg-facebook text-center">
                            <i class="fab fa-facebook-f me-2"></i> Facebook
                        </a>
                        <a href="#" class="default_btn xs_btn rounded px-4 d-block w-50 ms-3 text-capitalize bg-google text-center">
                            <i class="fab fa-google me-2"></i> Google
                        </a>
                    </div> --}}

                    <p class="text-center mt-3 mb-0">
                        Don't have an account? <a href="{{ route('welcome.register') }}" class="text-color">Register Now</a>
                    </p>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
