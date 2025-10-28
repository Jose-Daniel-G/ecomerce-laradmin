<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Family;
use App\Models\Subcategory;
use Illuminate\Http\Request;

class SubcategoryController extends Controller
{
    //    public function __construct()
    // {
    //     $this->middleware('can:manage subcategories');
    // }
    public function index()
    {
        // $subcategories = Subcategory::paginate();
        // $categories = Category::with('family')->get();
        $families = Family::with('categories')->get(); 
        // dd($families->toArray());
        $subcategories = Subcategory::with('category.family')   
        ->orderBy('id', 'desc')             
        ->paginate(10);

        return view('admin.subcategories.index', compact('subcategories','families'));
    }
    public function create()
    {
        return view('admin.subcategories.create');
    }
    public function store(Request $request)
    {
        $data = $request->validate([
            'category_id' => 'required|exists:categories,id',
            'name' => 'required|string|max:255',
        ]);

        Subcategory::create($data);
        return redirect()->back()->with(['swal'=>1,'icon'=>'success', 'title'=>'!Bien echo', 'info'=>'Subcategoria creada correctamente']);

    }
    public function edit(Subcategory $subcategory)
    {
        return view('admin.subcategories.edit', compact('subcategory'));
    }
    public function update(Request $request, Subcategory $subcategory)
    {
        $data = $request->validate([
            'category_id' => 'required|exists:categories,id',
            'name' => 'required|string|max:255',
        ]);

        $subcategory->update($data);
    return redirect()->route('admin.subcategories.index')
                     ->with(['swal'=>1,'icon'=>'success', 'title'=>'!Bien echo', 'info'=>'Subcategoria actualizada correctamente']);
    }
    public function destroy(Subcategory $subcategory)
    {
        if($subcategory->products->count()>0){
           return redirect()->back()->with(['swal'=>1,'icon'=>'error', 'title'=>'Ups!', 'info'=>'No se puede eliminar la subcategoria porque tiene productos asociados']);
        }
        $subcategory->delete();
        return redirect()->back()->with(['swal'=>1,'icon'=>'success', 'title'=>'!Bien echo', 'info'=>'Subcategoria eliminada correctamente']);
    }
}
