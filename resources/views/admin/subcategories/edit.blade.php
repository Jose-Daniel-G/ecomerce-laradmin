<div class="modal fade" id="subcategoryModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <form id="subcategoryForm" method="POST">
        @csrf
        <input type="hidden" name="_method" id="formMethod" value="POST">

        <div class="modal-header">
          <h5 class="modal-title" id="modalTitle">Crear Subcategoría</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <div class="modal-body">
          {{-- FAMILIA --}}
          <div class="mb-3">
            <label for="family_id">Familia</label>
            <select id="family_id" name="family_id" class="form-control">
              <option value="" selected disabled>Seleccione una familia</option>
              @foreach ($families as $family)
                <option value="{{ $family->id }}">{{ $family->name }}</option>
              @endforeach
            </select>
          </div>

          {{-- CATEGORÍA --}}
          <div class="mb-3">
            <label for="category_id">Categoría</label>
            <select id="category_id" name="category_id" class="form-control">
              <option value="" selected disabled>Seleccione una categoría</option>
            </select>
          </div>

          {{-- NOMBRE --}}
          <div class="mb-3">
            <label for="name">Nombre</label>
            <input id="name" name="name" class="form-control" placeholder="Nombre de subcategoría">
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary" id="submitBtn">Guardar</button>
        </div>
      </form>
    </div>
  </div>
</div>
