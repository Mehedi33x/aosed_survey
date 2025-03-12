<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Traits\Auth\LoginTrait;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class AdminAuthController extends Controller
{
    use LoginTrait;

    /**
     * Login admin with API
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'max:190', 'email:rfc'],
            'password' => ['required', 'string', 'max:190'],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->getMessageBag()], 422);
        }

        $data = $validator->safe()->all();


        $admin = Admin::where('email', $data['email'])->first();
        
        if (!empty($admin)) {
            if ($admin->block == 0) {
                if ($admin && Hash::check($data['password'], $admin->password)) {
                    Session::forget($data['email']);
                    Artisan::call('cache:clear');

                    // Store the login details.
                    $this->storeLoginDetails($admin->id, 'admin');

                    $token = $admin->createToken('api');

                    return response([
                        'message' => 'Logged in successfully.',
                        'token' => $token->plainTextToken,
                    ]);
                } else {
                    $attempt = $this->attemptAdmin($admin->id, $data['email']);
                    if ($attempt <= 3 && $attempt != 0) {
                        $message = "You have {$attempt} login attempts remaining.";
                    } elseif ($attempt == 0) {
                        $message = 'Your account has been blocked. Please contact your administrator for assistance.';
                    } else {
                        $message = __('auth.failed');
                    }

                    return response([
                        'message' => $message,
                    ], 422);
                }
            } else {
                return response([
                    'message' => 'Your account has been blocked. Please contact your administrator for assistance.',
                ], 422);
            }
        } else {
            return response([
                'message' => __('auth.failed'),
            ], 422);
        }
    }

    /**
     * Attempt to login as admin
     *
     * @param [type] $id
     * @param [type] $email
     * @return response
     */
    private function attemptAdmin($id, $email)
    {
        $count = Session::get($email) ?? 0;
        $inc = $count + 1;
        Session::put($email, $inc);

        $attempt = 6 - $inc;
        if ($attempt == 0) {
            Session::forget($email);
            Admin::where('id', $id)->update(['block' => 1]);
        }

        return $attempt;
    }

    /**
     * Get authenticated admin data
     */
    public function user(Request $request)
    {
        return $request->user();
    }

    /**
     * Logout current authenticated admin.
     */
    public function logout(Request $request)
    {
        $expireAllToken = $request->input('expire_all_token') ?? true;
        if ($expireAllToken) {
            // Revoke all tokens...
            $request->user()->tokens()->delete();
        } else {
            // Revoke the token that was used to authenticate the current request...
            $request->user()->currentAccessToken()->delete();
        }

        return response()->json(['message' => 'Logout successfully.']);
    }
}
