<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Wealth;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\BaseController;
use Storage;

class WealthController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {   
        $query  = Wealth::latest();
        $query->whereLike( $request->field_name, $request->value );

      if ($request->allData) {
            return $query->get();
        } else {
            $datas = $query->paginate($request->pagination);
            return new Resource($datas);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                $data = $request->all();
                // push the insert text
                $res = Wealth::create($data); 
                return $this->responseReturn( "create", $res );
            } catch (Exception $ex) {
                return response()->json( ['exception' => $ex->errorInfo ?? $ex->getMessage()], 422 );
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Wealth  $wealth
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Wealth $wealth)
    {
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $wealth;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Wealth  $wealth
     * @return \Illuminate\Http\Response
     */
    public function edit(Wealth $wealth)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Wealth  $wealth
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Wealth $wealth)
    {
        if ($this->validateCheck($request, $wealth->id)) {
            try {
                $data = $request->all();
                // push the update text
                $wealth->fill( $data )->save();

                return $this->responseReturn( "update", $wealth );
            } catch (Exception $ex) {
                return response()->json( ['exception' => $ex->errorInfo ?? $ex->getMessage()], 422 );
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Wealth  $wealth
     * @return \Illuminate\Http\Response
     */
    public function destroy(Wealth $wealth)
    {   
        // delete


        $res = $wealth->delete();
        return $this->responseReturn( "delete", $res );
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id=null)
    {
        return true;
        return $request->validate([
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ],[
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
