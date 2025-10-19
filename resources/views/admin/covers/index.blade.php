@extends('adminlte::page')

@section('title', 'Covers')

@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="text-lg font-semibold">Gestión de Covers</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Covers</li>
            </ol>
        </div>
    </nav>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="h4 mb-0">Listado de Covers</h1>
                <a data-toggle="modal" data-target="#createModal" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Crear
                </a>
            </div>
        </div>
        <div class="card-body">
            <ul class="list-unstyled" id="covers">
                @foreach ($covers as $cover)
                    <li class="mb-3 bg-white border rounded shadow-sm d-flex flex-column flex-lg-row overflow-hidden cursor-move"
                        data-id="{{ $cover->id }}">
                        <img src="{{ $cover->image }}" alt="{{ $cover->title }}" class="w-100 w-lg-25 object-fit-cover"
                            style="aspect-ratio: 3/1;">

                        <div
                            class="p-3 flex-grow-1 d-flex flex-column flex-lg-row justify-content-between align-items-start align-items-lg-center gap-3">
                            <div>
                                <h5 class="fw-bold mb-1">{{ $cover->title }}</h5>
                                @if ($cover->is_active)
                                    <span class="badge bg-success">Activo</span>
                                @else
                                    <span class="badge bg-danger">Inactivo</span>
                                @endif
                            </div>

                            <div>
                                <p class="mb-0 text-muted small fw-bold">Inicio</p>
                                <p class="mb-0">{{ $cover->start_at->format('d/m/y') }}</p>
                            </div>

                            <div>
                                <p class="mb-0 text-muted small fw-bold">Fin</p>
                                <p class="mb-0">{{ $cover->end_at?->format('d/m/y') ?? '-' }}</p>
                            </div>

                            <div>
                                <a href="{{ route('admin.covers.edit', $cover) }}" class="btn btn-sm btn-primary">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                            </div>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>
@stop

@section('css')
    <style>
        .cursor-move {
            cursor: move;
        }

        .ghost {
            background-color: #cfe2ff !important;
            border: 2px dashed #0d6efd;
        }
    </style>
@stop

@section('js')
    {{-- Dependencias --}}
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            new Sortable(document.getElementById('covers'), {
                animation: 150,
                ghostClass: 'ghost',
                store: {
                    set: (sortable) => {
                        const sorts = sortable.toArray();
                        axios.post('{{ route('api.sort.covers') }}', {
                                sorts
                            })
                            .then(() => console.log('Orden guardado'))
                            .catch((error) => console.error('Error al guardar orden:', error));
                    }
                }
            });
        });
    </script>
@stop
