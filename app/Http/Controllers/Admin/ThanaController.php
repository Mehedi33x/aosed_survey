<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Thana;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\BaseController;
use Storage;

class ThanaController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Thana::with('state', 'district', 'upazila')->latest();
        $query->whereLike($request->field_name, $request->value);
        if ($request->status) {
            $query->where('status', $request->status);
        }
        if ($request->state_id) {
            $query->where('state_id', $request->state_id);
        }
        if ($request->district_id) {
            $query->where('district_id', $request->district_id);
        }
        if ($request->upazila_id) {
            $query->where('upazila_id', $request->upazila_id);
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
                $res = Thana::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Thana  $thana
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Thana $thana)
    {
        $thana->load(['state', 'district', 'upazila']);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $thana;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Thana  $thana
     * @return \Illuminate\Http\Response
     */
    public function edit(Thana $thana)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Thana  $thana
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Thana $thana)
    {
        if ($this->validateCheck($request, $thana->id)) {
            try {
                $data = $request->all();
                // push the update text
                $thana->fill($data)->save();

                return $this->responseReturn("update", $thana);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Thana  $thana
     * @return \Illuminate\Http\Response
     */
    public function destroy(Thana $thana)
    {
        // delete


        $res = $thana->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return true;
        return $request->validate([
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
