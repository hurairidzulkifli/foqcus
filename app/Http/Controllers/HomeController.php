<?php

namespace App\Http\Controllers;

use App\Models\Scan\ByBrowser;
use App\Models\Scan\ByIp;
use App\Models\Scan\ByUser;
use Illuminate\Http\Request;
use DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $byUsers = ByUser::select(['user_id','date', DB::raw('count(user_id) as total')])->groupBy('user_id','date')->get();

        $byIps = ByIp::select(['ip_address','date', DB::raw('count(ip_address) as total')])->groupBy('ip_address','date')->get();

        $byBrowsers = ByBrowser::select(['browser','date', DB::raw('count(browser) as total')])->groupBy('browser','date')->get();

        return view('home', compact('byUsers','byIps','byBrowsers'));
    }
}
