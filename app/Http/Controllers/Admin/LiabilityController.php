<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Liability;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\BaseController;
use Storage;

class LiabilityController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {   
        $query  = Liability::latest();
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
                $res = Liability::create($data); 
                return $this->responseReturn( "create", $res );
            } catch (Exception $ex) {
                return response()->json( ['exception' => $ex->errorInfo ?? $ex->getMessage()], 422 );
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Liability  $liability
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Liability $liability)
    {
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $liability;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Liability  $liability
     * @return \Illuminate\Http\Response
     */
    public function edit(Liability $liability)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Liability  $liability
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Liability $liability)
    {
        if ($this->validateCheck($request, $liability->id)) {
            try {
                $data = $request->all();
                // push the update text
                $liability->fill( $data )->save();

                return $this->responseReturn( "update", $liability );
            } catch (Exception $ex) {
                return response()->json( ['exception' => $ex->errorInfo ?? $ex->getMessage()], 422 );
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Liability  $liability
     * @return \Illuminate\Http\Response
     */
    public function destroy(Liability $liability)
    {   
        // delete


        $res = $liability->delete();
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
