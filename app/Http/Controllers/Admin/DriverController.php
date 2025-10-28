<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Driver;
use Illuminate\Http\Request;

class DriverController extends Controller
{
    //public function __construct()
    // {
    //     $this->middleware('can:manage drivers');
    // }
    public function index()
    {
        $drivers = Driver::all();
        return view('admin.drivers.index', compact('drivers'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // return view('admin.drivers.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return redirect()->back()->with(['swal'=>1, 'icon'=>'success', 'title' => 'Exito', 'info'=>'Conductor creado exitosamente']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Driver $driver)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Driver $driver)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Driver $driver)
    {
        return redirect()->back()->with(['swal'=>1, 'icon'=>'success', 'title' => 'Exito', 'info'=>'Conductor actualizado exitosamente']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Driver $driver)
    {
        return redirect()->back()->with(['swal'=>1, 'icon'=>'success', 'title' => 'Exito', 'info'=>'Conductor eliminado exitosamente']);
    }
}
