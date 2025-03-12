<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Upazila;
use Exception;
use Illuminate\Http\Request;
use Storage;

class UpazilaController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Upazila::with('state', 'district')->latest();
        
        $query->whereLike($request->field_name, $request->value);
        if ($request->status) {
            $query->where('status', $request->status);
        }
        if ($request->state_id && $request->district_id) {
            $query->where('state_id', $request->state_id)
                  ->where('district_id', $request->district_id);
        } elseif ($request->state_id) {
            $query->where('state_id', $request->state_id);
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
                $res = Upazila::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Upazila  $upazila
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Upazila $upazila)
    {
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $upazila;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Upazila  $upazila
     * @return \Illuminate\Http\Response
     */
    public function edit(Upazila $upazila)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Upazila  $upazila
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Upazila $upazila)
    {
        if ($this->validateCheck($request, $upazila->id)) {
            try {
                $data = $request->all();
                // push the update text
                $upazila->fill($data)->save();

                return $this->responseReturn("update", $upazila);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Upazila  $upazila
     * @return \Illuminate\Http\Response
     */
    public function destroy(Upazila $upazila)
    {
        // delete

        $res = $upazila->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        // return true;
        return $request->validate([
            'state_id' => 'required|integer',
            'district_id' => 'required|integer',
            'sorting' => 'integer',
            'name' => 'required|string|max:190',
            'status' => 'string|in:active,deactive|max:190',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
