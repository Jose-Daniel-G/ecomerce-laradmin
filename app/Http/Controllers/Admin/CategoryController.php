<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Family;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    //    public function __construct()
    // {
    //     $this->middleware('can:manage categories');
    // }
    public function index()
    {
        $categories = Category::orderBy('id', 'desc')
            ->with('family')
            ->paginate(10);
        $families = Family::all();

        return view('admin.categories.index', compact('categories', 'families'));
    }
    public function create(Request $request)
    {
        $families = Family::all();
        return view('admin.categories.create', compact('families'));
    }
    public function store(Request $request)
    {
        $data = $request->validate([
            'family_id' => 'required|exists:families,id',
            'name' => 'required|string|max:255',
        ]);

        Category::create($data);
        return redirect()->route('admin.categories.index')->with(['swal' => 1, 'icon' => 'success', 'title' => '!Bien echo', 'info' => 'Categoria creada correctamente']);
    }

    public function edit(Category $category)
    {
        $families = Family::all();
        return response()->json([
            'category' => $category,
            'families' => $families,
        ]);
    }
    public function update(Request $request, Category $category)
    {
        $data = $request->validate([
            'family_id' => 'required|exists:families,id',
            'name' => 'required|string|max:255',
        ]);

        $category->update($data);
        return redirect()->back()->with(['swal' => 1, 'icon' => 'success', 'title' => '!Bien echo', 'info' => 'Categoria actualizada correctamente']);
    }
    public function destroy(Category $category)
    {
        if ($category->subcategories->count() > 0) {
            return redirect()->back()->with(['swal' => 1, 'icon' => 'error', 'title' => 'Ups!', 'info' => 'No se puede eliminar la categoria porque tiene subcategorias asociadas']);
        }
        $category->delete();
        return redirect()->route('admin.categories.index')->with(['swal' => 1, 'icon' => 'success', 'title' => '!Bien echo', 'info' => 'Categoria eliminada correctamente']);
    }
}
