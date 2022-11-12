@extends('layouts.app')

@section('content')
    <section class="content-header"><h1></h1></section>
    <div class="content">
        <div class="container">
            <div class="box-body">
                {!! Form::open(['route' => 'scan_users.store']) !!}
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                Form 1
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    @include('scan.users.fields')
                                </div>
                            </div>
                            <div class="ibox-footer">
                                <div class="row">
                                    <div class="text-center">
                                        {!! Form::submit(__('Save'), ['class' => 'btn btn-primary']) !!}
                                        <a href="{{ route('home') }}" class="btn btn-warning">Back</a>
                                    </div>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection


