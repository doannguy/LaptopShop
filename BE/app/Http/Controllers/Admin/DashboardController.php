<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $order = $this->order();
        $sales = $this->sales();
        $user = $this->user();

        return view('dashboard', compact('order', 'sales', 'user'));
    }

    public function productDatatable(Request $request)
    {
        return response()->json($this->filterDatatable($request->input()));
    }

    public function order()
    {
        $currentMonthStart = Carbon::now()->startOfMonth();
        $lastMonthStart = Carbon::now()->subMonth()->startOfMonth();

        $currentMonthOrders = Order::where('created_at', '>=', $currentMonthStart)->count();
        $lastMonthOrders = Order::where('created_at', '>=', $lastMonthStart)
            ->where('created_at', '<', $currentMonthStart)
            ->count();

        if ($lastMonthOrders > 0) {
            $percentageChange = (($currentMonthOrders - $lastMonthOrders) / $lastMonthOrders) * 100;
        } else {
            $percentageChange = $currentMonthOrders > 0 ? 100 : 0;
        }

        return [
            'currentMonthOrders' => $currentMonthOrders,
            'lastMonthOrders' => $lastMonthOrders,
            'percentageChange' => $percentageChange
        ];
    }

    public function user()
    {
        $currentMonthStart = Carbon::now()->startOfMonth();
        $lastMonthStart = Carbon::now()->subMonth()->startOfMonth();

        $currentMonthUsers = User::where('created_at', '>=', $currentMonthStart)->count();
        $lastMonthUsers = User::where('created_at', '>=', $lastMonthStart)
            ->where('created_at', '<', $currentMonthStart)
            ->count();

        if ($lastMonthUsers > 0) {
            $percentageChange = (($currentMonthUsers - $lastMonthUsers) / $lastMonthUsers) * 100;
        } else {
            $percentageChange = $currentMonthUsers > 0 ? 100 : 0;
        }

        return [
            'currentMonthUsers' => $currentMonthUsers,
            'lastMonthUsers' => $lastMonthUsers,
            'percentageChange' => $percentageChange
        ];
    }

    public function sales()
    {
        $today = Carbon::today();
        $startDate = $today->copy()->subDays(13);

        $revenues = Order::select(DB::raw('DATE(created_at) as date'), DB::raw('SUM(total_price) as total'))
            ->whereBetween('created_at', [$startDate, $today])
            ->groupBy('date')
            ->orderBy('date', 'ASC')
            ->get();

        $revenueByDay = [];
        $daysArray = [];

        for ($i = 0; $i < 14; $i++) {
            $date = $startDate->copy()->addDays($i)->format('Y-m-d');
            $revenueByDay[$date] = 0;
            if ($i == 0 || $i == 13) {
                $daysArray[] = '';
            } else {
                $daysArray[] = $startDate->copy()->addDays($i)->format('d/m');
            }
        }

        foreach ($revenues as $revenue) {
            $revenueByDay[$revenue->date] = $revenue->total;
        }

        $revenueArray = array_values($revenueByDay);

        return [
            'revenue' => $revenueArray,
            'days' => $daysArray
        ];
    }

    // public function filterDatatable(array $data)
    // {
    //     $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
    //     $pageLength = $data['length'] ?? 10;
    //     $skip = ($pageNumber - 1) * $pageLength;

    //     $query = Product::query();
    //     $query->whereHas('productOptions.orderDetails', function ($q) {
    //         $q->select(DB::raw('COALESCE(SUM(quantity), 0) as total_quantity'))
    //             ->groupBy('product_options.product_id')
    //             ->orderBy('total_quantity', 'desc');
    //     });

    //     $recordsFiltered = $recordsTotal = $query->count();
    //     $products = $query->skip($skip)
    //         ->take($pageLength)
    //         ->with(['thumbnailMedia'])
    //         ->get();

    //     return [
    //         "draw" => $data['draw'] ?? 1,
    //         "recordsTotal" => $recordsTotal,
    //         "recordsFiltered" => $recordsFiltered,
    //         'data' => $products
    //     ];
    // }
}
