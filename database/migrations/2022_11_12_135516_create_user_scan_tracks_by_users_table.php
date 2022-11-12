<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserScanTracksByUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('scan_tracks_by_users', function (Blueprint $table) {
            $table->id();
            $table->date('date');
            $table->foreignId('user_id')->nullable()->constrained('users');
            $table->unsignedSmallInteger('scan_count')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_scan_tracks_by_users');
    }
}
