<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createModalLabel">Crear Categoria</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('admin.categories.store') }}" method="post">
                    @csrf
                    <div class="mb-2">
                        <label class="mb-2">Categoria</label>
                        <select name="family_id" class="form-control">
                            <option value="" selected disabled>Seleccione..</option>
                            @foreach ($families as $family)
                                <option value="{{ $family->id }}">
                                    @selected(old('family_id') == $family->id)
                                    {{ $family->name }}
                                </option>
                            @endforeach
                        </select>
                        <label class="mb-2">Nombre</label>
                        <input class="form-control" placeholder="Ingrese el nombre de la Categoria" name="name"
                            value="{{ old('name') }}"></input>
                    </div>
                    <div class="flex justify-end">
                        <button class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
