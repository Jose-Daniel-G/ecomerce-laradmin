@extends('adminlte::page')
@section('title', 'Profile')
@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center"> 
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Ordenes</li>
            </ol>
        </div>
    </nav>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="h4 mb-0">Listado de Ordenes</h1>

                <a class="btn btn-secondary" data-toggle="modal" data-target="#createModal">Crear Ordenes
                    <i class="bi bi-plus-circle-fill"></i>
                </a>
            </div>
        </div>
        <div class="card-body">
        </div>
    </div>
    @include('admin.drivers.create')
    @include('admin.drivers.edit')
@stop
@section('js')

@stop
