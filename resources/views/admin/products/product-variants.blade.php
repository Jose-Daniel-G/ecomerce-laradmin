    {{-- Sección de Opciones --}}
    <div class="card mt-3">
        <div class="card-header">
            <h3 class="card-title">Opciones</h3>
            <div class="d-flex justify-content-end">
                <button class="btn btn-primary" data-toggle="modal" data-target="#optionModal">
                    <i class="fas fa-plus me-1"></i>Nuevo
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

    {{-- Sección de Variantes --}}
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
    @endif

    </div>

    {{-- Modal para crear nueva opción --}}
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
                        {{-- <x-message></x-message> --}}

                        {{-- Selección de opción --}}
                        <div class="mb-3">
                            <label class="form-label">Opcion</label>
                            {{-- ID y class 'form-control' para JS y estilo --}}
                            <select name="option_id" class="form-control" id="option_select_id">
                                <option value="" data-type="0">Seleccione una opción</option>
                                @foreach ($options as $opt)
                                    {{-- Añadir el atributo data-type --}}
                                    <option value="{{ $opt->id }}" data-type="{{ $opt->type }}">
                                        {{ $opt->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        {{-- Sección de valores dinámicos --}}
                        <div class="border-top mt-4 pt-3">
                            <h6>Valores</h6>
                            <div id="feature-container">
                                {{-- Aquí se agregarán los campos dinámicos --}}
                            </div>
                            <button type="button" class="btn btn-outline-primary btn-sm mt-2" id="addFeatureBtn">
                                <i class="fas fa-plus me-1"></i>Agregar Valor
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
