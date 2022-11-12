<?php

namespace App\Models\Scan;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ByUser extends Model
{
    use HasFactory;

    public $table = 'scan_tracks_by_users';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $fillable = [
        'date',
        'user_id',
        'scan_count',
    ];

    public static $rules = [
        'user_id' => 'required',
        'date' => 'required',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
