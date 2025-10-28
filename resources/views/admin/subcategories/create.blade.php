<!-- Modal de Create -->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createModalLabel">Crear Vehículo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="{{ route('admin.subcategories.store') }}">
                    @csrf


                            <x-message></x-message>{{-- JD Manejo de Errores  resources/views/components --}}
                            <div class="mb-3">
                                <label for="family_id" class="form-label">Familias</label>
                                <select id="family_id" name="family_id"
                                    class="form-control @error('family_id') is-invalid @enderror">
                                    <option value="" disabled selected>Selecione una familia</option>
                                    @foreach ($families as $family)
                                        <option value="{{ $family->id }}"
                                            {{ old('family_id') == $family->id ? 'selected' : '' }}>
                                            {{ $family->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('family_id')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="category_id" class="form-label">Categorias</label>
                                <select id="category_id" name="category_id"
                                    class="form-control @error('category_id') is-invalid @enderror">
                                    <option value="" disabled selected>Selecione una categoria</option>
                                    {{-- Usando una variable de categoría simple sin $this->categories --}}
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}"
                                            {{ old('category_id') == $category->id ? 'selected' : '' }}>
                                            {{ $category->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('category_id')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="name" class="form-label">Nombre</label>
                                <input id="name" type="text"
                                    class="form-control @error('name') is-invalid @enderror"
                                    placeholder="Ingrese el nombre de la subcategoría" name="name"
                                    value="{{ old('name') }}">
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>



                    <div class="d-flex justify-content-end mt-3">
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
