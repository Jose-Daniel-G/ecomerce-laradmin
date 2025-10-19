@extends('adminlte::page')

@section('title', 'Crear producto')

@section('content_header')
    <h1>Crear producto</h1>
@stop

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h3 class="card-title mb-0">Nuevo Producto</h3>
        <label class="btn btn-outline-primary btn-sm mb-0">
            <i class="fas fa-camera mr-1"></i> Actualizar Imagen
            <input type="file" id="imageInput" class="d-none" accept="image/*">
        </label>
    </div>

    <div class="card-body">
        {{-- Imagen --}}
        <div class="text-center mb-4">
            <img id="previewImage" class="img-fluid rounded shadow-sm"
                style="max-height: 300px; object-fit: cover;"
                src="{{ asset('images/no-image.png') }}" alt="Vista previa">
        </div>

        {{-- Validación --}}
        <x-message></x-message>
        {{-- Formulario --}}
        <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group">
                <label for="sku">Código</label>
                <input type="text" id="sku" name="sku" class="form-control" placeholder="Ingrese el código del producto" required>
            </div>

            <div class="form-group">
                <label for="name">Nombre</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Ingrese el nombre del producto" required>
            </div>

            <div class="form-group">
                <label for="description">Descripción</label>
                <textarea id="description" name="description" class="form-control" rows="3" placeholder="Ingrese una descripción"></textarea>
            </div>

            <div class="form-group">
                <label for="family_id">Familia</label>
                <select id="family_id" name="family_id" class="form-control" required>
                    <option value="">Seleccione una familia</option>
                    @foreach ($families as $family)
                        <option value="{{ $family->id }}">{{ $family->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="category_id">Categoría</label>
                <select id="category_id" name="category_id" class="form-control" required>
                    <option value="">Seleccione una categoría</option>
                </select>
            </div>

            <div class="form-group">
                <label for="subcategory_id">Subcategoría</label>
                <select id="subcategory_id" name="subcategory_id" class="form-control">
                    <option value="">Seleccione una subcategoría</option>
                </select>
            </div>

            <div class="form-group">
                <label for="price">Precio</label>
                <input type="number" id="price" name="price" class="form-control" placeholder="Ingrese el precio" step="0.01" required>
            </div>

            <div class="text-right">
                <button type="submit" class="btn btn-success">
                    <i class="fas fa-save mr-1"></i> Guardar producto
                </button>
            </div>
        </form>
    </div>
</div>
@stop

@section('js')
<script>
    // ✅ Previsualizar imagen
    document.getElementById('imageInput').addEventListener('change', function(e) {
        const file = e.target.files[0];
        const preview = document.getElementById('previewImage');
        if (file) {
            const reader = new FileReader();
            reader.onload = (e) => preview.src = e.target.result;
            reader.readAsDataURL(file);
        } else {
            preview.src = "{{ asset('img/no-image.png') }}";
        }
    });

    // ✅ Ejemplo de carga dinámica de categorías (AJAX)
    document.getElementById('family_id').addEventListener('change', function() {
        const familyId = this.value;
        const categorySelect = document.getElementById('category_id');
        const subcategorySelect = document.getElementById('subcategory_id');

        categorySelect.innerHTML = '<option value="">Cargando...</option>';
        subcategorySelect.innerHTML = '<option value="">Seleccione una subcategoría</option>';

        if (!familyId) return;

        fetch(`/api/categories/${familyId}`)
            .then(response => response.json())
            .then(categories => {
                categorySelect.innerHTML = '<option value="">Seleccione una categoría</option>';
                categories.forEach(c => {
                    categorySelect.innerHTML += `<option value="${c.id}">${c.name}</option>`;
                });
            });
    });

    // ✅ Cargar subcategorías dinámicamente
    document.getElementById('category_id').addEventListener('change', function() {
        const categoryId = this.value;
        const subcategorySelect = document.getElementById('subcategory_id');
        subcategorySelect.innerHTML = '<option value="">Cargando...</option>';

        if (!categoryId) return;

        fetch(`/api/subcategories/${categoryId}`)
            .then(response => response.json())
            .then(subcategories => {
                subcategorySelect.innerHTML = '<option value="">Seleccione una subcategoría</option>';
                subcategories.forEach(s => {
                    subcategorySelect.innerHTML += `<option value="${s.id}">${s.name}</option>`;
                });
            });
    });
</script>
@stop
