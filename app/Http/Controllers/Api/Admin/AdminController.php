<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use App\Rules\Base64Image;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Mail\ResetPasswordMail;
use App\Action\Util\DeleteAction;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JsonSchema\Exception\ValidationException;

class AdminController extends Controller
{
    public function adminProfile(Request $request)
    {
        $data = [];
        $data = Admin::where('id', $request->admin_id)->get();
        if ($data->isEmpty()) {
            return $this->responseWithError("User not authenticated or profile not found.", 422);
        } else {
            $data = $data->map(function ($user) {
                return [
                    'id' => $user->id,
                    'profile_two' => $user->profile_two,
                    'username' => $user->username,
                    'name' => $user->name,
                    'email' => $user->email,
                    'mobile' => $user->mobile,
                    'address' => $user->address,
                    'block' => $user->block == 0 ? false : true,
                    'status' => $user->status,
                ];
            });
            return $this->responseWithSuccess($data, 200);
        }
    }

    public function updateProfile(Request $request, DeleteAction $deleteAction, Admin $admin)
    {
        $validator = $this->doValidation($request);
        if ($validator->fails()) {
            return $this->responseWithError($validator->errors()->all(), 422);
        }
        $data = Admin::find($request->id);
        if (!$data) {
            return $this->responseWithError('User not found', 404);
        }
        $profile = $request->image;
        if (!empty($profile)) {
            $resizeValue = $data['profile_resize_value'] ?? '600x600,300x300,50x50';
            $data['profile'] = cloudflare(file: $profile, folder: 'profile', resizeSize: $resizeValue, base64: true);
            $deleteAction->arrayImages($admin->profile);
        } else {
            $data['profile'] = $admin->profile && $admin->profile != 'null' ? $admin->profile : null;
        }
        $data->name = $request->name;
        $data->username = $request->username;
        $data->mobile = $request->mobile;
        $data->address = $request->address ?? $data->address;
        $data->profile = $data['profile'];
        $data->save();

        $data = [
            'id' => $data->id,
            'name' => $data->name,
            'email' => $data->email,
            'mobile' => $data->mobile,
            'address' => $data->address,
            'profile_two' => $data->profile_two,
            'block' => $data->block == 0 ? false : true,
            'status' => $data->status,
        ];
        return $this->responseWithSuccess($data, 200);

    }

    public function doValidation(Request $request)
    {
        return Validator::make($request->all(), [
            'id' => 'required|exists:admins,id',
            'name' => ['required', 'min:3', 'max:60'],
            'image' => ['nullable', 'string', new Base64Image()],
            'email' => 'required|email|unique:admins,email,' . $request->id,
            'mobile' => ['nullable', 'numeric', 'digits:11'],
            'address' => 'nullable|string',
        ]);
    }

    public function updatePassword(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'old_password' => 'required|string',
                'new_password' => 'required|string|min:6',
                'confirm_password' => 'required|string|same:new_password',
            ]);
            if ($validator->fails()) {
                return $this->responseWithError($validator->errors()->all(), 422);
            }

            $user = Admin::find($request->user()->id);
            if (!Hash::check($request->old_password, $user->password)) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'error_message' => [
                        ['message' => 'Old password does not match'],
                    ],
                ], 400);
            }
            $user->password = Hash::make($request->new_password);
            $user->save();
            return $this->responseWithSuccess([], 200);

        } catch (ValidationException $e) {
            return $this->responseWithError($e->errors(), 422);
        }
    }

    public function forgetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);
        if ($validator->fails()) {
            return $this->responseWithError($validator->errors()->all(), 422);
        }

        $user = Admin::where('email', $request->email)->first();
        if (!$user) {
            return $this->responseWithError('Email does not match');
        } else {
            $resetCode = mt_rand(100000, 999999);
            $user->password_reset_code = $resetCode;
            $user->password_reset_expires_at = now()->addMinutes(5);
            $user->save();

            Mail::to($user->email)->send(new ResetPasswordMail($resetCode, $user->name));

            return response()->json([
                'success' => 1,
                'error' => 0,
                'message' => 'Please check your email and provide the code below.',
            ], 200);
        }

    }

    public function verifyToken(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'reset_code' => 'required|integer|digits:6',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => $validator->errors()->all(),
            ], 422);
        } else {
            $admin = Admin::find($request->user()->id);
            if (!$admin) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'error_message' => [['message' => 'User not found']],
                ], 404);
            } elseif ($admin->password_reset_code == $request->reset_code) {
                $token = Str::random(32);
                // Session::put('admin_token', $token);
                return response()->json([
                    'success' => 1,
                    'error' => 0,
                    'message' => 'Reset code verified successfully.',
                    'token' => $token,
                ], 200);
            } else {
                return $this->responseWithError('Invalid reset code', 404);
            }
        }
    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:6',
            'confirm_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            $errorMessages = [];
            foreach ($validator->errors()->all() as $message) {
                $errorMessages[] = ['message' => $message];
            }

            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => $errorMessages,
            ], 422);
        }

        $admin = Admin::find($request->user()->id);

        if (!$admin) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => [['message' => 'Admin not found']],
            ], 404);
        }

        $admin->password = Hash::make($request->password);
        $admin->save();

        return response()->json([
            'success' => 1,
            'error' => 0,
            'message' => 'Password changed successfully.',
        ], 200);
    }

}
