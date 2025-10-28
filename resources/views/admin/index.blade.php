@extends('adminlte::page')

@section('title', 'Ecommerce'){{-- @section('plugins.Sweetalert2', true) --}}
@section('css')
    @vite('resources/css/items.css')

@stop

@section('content_header'){{-- <h1><b>Bienvenido:</b> {{ Auth::user()->email }} / <b>Rol:</b> {{ Auth::user()->roles->pluck('name')->first() }}</h1> --}}
@stop
@section('content')
    <div class="row pt-3">
        {{-- Configuracion --}}
        @can('admin.config.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3>{{ $total_configuraciones }}</h3>
                        <p>Configuracion</p>
                    </div>
                    <div class="icon">
                        <i class="fa-solid fa-gear"></i>
                    </div>
                    <a href="{{ route('admin.config.index') }}" class="small-box-footer">Mas info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        @endcan
        {{-- Programador --}}
        @can('admin.secretarias.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-success">
                    <div class="inner">
                        <h3>{{ $total_secretarias }}</h3>
                        <p>Programador</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-laptop"></i>
                    </div>
                    <a href="{{ route('admin.secretarias.index') }}" class="small-box-footer">Mas info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        @endcan
        {{-- Clientes --}}
        @can('admin.clientes.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-warning">
                    <div class="inner">
                        <h3>{{ $total_clientes }}</h3>
                        <p>Clientes</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users mr-2"></i>
                    </div>
                    <a href="{{ route('admin.clientes.index') }}" class="small-box-footer">Mas info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        @endcan
        {{-- Cursos --}}
        @can('admin.cursos.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-danger">
                    <div class="inner">
                        <h3>{{ $total_cursos }}</h3>
                        <p>Cursos</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <a href="{{ route('admin.cursos.index') }}" class="small-box-footer">Mas info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        @endcan
        {{-- Profesores --}}
        @can('admin.clientes.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-primary">
                    <div class="inner">
                        <h3>{{ $total_profesores }}</h3>
                        <p>Profesores</p>
                    </div>
                    <div class="icon"><i class="fa-solid fa-chalkboard-user"></i>
                    </div>
                    <a href="{{ route('admin.profesores.index') }}" class="small-box-footer">Mas info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        @endcan
        {{-- Horarios --}}
        @can('admin.horarios.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-secondary">
                    <div class="inner">
                        <h3>{{ $total_horarios }}</h3>

                        <p>{{ __('actions.schedules') }}</p>
                    </div>
                    <div class="icon">
                        <i class="fa-solid fa-calendar-days"></i>
                    </div>
                    <a href="{{ route('admin.horarios.index') }}" class="small-box-footer">Mas info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        @endcan
        {{-- Reservas --}}
        @can('admin.reservas.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-secondary">
                    <div class="inner">
                        <h3>{{ $total_agendas }}</h3>

                        <p>Reservas</p>
                    </div>
                    <div class="icon">
                        <i class="ion fas bi bi-calendar2-week"></i>
                    </div>
                    <a href="" class="small-box-footer"> <i class="fas fa-calendar-alt"></i></a>
                </div>
            </div>
        @endcan
        {{-- Vehiculos --}}
        @can('admin.vehiculos.index')
            <div class="col-lg-3 col-6">
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3>{{ $total_vehiculos }}</h3>

                        <p>Vehiculos</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-car"></i>
                    </div>
                    <a href="{{ route('admin.vehiculos.index') }}" class="small-box-footer">Mas info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        @endcan
        {{-- Completados --}}
        {{-- @can('admin.cursos.completados') --}}
        <div class="col-lg-3 col-6">
            <div class="small-box bg-success">
                <div class="inner">
                    @if (Auth::user()->hasRole('superAdmin') || Auth::user()->hasRole('admin') || Auth::user()->hasRole('secretaria'))
                        <h4>Estadísticas</h4>
                        <h5 class="mb-2">(Ventas)</h5>
                        <br>
                    @else
                        <div>
                            <h3> total_cursos </h3>
                            <p>Ventas </p>
                        </div>
                    @endif

                </div>
                <div class="icon"> <i class="fa-regular fa-check-circle"></i>
                </div>
                {{-- <a href="{{ route('admin.cursos.completados') }}" class="small-box-footer">Mas info <i class="fas fa-arrow-circle-right"></i></a> --}}
            </div>
        </div>
        {{-- @endcan --}}
        @if (Auth::user()->hasRole('cliente'))
            <div class="col-md-2 col-sm-4 col-6">
                <div class="info-box">
                    <span class="info-box-icon bg-danger"><i class="far fa-star"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Likes</span>
                        <span class="info-box-number">93,139</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <div class="col-md-2 col-sm-4 col-6">
                <div class="info-box">
                    <!-- ROMBO -->
                    <div class="shape-item shape-sm">
                        <div class="diamond badge-shape">
                            <span class="diamond-text"><i class="far fa-star"></i></span>
                        </div>
                    </div>
                    <div class="info-box-content"> Insign Rombo</div>
                </div>
            </div>
            <div class="col-md-2 col-sm-4 col-6">
                <div class="info-box">
                    <div class="shape-item shape-sm">
                        <div class="octagon badge-shape">
                            <span class="octagon-text">Oct</span>
                        </div>
                    </div>
                    <div class="shape-label">Octagono</div>
                </div>
            </div>
            <div class="col-md-2 col-sm-4 col-6">
                <div class="info-box">
                    <div class="shape-item shape-sm">
                        <div class="shield badge-shape">
                            <span class="shield-text">Escudo</span>
                        </div>
                    </div>
                    <div class="shape-label">Escudo</div>
                </div>
            </div>
            {{-- <div class="col-lg-2 col-2"> 
                <div class="shape-item shape-sm">
                    <div class="pentagon">
                        <span class="pentagon-text">PREMIUM</span>
                    </div>
                    <div class="shape-label">Pentágono</div>
                </div>
            </div> --}}
    @endif


    </div>
 

@stop

@section('js') 

@stop
