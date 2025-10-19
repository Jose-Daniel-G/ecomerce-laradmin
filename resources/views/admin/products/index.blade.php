@extends('adminlte::page')

@section('title', 'Productos')

@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Productos</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Productos</li>
            </ol>
        </div>
    </nav>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="h4 mb-0">Listado de Productos</h1>
                <a class="btn btn-primary" href="{{ route('admin.products.create') }}"><i class="fas fa-plus"></i>Create</a>
            </div>
        </div>
        <div class="card-body table-responsive">
            @if ($products->count())

                <table class="table table-striped table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>SKU</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $product)
                            <tr>
                                <td>{{ $product->id }}</td>
                                <td>{{ $product->sku }}</td>
                                <td>{{ $product->name }}</td>
                                <td>${{ number_format($product->price, 2) }}</td>
                                <td class="text-center">
                                    <a href="{{ route('admin.products.edit', $product) }}" class="btn btn-sm btn-warning">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

        </div>
        <div class="mt-3">
            {{ $products->links('pagination::bootstrap-5') }}
        </div>
    </div>
@else
    <div class="alert alert-info" role="alert">
        <strong>Información:</strong> Todavía no hay productos registrados.
    </div>
    @endif
@stop
