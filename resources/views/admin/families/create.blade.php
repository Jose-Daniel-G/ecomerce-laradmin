 
<div class="card">
    <form action="{{route('admin.families.store')}}" method="post">
        @csrf
        <div class="mb-2">
            <label class="mb-2">Nombre</label>
            <input class="form-control" placeholder="Ingrese el nombre de la familia" name="name" value="{{old('name')}}"></input>
        </div>
        <div class="d-flex justify-content-end mt-4">
            <button>Guardar</button>
        </div>
    </form>
</div> 
