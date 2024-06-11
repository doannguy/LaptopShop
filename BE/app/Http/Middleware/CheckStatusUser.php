<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckStatusUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (!$request->user() || $request->user()->status == User::STATUS_INACTIVE) {
            if ($request->expectsJson()) {
                return jsonResponse(-1, message: "Tài khoản của bạn đã bị vô hiệu hoá!");
            } else {
                Auth::logout();
                return redirect()->route('login')->withErrors(['block' => 'Tài khoản của bạn đã bị vô hiệu hoá!']);
            }
        }
        return $next($request);
    }
}
