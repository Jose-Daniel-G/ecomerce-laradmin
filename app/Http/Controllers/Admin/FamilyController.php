<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Family;
use Illuminate\Http\Request;

class FamilyController extends Controller
{
    //    public function __construct()
    // {
    //     $this->middleware('can:manage options');
    // }
    public function index()
    {
        // $families = Family::paginate();
        $families = Family::orderBy('id', 'desc')->paginate(10);

        return view('admin.families.index', compact('families'));
    }
    public function create(Request $request)
    {
        return view('admin.families.create');
    }
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
        ]);

        Family::create($data);
        return redirect()->route('admin.families.index')->with([
            'swal' => 1,
            'icon' => 'success',
            'title' => '!Bien hecho',
            'info'  => 'Familia creada correctamente',
        ]);
    }
    public function edit(Family $family)
    {
        // dump($family);
        return response()->json($family);
    }
    public function update(Request $request, Family $family)
    {
        $data = $request->validate(['name' => 'required|string|max:255',]);

        $family->update($data);
        return redirect()->back()->with([
            'swal'  => 1,
            'icon'  => 'success',
            'title' => '¡Bien hecho!',
            'info'  => 'Familia actualizada correctamente',
        ]);
    }
    public function destroy(Family $family)
    {
        if ($family->categories->count()) {
            return redirect()->back()->with(['swal' => 1, 'icon' => 'error', 'title' => 'Ups!', 'info' => 'No se puede eliminar la familia porque tiene categorias asociadas']);
        }
        $family->delete();

        return redirect()->route('admin.families.index')
            ->with(['swal' => 1, 'icon' => 'success', 'title' => '!Bien echo', 'info' => 'Familia eliminada correctamente']);
    }
}
