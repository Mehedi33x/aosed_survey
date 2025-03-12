<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Beneficiary;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Http;

class PdfController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    // public function downloadProfile($id)
    // {
    //     $beneficiary = Beneficiary::find($id);
    //     if (empty($beneficiary)) {
	// 		return response()->json([
	// 			'message' => "No data found",
	// 		], Http::ok());
	// 	}
    //     $data = [
    //         'full_name' => $beneficiary->full_name,
    //         'email' => $beneficiary->email,
    //         'mobile_no' => $beneficiary->mobile_no,
    //     ];

    //     // $pdf = PDF::loadView('pdf.profile', $data);
    //     $pdf = PDF::loadView('pdf.profile', $data)->setPaper('a4', 'landscape');
    //     return $pdf->download('profile.pdf');
    // }




    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
