 <!-- Modal de Create -->
 <div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-xl" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="createModalLabel">Crear Familia</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <form action="{{ route('admin.families.store') }}" method="post">
                     @csrf
                     <div class="mb-2">
                         <label class="mb-2">Nombre</label>
                         <input class="form-control" placeholder="Ingrese el nombre de la familia" name="name"
                             value="{{ old('name') }}"></input>
                     </div>
                     <div class="d-flex justify-content-end mt-4">
                         <button type="submit" class="btn btn-primary">Guardar</button>
                     </div>
                 </form>
             </div>
         </div>
     </div>
 </div>
