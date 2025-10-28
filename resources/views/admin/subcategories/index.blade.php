@extends('adminlte::page')
@section('title', 'Profile')
@section('content_header')
    <nav aria-label="breadcrumb">
        <div class="d-flex justify-content-between align-items-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Subcategorias</li>
            </ol>
        </div>
    </nav>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="h4 mb-0">Listado de Subcategorias</h1>

<button class="btn btn-success" 
        data-toggle="modal" 
        data-target="#subcategoryModal" 
        data-mode="create">
  Crear Subcategoría
</button>
                </a>
            </div>
        </div>

        {{-- @dump($families->toArray()) --}}
        <div class="card-body">
            @if ($subcategories->count())
                <div class="table-responsive">
                    <table class="table table-hover table-striped table-bordered align-middle table-sm">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Categoria</th>
                                <th>Familia</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($subcategories as $subcategory)
                                <tr class="bg-white">
                                    <th scope="row">{{ $subcategory->id }}</th>
                                    <td>{{ $subcategory->name }} </td>
                                    <td>{{ $subcategory->category->name }} </td>
                                    <td>{{ $subcategory->category->family->name }} </td>
                                    <td>
                                        {{-- button EDIT --}}
<a href="#" 
   class="btn btn-warning btn-sm" 
   data-toggle="modal" 
   data-target="#subcategoryModal"
   data-mode="edit"
   data-id="{{ $subcategory->id }}"
   data-name="{{ $subcategory->name }}"
   data-family_id="{{ $subcategory->category->family->id }}"
   data-category_id="{{ $subcategory->category->id }}">
   <i class="fas fa-edit"></i>
</a>

                                    </td>
                                </tr>
                            @endforeach


                        </tbody>
                    </table>
                    <div class="mt-4">{{ $subcategories->links() }}</div>
                @else
                    <div class="">
                        <span>Info alert!</span> Todavia no hay familia de productos registradas.
                    </div>
            @endif
        </div>
        <div class="mt-4">
            {{ $subcategories->links('pagination::bootstrap-5') }}
        </div>
    </div>
    </div>
    {{-- @include('admin.subcategories.create') --}}
    @include('admin.subcategories.edit', ['families' => $families])

@stop
@section('js')
<script>
document.addEventListener('DOMContentLoaded', () => {
  const families = @json($families);
  const modal = $('#subcategoryModal');
  const form = $('#subcategoryForm');
  const family = $('#family_id');
  const category = $('#category_id');
  const name = $('#name');
  const title = $('#modalTitle');
  const method = $('#formMethod');
  const submitBtn = $('#submitBtn');

  const loadCategories = (familyId, selectedId = null) => {
    category.empty().append('<option value="" disabled selected>Seleccione una categoría</option>');
    const fam = families.find(f => f.id == familyId);
    fam?.categories?.forEach(cat => {
      category.append(new Option(cat.name, cat.id, false, cat.id == selectedId));
    });
  };

  modal.on('show.bs.modal', e => {
    const btn = $(e.relatedTarget);
    const mode = btn.data('mode');

    if (mode === 'create') {
      // Crear
      title.text('Crear Subcategoría');
      form.attr('action', "{{ route('admin.subcategories.store') }}");
      method.val('POST');
      name.val('');
      family.val('');
      category.empty().append('<option value="" disabled selected>Seleccione una categoría</option>');
      submitBtn.text('Guardar');
    } else {
      // Editar
      title.text('Editar Subcategoría');
      const id = btn.data('id');
      form.attr('action', `/admin/subcategories/${id}`);
      method.val('PUT');
      name.val(btn.data('name'));
      family.val(btn.data('family_id'));
      loadCategories(btn.data('family_id'), btn.data('category_id'));
      submitBtn.text('Actualizar');
    }
  });

  // Cargar categorías al cambiar familia
  family.on('change', e => loadCategories(e.target.value));
});
</script>
@stop

