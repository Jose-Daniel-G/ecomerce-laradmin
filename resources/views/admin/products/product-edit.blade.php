    <div class="card">
        <div class="card-body">
            <form action="{{ route('admin.products.update', $product) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')


                <div class="row">
                    <div class="col-4">
                        {{-- Imagen --}}
                        <div class="mb-4 position-relative text-center">
                            <img id="preview" src="{{ $product->image }}" class="img-fluid rounded"
                                style="max-height: 350px; object-fit: cover;" alt="Imagen del producto">
                            <label class="btn btn-light border position-absolute" style="top: 20px; right: 20px;">
                                <i class="fas fa-camera me-2"></i>Actualizar Imagen
                                <input type="file" name="image" class="d-none" accept="image/*"
                                    onchange="previewImage(event)">
                            </label>
                        </div>
                    </div>
                    <div class="col-8">
                        {{-- Datos principales --}}
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label">Código (SKU)</label>
                                <input type="text" name="sku" value="{{ old('sku', $product->sku) }}"
                                    class="form-control" placeholder="Ingrese el código del producto">
                            </div>
                            <div class="col-6">
                                <label class="form-label">Nombre</label>
                                <input type="text" name="name" value="{{ old('name', $product->name) }}"
                                    class="form-control" placeholder="Ingrese el nombre del producto">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label">Precio</label>
                                <input type="number" step="0.01" name="price"
                                    value="{{ old('price', $product->price) }}" class="form-control"
                                    placeholder="Ingrese el precio">
                            </div>
                            @if ($product->variants->count() == 0)
                                <div class="col-6">
                                    <label class="form-label">Stock</label>
                                    <input type="number" step="1" name="stock"
                                        value="{{ old('stock', $product->stock) }}" class="form-control"
                                        placeholder="Ingrese el stock">
                                </div>
                            @endif
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-4">
                                <label class="form-label">Familia</label>
                                <select name="family_id" id="family_id" class="form-control">
                                    <option value="">Seleccione una familia</option>
                                    @foreach ($families as $family)
                                        <option value="{{ $family->id }}"
                                            {{ $family->id == $product->subcategory->category->family_id ? 'selected' : '' }}>
                                            {{ $family->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4">
                                <label class="form-label">Categoría</label>
                                <select name="category_id" id="category_id" class="form-control">
                                    <option value="">Seleccione una categoría</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}"
                                            {{ $category->id == $product->subcategory->category_id ? 'selected' : '' }}>
                                            {{ $category->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4">
                                <label class="form-label">Subcategoría</label>
                                <select name="subcategory_id" id="subcategory_id" class="form-control">
                                    <option value="">Seleccione una subcategoría</option>
                                    @foreach ($subcategories as $subcategory)
                                        <option value="{{ $subcategory->id }}"
                                            {{ $subcategory->id == $product->subcategory_id ? 'selected' : '' }}>
                                            {{ $subcategory->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label">Descripción</label>
                                <textarea name="description" class="form-control" rows="3" placeholder="Ingrese la descripción">{{ old('description', $product->description) }}</textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                {{-- Botones --}}
                                <div class="d-flex justify-content-end mt-4">
                                    <button type="button" class="btn btn-danger"
                                        onclick="confirmDeleteEdit()">Eliminar</button>
                                    <button type="submit" class="btn btn-primary ml-2">Actualizar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            {{-- Formulario oculto para eliminar --}}
            <form action="{{ route('admin.products.destroy', $product) }}" id="delete-form" method="POST" class="d-none">
                @csrf
                @method('DELETE')
            </form>
        </div>
    </div>