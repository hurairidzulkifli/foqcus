@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>
                <div class="card-body">
                    <div class="pull-right">
                        <a class="btn btn-success" href="{{ route('scan_users.create') }}"> Create Scan Track By User</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Scan Count</th>
                        </tr>
                        @forelse ($byUsers as $key=> $data)
                        <tr>
                            <td>{{ ++$key }}</td>
                            <td>{{ \App\Models\User::where('id', $data->user_id)->first()->name }}</td>
                            <td>{{ \Carbon\Carbon::parse($data->date)->format('d-m-Y') }}</td>
                            <td>{{ $data->total }}</td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="4">-</td>
                        </tr>
                        @endforelse
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Scan Count</th>
                        </tr>
                        @forelse ($byBrowsers as $key=> $data)
                        <tr>
                            <td>{{ ++$key }}</td>
                            <td>{{ $data->browser }}</td>
                            <td>{{ \Carbon\Carbon::parse($data->date)->format('d-m-Y') }}</td>
                            <td>{{ $data->total }}</td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="4">-</td>
                        </tr>
                        @endforelse
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Scan Count</th>
                        </tr>
                        @forelse ($byIps as $key=> $data)
                        <tr>
                            <td>{{ ++$key }}</td>
                            <td>{{ $data->ip_address }}</td>
                            <td>{{ \Carbon\Carbon::parse($data->date)->format('d-m-Y') }}</td>
                            <td>{{ $data->total }}</td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="4">-</td>
                        </tr>
                        @endforelse
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
