@extends('adminlte::page')

@section('title', 'Dashboard')
@section('css')
@stop
@section('content_header')
    <h1>Panel principal</h1>
@stop
@section('content') 
    {{-- Breadcrumbs (Navegación) --}}
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            {{-- Dashboard --}}
            <li class="breadcrumb-item">
                <a href="{{ route('admin.dashboard') }}">Dashboard</a>
            </li>
            {{-- Familias --}}
            <li class="breadcrumb-item active" aria-current="page">
                Familias
            </li>
        </ol>
    </nav>
    
    <hr class="mt-2 mb-4">

    {{-- Contenedor de Acción (Botón Crear) --}}
    <div class="d-flex justify-content-end mb-4">
        <a class="btn btn-primary" href="{{ route('admin.families.create') }}">Crear Familia</a>
    </div>

    @if ($families->count())
        <div class="table-responsive">
            <table class="table table-hover table-striped table-bordered align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col" class="text-center">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col" class="text-center">Acciones</th>
                    </tr>
                </thead>
                
                <tbody>
                    @foreach ($families as $family)
                        <tr class="bg-white">
                            <th scope="row" class="text-center">{{ $family->id }}</th>
                            <td>{{ $family->name }}</td>
                            <td class="text-center">
                                <a href="{{ route('admin.families.edit', $family) }}" class="btn btn-sm btn-info text-white">
                                    Editar
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="mt-4">
            {{-- Se requiere el tema de paginación de Bootstrap. Si no lo tienes configurado, usa ->links() solo --}}
            {{ $families->links('pagination::bootstrap-5') }} 
        </div>
    @else
        <div class="alert alert-info" role="alert">
            <span class="fw-bold">¡Aviso!</span> Todavía no hay familias de productos registradas.
        </div>
    @endif
@stop

@section('js')
@stop