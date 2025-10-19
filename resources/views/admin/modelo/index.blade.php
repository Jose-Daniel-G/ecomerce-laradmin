@extends('adminlte::page')
@section('title', 'Profile')
@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Categorias</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Categorias</li>
            </ol>
        </div>
    </nav>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-end">
                <h1 class="h4 mb-0">Listado de Categorías</h1>
                <a data-toggle="modal" data-target="#createModal" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Crear
                </a>
            </div>
        </div>
        <div class="card-body">
        </div>
    </div>
    @include('admin.categories.create')
    @include('admin.categories.edit')
@stop
@section('js')

@stop
