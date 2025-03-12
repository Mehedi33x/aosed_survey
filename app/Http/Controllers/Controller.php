<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * Global return the response
     *
     * @param [type] $type
     * @param [type] $res
     * @return json
     */
    public function responseReturn($type, $res = null, $slug = null)
    {
        if (!empty($slug)) {
            return response()->json(
                [
                    'slug' => $slug,
                    'type' => $res ? 'success' : 'warning',
                    'message' => $res ? 'Update Successfully!' : 'No data updated',
                ],
                200
            );
        }

        if ($type == 'create') {
            $reType = $res ? 'Successfully' : 'Unsuccessful';
            $key = $res ? 'message' : 'error';

            return response()->json([$key => "Save {$reType}!"], 201);
        } elseif ($type == 'update') {
            if ($res->wasChanged()) {
                return response()->json(['message' => 'Update Successfully!'], 201);
            }

            return response()->json(['message' => 'No data updated'], 203);
        } elseif ($type == 'delete') {
            $reType = $res ? 'Successfully' : 'Unsuccessful';

            return response()->json(['message' => "Delete {$reType}!"], 201);
        }
    }

    public function responseWithSuccess($data, $status=200)
    {
        return response()->json(
            [
                'data' => $data,
                'success' => 1,
                'error' => 0,
                'status' => $status,
            ]
        );
    }

    public function responseWithError($message, $status=422)
    {
        return response()->json(
            [
                'data' => [],
                'success' => 0,
                'error' => 1,
                'error_message' => [$message],
                'status' => $status,
            ]
        );
    }

}
