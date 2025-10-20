<?php

namespace App\Http\Controllers;

use App\Models\Cover;
use App\Models\Family;
use App\Models\Product;
use Illuminate\Http\Request;

class WelcomeController extends Controller
{
    public function index(){
        $families = Family::all();
        // $lastProducts = Product::orderBy('created_at','desc')->take(12)->get();                       
        return view('welcome', compact('families'));
    }
}
