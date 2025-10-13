<div>
    {{-- Breadcrumbs (Navegación) --}}
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ route('admin.dashboard') }}">Dashboard</a>
            </li>
            <li class="breadcrumb-item">
                <a href="{{ route('admin.families.index') }}">Familias</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
                {{ $family->name }}
            </li>
        </ol>
    </nav>

    <hr class="mt-2 mb-4">
    
    <div class="card">
        <div class="card-body">
            
            {{-- Formulario principal para la actualización --}}
            <form action="{{ route('admin.families.update', $family) }}" method="POST">
                @csrf
                @method('PUT')

                {{-- Manejo de Errores --}}
                @if ($errors->any())
                    <div class="alert alert-danger mb-4">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                
                {{-- Campo Nombre --}}
                <div class="mb-4">
                    <label for="name-input" class="form-label mb-2">Nombre</label>
                    <input type="text" name="name" id="name-input" class="form-control w-100"
                        placeholder="Ingrese el nombre de la familia" 
                        value="{{ old('name', $family->name) }}">
                </div>

                {{-- Botones de Acción --}}
                <div class="d-flex justify-content-end mt-4">
                    <button type="button" class="btn btn-danger" onclick="confirmDelete()">Eliminar</button>
                    <button type="submit" class="btn btn-primary ms-2">Actualizar</button>
                </div>
            </form>

        </div>
    </div>
    
    {{-- Formulario oculto para eliminar --}}
    <form action="{{ route('admin.families.destroy', $family) }}" id="delete-form" method="POST" style="display: none;">
        @csrf
        @method('DELETE')
    </form> 
    @push('js')
        <script>
            /**
             * Muestra una alerta de SweetAlert2 para confirmar la eliminación.
             */
            function confirmDelete() {
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
                        // Envía el formulario oculto para iniciar la solicitud DELETE
                        document.getElementById('delete-form').submit();
                    } 
                });
            }
        </script>
    @endpush
</div>