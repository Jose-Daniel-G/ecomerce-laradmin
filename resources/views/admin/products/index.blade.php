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
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="h4 mb-0">Listado de Productos</h1>
                <a class="btn btn-primary" href="{{ route('admin.products.create') }}"><i class="fas fa-plus"></i>Create</a>
            </div>
        </div>
        <div class="card-body table-responsive">
            @if ($products->count())

                <table id="products" class="table table-striped table-hover align-middle table-bordered table-sm">
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
            @else
                <div class="alert alert-info" role="alert">
                    <strong>Información:</strong> Todavía no hay productos registrados.
                </div>
            @endif
        </div>
        <div class="mt-3">
            {{ $products->links('pagination::bootstrap-5') }}
        </div>
    </div>

@stop
@section('js')
    <script>
        new DataTable('#products', {
            responsive: true,
            scrollX: true,
            autoWidth: false,
            paginate: false,
            dom: 'Bfrtip', // Añade el contenedor de botones
            buttons: [{
                    extend: 'copyHtml5',
                    text: '<i class="bi bi-clipboard-check"></i> Copiar',
                    className: 'btn btn-sm btn-success'
                }, // Added btn-sm for better consistency
                {
                    extend: 'csvHtml5',
                    text: '<i class="bi bi-filetype-csv"></i> CSV',
                    className: 'btn btn-sm btn-warning'
                },
                {
                    extend: 'excelHtml5',
                    text: '<i class="bi bi-file-earmark-excel"></i> Excel',
                    className: 'btn btn-sm btn-secondary'
                },
                {
                    extend: 'pdfHtml5',
                    text: '<i class="bi bi-filetype-pdf"></i> PDF',
                    className: 'btn btn-sm btn-danger'
                },
                {
                    extend: 'print',
                    text: '<i class="bi bi-printer"></i> Imprimir',
                    className: 'btn btn-sm btn-dark'
                },
                {
                    extend: 'colvis'
                }
            ],
            "language": {
                "decimal": "",
                "emptyTable": "No hay datos disponibles en la tabla",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ familias",
                "infoEmpty": "Mostrando 0 a 0 de 0 familias",
                "infoFiltered": "(filtrado de _MAX_ familias totales)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ familias",
                "loadingRecords": "Cargando...",
                "processing": "",
                "search": "Buscar:",
                "zeroRecords": "No se encontraron registros coincidentes",
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior"
                },
                "aria": {
                    "orderable": "Ordenar por esta columna",
                    "orderableReverse": "Invertir el orden de esta columna"
                }
            }
        });
    </script>
@endsection
