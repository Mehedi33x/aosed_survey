<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Disease;
use Exception;
use Illuminate\Http\Request;
use Storage;

class DiseaseController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Disease::latest();
        $query->whereLike($request->field_name, $request->value);
        if($request->status){
            $query->where('status',$request->status);
        }
        if($request->type){
            $query->where('type',$request->type);
        }
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
                $res = Disease::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Disease  $disease
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Disease $disease)
    {
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $disease;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Disease  $disease
     * @return \Illuminate\Http\Response
     */
    public function edit(Disease $disease)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Disease  $disease
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Disease $disease)
    {
        if ($this->validateCheck($request, $disease->id)) {
            try {
                $data = $request->all();
                // push the update text
                $disease->fill($data)->save();

                return $this->responseReturn("update", $disease);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Disease  $disease
     * @return \Illuminate\Http\Response
     */
    public function destroy(Disease $disease)
    {
        // delete

        $res = $disease->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck(Request $request)
    {
        return $request->validate([
            'title' => 'required|string|max:190',
            'type' => 'required|string|max:50',
            'status' => 'in:active,deactive',
            'sorting' => 'integer',
            'remarks' => 'nullable|string',
            'description' => 'nullable|string',

        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }

    public function getDiseaseType()
    {
        return response()->json([
            ['name' => 'Infectious', 'value' => 'infectious'],
            ['name' => 'Deficiency', 'value' => 'deficiency'],
            ['name' => 'Hereditary', 'value' => 'hereditary'],
            ['name' => 'Physiological', 'value' => 'physiological'],
        ]);
    }
}
