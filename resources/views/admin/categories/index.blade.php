@extends('adminlte::page')

@section('title', 'Categorías')

@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Categorias</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Categorias</li>
            </ol>
        </div>
    </nav>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="h4 mb-0">Listado de Categorías</h1>
                <a data-toggle="modal" data-target="#createModal" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Crear
                </a>
            </div>
        </div>
        <div class="card-body table-responsive">
            {{-- Manejo de Errores --}}
            <x-message></x-message>{{-- JD  resources/views/components --}}
            @if ($categories->count())
                <table id="categories" class="table table-striped table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th scope="col" style="width: 5%">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Familia</th>
                            <th scope="col" style="width: 10%">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($categories as $category)
                            <tr>
                                <th scope="row">{{ $category->id }}</th>
                                <td>{{ $category->name }}</td>
                                <td>{{ $category->family->name }}</td>
                                <td>
                                    <a href="#" class="btn btn-sm btn-warning" data-toggle="modal"
                                        data-target="#editModal" data-id="{{ $category->id }}">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <form id="delete-form-{{ $category->id }}"
                                        action="{{ route('admin.categories.destroy', $category) }}" method="POST"
                                        class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-danger btn-sm"
                                            onclick="confirmDelete({{ $category->id }})">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="mt-3">
                    {{ $categories->links('pagination::bootstrap-5') }}
                </div>
            @else
                <div class="alert alert-info" role="alert">
                    <i class="fas fa-info-circle me-1"></i>
                    Todavía no hay familias de productos registradas.
                </div>
            @endif

        </div>
    </div>
    @include('admin.categories.create')
    @include('admin.categories.edit')
@stop
@section('js')
    <script>
        new DataTable('#categories', {
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
    <script>
        $('#editModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // botón que abre el modal
            var id = button.data('id'); // id de la categoría
            var modal = $(this);

            // URL del endpoint
            var url = "{{ route('admin.categories.edit', ':id') }}".replace(':id', id);

            $.ajax({
                url: url,
                method: 'GET',
                success: function(data) {
                    var category = data.category;
                    var families = data.families;

                    // Actualiza la acción del formulario
                    var formAction = "{{ route('admin.categories.update', ':id') }}".replace(':id',
                        category.id);
                    modal.find('#editForm').attr('action', formAction);

                    // Rellena los campos
                    modal.find('#name-input').val(category.name);

                    // Limpia y rellena el select de familias
                    var select = modal.find('#family-select');
                    select.empty();

                    $.each(families, function(i, family) {
                        var selected = family.id === category.family_id ? 'selected' : '';
                        select.append(
                            `<option value="${family.id}" ${selected}>${family.name}</option>`
                            );
                    });
                },
                error: function(xhr) {
                    console.error('Error al cargar los datos:', xhr);
                }
            });
        });
        /**
         * Muestra una alerta de SweetAlert2 para confirmar la eliminación.
         */
        function confirmDelete(id) {
            // Configuración de SweetAlert2 con clases de Bootstrap
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: "btn btn-success",
                    cancelButton: "btn btn-danger"
                },
                buttonsStyling: false
            });

            swalWithBootstrapButtons.fire({
                title: "¿Estás seguro?",
                text: "¡No podrás revertir esto!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Sí, bórralo!",
                cancelButtonText: "Cancelar",
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById(`delete-form-${id}`).submit();
                }
            });
        }
    </script>
@endsection
