<!-- Modal de Edición -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Editar </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editForm" method="POST">
                    @csrf
                    @method('PUT')

                    {{-- Select Familia --}}
                    <div class="mb-4">
                        <label for="family-select" class="form-label mb-2">Familia</label>
                        <select name="family_id" id="family-select" class="form-control w-100">
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
                        <button type="submit" class="btn btn-primary ms-2">Actualizar</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
