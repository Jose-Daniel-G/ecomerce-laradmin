@extends('layouts.auth')

@section('title', 'Registrarse')
 
@section('content')
    <div class="register_wrap section_padding_b">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-7 col-md-9">
                    <div class="register_form padding_default shadow_sm">
                        <h4 class="title_2">Register</h4>
                        <p class="mb-4 text_md">Register here if you are a new customer.</p>
                        <form action="{{ route('welcome.register') }}" method="post">
                            @csrf

                            {{-- Name field --}}
                            <div class="input-group mb-3">
                                <input type="text" name="name"
                                    class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}"
                                    placeholder="Nombre" autofocus>

                                <div class="input-group-text">
                                    <span class="fas fa-user {{ config('adminlte.classes_auth_icon', '') }}"></span>
                                </div>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            {{-- Last Name field --}}
                            <div class="input-group mb-3">
                                <input type="text" name="last_name"
                                    class="form-control @error('last_name') is-invalid @enderror"
                                    value="{{ old('last_name') }}" placeholder="Apellido" autofocus>

                                <div class="input-group-text">
                                    <span class="fas fa-user {{ config('adminlte.classes_auth_icon', '') }}"></span>
                                </div>

                                @error('last_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <label for="document_type">Tipo de documento</label>

                            <select class="nice_select mb-3" id="document_type" name="document_type">
                                <option value="" selected disabled>Seleccione</option>
                                <option value="1">DNI</option>
                                <option value="2">CE</option>
                                <option value="3">RUC</option>
                                <option value="4">PP</option>
                                <option value="5">LE</option>
                                <option value="6">ID</option>
                            </select>

                            {{-- Document number field --}}
                            <div class="input-group mb-3">
                                <input type="text" name="document_number"
                                    class="form-control @error('document_number') is-invalid @enderror"
                                    value="{{ old('document_number') }}" placeholder="Número de documento">
                                    
                                @error('document_number')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            {{-- Email field --}}
                            <div class="input-group mb-3">

                                <input type="email" name="email"
                                    class="form-control @error('email') is-invalid @enderror" value="{{ old('email') }}"
                                    placeholder="{{ __('adminlte::adminlte.email') }}">

                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            {{-- Phone field --}}
                            <div class="input-group mb-3">
                                <input type="text" name="phone"
                                    class="form-control @error('phone') is-invalid @enderror" value="{{ old('phone') }}"
                                    placeholder="Número de documento">
                                @error('phone')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            {{-- Password field --}}
                            <div class="input-group mb-3">
                                <input type="password" name="password"
                                    class="form-control @error('password') is-invalid @enderror"
                                    placeholder="{{ __('adminlte::adminlte.password') }}">

                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            {{-- Confirm password field --}}
                            <div class="input-group mb-3">
                                <input type="password" name="password_confirmation"
                                    class="form-control @error('password_confirmation') is-invalid @enderror"
                                    placeholder="{{ __('adminlte::adminlte.retype_password') }}">

                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>

                                @error('password_confirmation')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            {{-- Register button --}}
                            <button type="submit"
                                class="btn btn-block {{ config('adminlte.classes_auth_btn', 'btn-flat btn-primary') }}">
                                <span class="fas fa-user-plus"></span>
                                {{ __('adminlte::adminlte.register') }}
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
