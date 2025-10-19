
<!-- Modal de Edición -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
    aria-hidden="true">
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
                    {{-- Campo Nombre --}}
                    <div class="mb-4">
                        <label for="name-input" class="form-label mb-2">Nombre</label>
                        <input type="text" name="name" id="name-input" class="form-control w-100"
                            placeholder="Ingrese el nombre de la familia" value="{{ old('name', $family->name) }}">
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
