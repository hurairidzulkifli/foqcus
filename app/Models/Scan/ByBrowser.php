<?php

namespace App\Models\Scan;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ByBrowser extends Model
{
    use HasFactory;

    public $table = 'scan_tracks_by_browsers';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $fillable = [
        'date',
        'user_id',
        'browser',
        'scan_count',
    ];

    public static $rules = [
        'user_id' => 'required',
        'date' => 'required',
        'browser'=>'required',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
