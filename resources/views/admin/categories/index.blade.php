<div>
    <div class="card">
        <div class="card-body">

            {{-- Formulario principal para la actualización --}}
            <form action="{{ route('admin.categories.update', $category) }}" method="POST">
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

                {{-- Select Familia --}}
                <div class="mb-4">
                    <label for="family-select" class="form-label mb-2">Familia</label>
                    <select name="family_id" id="family-select" class="form-select w-100">
                        @foreach ($families as $family)
                            <option value="{{ $family->id }}"
                                {{ old('family_id', $category->family_id) == $family->id ? 'selected' : '' }}>
                                {{ $family->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                {{-- Campo Nombre --}}
                <div class="mb-4">
                    <label for="name-input" class="form-label mb-2">Nombre</label>
                    <input type="text" name="name" id="name-input" class="form-control w-100"
                        placeholder="Ingrese el nombre de la categoría" value="{{ old('name', $category->name) }}">
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
    <form action="{{ route('admin.categories.destroy', $category) }}" id="delete-form" method="POST"
        style="display: none;">
        @csrf
        @method('DELETE')
    </form>



</div> @push('js')
    <script>
        function confirmDelete() {
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
                    // Envía el formulario oculto de eliminación
                    document.getElementById('delete-form').submit();
                }
                // Se han comentado las respuestas de éxito/cancelación para una experiencia más limpia
            });
        }
    </script>
@endpush
