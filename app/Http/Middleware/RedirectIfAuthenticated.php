<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @param  string|null  ...$guards
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, ...$guards)
    {
        $guards = empty($guards) ? [null] : $guards;

        foreach ($guards as $guard) {
            // for api routes
            if (Auth::guard($guard)->check() && $request->is('api/*')) {
                return response()->json(['message' => 'Authenticated.']);
            }

            if (Auth::guard($guard)->check() && $guard == 'admin') {
                return redirect()->route('dashboard.index');
            }
            if (Auth::guard($guard)->check()) {
                return redirect()->route('user.dashboard');
            }
        }

        return $next($request);
    }
}
