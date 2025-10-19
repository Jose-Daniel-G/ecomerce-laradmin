@extends('adminlte::page')
@section('title', 'Ecommerce')
@section('css')
@stop

@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Products</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Products</li>
            </ol>
        </div>
    </nav>
@stop

@section('content')
    @include('admin.products.product-edit')


    {{-- ---------- SECCIÓN DE OPCIONES (integrada) ---------- --}}
    <div class="card mt-3">
        <div class="card-header">
            <h3 class="card-title">Opciones</h3>
            <div class="d-flex justify-content-end">
                {{-- Botón para abrir modal: usamos id para abrir con JS (evita diferencias data-toggle bs4/bs5) --}}
                <button class="btn btn-primary" id="openOptionModal" type="button">
                    <i class="fas fa-plus me-1"></i> Nuevo
                </button>
            </div>
        </div>

        <div class="card-body">
            @if ($product->options->count())
                @foreach ($product->options as $option)
                    <div class="border rounded p-3 mb-4 position-relative">
                        <button class="btn btn-sm btn-outline-danger position-absolute top-0 end-0 mt-2 me-2"
                            onclick="confirmDeleteOption({{ $option->id }})">
                            <i class="fas fa-trash"></i>
                        </button>

                        <h5 class="fw-semibold">{{ $option->name }}</h5>

                        {{-- Lista de valores --}}
                        <div class="mt-3 d-flex flex-wrap gap-2">
                            @foreach ($option->pivot->features as $feature)
                                @switch($option->type)
                                    @case(1)
                                        {{-- Texto --}}
                                        <span class="badge bg-light text-dark border">
                                            {{ $feature['description'] }}
                                            <button type="button" class="btn btn-link p-0 ms-1 text-danger"
                                                onclick="confirmDeleteFeature({{ $option->id }}, {{ $feature['id'] }})">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </span>
                                    @break

                                    @case(2)
                                        {{-- Color --}}
                                        <div class="position-relative">
                                            <span class="d-inline-block rounded-circle border border-secondary shadow-sm"
                                                style="background-color: {{ $feature['value'] }}; width: 25px; height: 25px;">
                                            </span>
                                            <button type="button"
                                                class="btn btn-danger btn-sm rounded-circle position-absolute top-0 start-50 translate-middle"
                                                style="width: 16px; height: 16px; padding: 0; line-height: 12px;"
                                                onclick="confirmDeleteFeature({{ $option->id }}, {{ $feature['id'] }})">
                                                <i class="fas fa-times fa-xs"></i>
                                            </button>
                                        </div>
                                    @break

                                    @case(3)
                                        {{-- Sexo --}}
                                        <span class="badge bg-light text-dark border">
                                            {{ $feature['description'] }}
                                            <button type="button" class="btn btn-link p-0 ms-1 text-danger"
                                                onclick="confirmDeleteFeature({{ $option->id }}, {{ $feature['id'] }})">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </span>
                                    @break
                                @endswitch
                            @endforeach
                        </div>
                    </div>
                @endforeach
            @else
                <div class="alert alert-info text-center mb-0">
                    <i class="fas fa-info-circle me-2"></i>No hay opciones para este producto.
                </div>
            @endif
        </div>
    </div>

    {{-- ---------- VARIANTES (integrada) ---------- --}}
    @if ($product->variants->count())
        <div class="card mt-4">
            <div class="card-header">
                <h3 class="card-title">Variantes</h3>
            </div>
            <div class="card-body">
                <ul class="list-group">
                    @foreach ($product->variants as $variant)
                        <li class="list-group-item d-flex align-items-center">
                            <img src="{{ $variant->image }}" alt="" class="rounded me-3"
                                style="width: 50px; height: 50px; object-fit: cover;">
                            <div class="flex-grow-1">
                                @foreach ($variant->features as $feature)
                                    <span class="badge bg-secondary me-1">{{ $feature->description }}</span>
                                @endforeach
                            </div>
                            <a href="{{ route('admin.products.variants', [$product, $variant]) }}"
                                class="btn btn-sm btn-primary ms-auto">
                                <i class="fas fa-edit me-1"></i>Editar
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    @endif

    {{-- ---------- MODAL: AGREGAR NUEVA OPCIÓN ---------- --}}
    <div class="modal fade" id="optionModal" tabindex="-1" aria-labelledby="optionModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <form action="{{ route('admin.products.addOption', $product) }}" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="optionModalLabel">Agregar Nueva Opción</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span
                                aria-hidden="true">&times;</span></button>
                    </div>

                    <div class="modal-body">
                        {{-- Errores --}}
                        <x-message></x-message>

                        {{-- Selección de opción --}}
                        <div class="mb-3">
                            <label class="form-label">Opción</label>
                            <select name="option_id" class="form-control" required>
                                <option value="">Seleccione una opción</option>
                                @foreach ($options as $opt)
                                    <option value="{{ $opt->id }}">{{ $opt->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        {{-- Sección de valores dinámicos --}}
                        <div class="border-top mt-4 pt-3">
                            <h6>Valores</h6>
                            <div id="feature-container"></div>

                            {{-- Botón para agregar valores dinámicos --}}
                            <button type="button" class="btn btn-outline-primary btn-sm mt-2" id="addFeatureBtn">
                                <i class="fas fa-plus me-1"></i> Agregar Valor
                            </button>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Guardar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@stop

@section('js')
    <script>
        // Confirmación para formularios (ej. eliminar)
        function confirmDelete(formId) {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: "btn btn-success",
                    cancelButton: "btn btn-danger"
                },
                buttonsStyling: false
            });

            swalWithBootstrapButtons.fire({
                title: "¿Estás seguro?",
                text: "No podrás revertir esto!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Sí, bórralo!",
                cancelButtonText: "Cancelar",
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById(formId).submit();
                }
            });
        }
    </script>

    <script>
        // Lógica principal: agregar campos dinámicos y abrir modal con seguridad BS4/BS5
        document.addEventListener('DOMContentLoaded', function() {
            let featureIndex = 0;
            const addFeatureBtn = document.getElementById('addFeatureBtn');
            const container = document.getElementById('feature-container');
            const openOptionModalBtn = document.getElementById('openOptionModal');

            // Agregar nuevo campo de "feature"
            if (addFeatureBtn) {
                addFeatureBtn.addEventListener('click', function() {
                    const div = document.createElement('div');
                    div.classList.add('mb-3', 'border', 'rounded', 'p-3', 'position-relative');
                    div.innerHTML = `
                        <button type="button" class="btn btn-sm btn-outline-danger position-absolute top-0 end-0 mt-2 me-2"
                                onclick="this.closest('div').remove()">
                            <i class="fas fa-trash"></i>
                        </button>
                        <label class="form-label">Valor ${featureIndex + 1}</label>
                        <input type="text" name="features[]" class="form-control" placeholder="Ingrese el valor" required>
                    `;
                    container.appendChild(div);
                    featureIndex++;
                });
            }

            // Abre modal: preferimos usar jQuery/Bootstrap si están disponibles (AdminLTE normalmente lo trae)
            if (openOptionModalBtn) {
                openOptionModalBtn.addEventListener('click', function() {
                    // Si jQuery y bootstrap modal están presentes, úsalos
                    if (typeof $ !== 'undefined' && typeof $.fn.modal === 'function') {
                        $('#optionModal').modal('show');
                        return;
                    }

                    // Si no hay jQuery (raro en AdminLTE), intentar con Bootstrap 5 nativo
                    if (typeof bootstrap !== 'undefined' && typeof bootstrap.Modal === 'function') {
                        const modalEl = document.getElementById('optionModal');
                        const modal = new bootstrap.Modal(modalEl);
                        modal.show();
                        return;
                    }

                    // Fallback - si nada, mostrar aviso en consola y mostrar modal agregando clases (mínimo)
                    console.warn(
                        'No se encontró jQuery/Bootstrap Modal: intenta abrir manualmente el modal o incluye bootstrap/js'
                    );
                    const modalEl = document.getElementById('optionModal');
                    if (modalEl) {
                        modalEl.classList.add('show');
                        modalEl.style.display = 'block';
                        modalEl.removeAttribute('aria-hidden');
                        document.body.classList.add('modal-open');
                    }
                });
            }

            // Exponer funciones de confirmación para botones inline (delete)
            window.confirmDeleteOption = function(optionId) {
                Swal.fire({
                    title: "¿Eliminar esta opción?",
                    text: "Esta acción no se puede revertir.",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Sí, eliminar",
                    cancelButtonText: "Cancelar"
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = `/admin/options/${optionId}/delete`;
                    }
                });
            };

            window.confirmDeleteFeature = function(optionId, featureId) {
                Swal.fire({
                    title: "¿Eliminar este valor?",
                    text: "Esta acción es irreversible.",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Sí, eliminar",
                    cancelButtonText: "Cancelar"
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = `/admin/options/${optionId}/feature/${featureId}/delete`;
                    }
                });
            };
        });
    </script>
    <script>
        // Vista previa de imagen
        function previewImage(event) {
            const input = event.target;
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        // Confirmación de eliminación
        function confirmDeleteEdit() {
            Swal.fire({
                title: "¿Estás seguro?",
                text: "¡Esta acción no se puede deshacer!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Sí, eliminar",
                cancelButtonText: "Cancelar",
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('delete-form').submit();
                }
            });
        }
    </script>
@stop
