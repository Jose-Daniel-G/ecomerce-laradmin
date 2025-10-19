@extends('adminlte::page')
@section('title', 'Ecommerce')
@section('css')
@stop
@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Familias</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Familias</li>
            </ol>
        </div>
    </nav>
@stop
@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-end">
                <a class="btn btn-secondary" data-toggle="modal" data-target="#createModal">Crear Familia
                    <i class="bi bi-plus-circle-fill"></i>
                </a>
            </div>
        </div>
        <div class="card-body">
            {{-- Manejo de Errores --}}
            <x-message></x-message>{{-- JD  resources/views/components --}}
            @if ($families->count())
                <div class="table-responsive">
                    <table id="families" class="table table-hover table-striped table-bordered align-middle">
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
                                        {{-- button EDIT --}}
                                        <a href="#" class="btn btn-warning btn-sm mr-1" data-id="{{ $family->id }}"
                                            data-toggle="modal" data-target="#editModal" title="Editar"> <i
                                                class="fas fa-edit"></i></a>
                                        <form id="delete-form-{{ $family->id }}"
                                            action="{{ route('admin.families.destroy', $family) }}" method="POST"
                                            class="d-inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="button" class="btn btn-danger btn-sm"
                                                onclick="confirmDelete({{ $family->id }})">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </form>

                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                </div>
                <div class="mt-4">
                    {{ $families->links('pagination::bootstrap-5') }}
                </div>
            @else
                <div class="alert alert-info" role="alert">
                    <span class="fw-bold">¡Aviso!</span> Todavía no hay familias de productos registradas.
                </div>
            @endif
        </div>
        @include('admin.families.create')
        @include('admin.families.edit')
    </div>

@stop

@section('js')
    <script>
        new DataTable('#families', {
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
            var id = button.data('id'); // ID del curso
            var modal = $(this);

            var url = "{{ route('admin.families.edit', ':id') }}".replace(':id', id);
            $.ajax({
                url: url,
                method: 'GET',
                success: function(data) {
                    var formAction = "{{ route('admin.families.update', ':id') }}".replace(':id', data
                        .id);
                    modal.find('#editForm').attr('action', formAction);

                    // Llenar los campos
                    modal.find('#name-input').val(data.name);
                },
                error: function(xhr) {
                    console.error('Error al cargar los datos del curso:', xhr);
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
@stop
