<!-- Name Field -->
<div class="form-group col-lg-6">
    {!! Form::label('name', __('User').':') !!}
    {!! Form::select('user_id', $users, null, ['class' => 'form-control', 'placeholder'=>'-- Select User --']) !!}
</div>

<!-- Nric Field -->
<div class="form-group col-lg-6">
    {!! Form::label('date', __('Date').':') !!}
    {!! Form::date('date', null, ['class' => 'form-control']) !!}
</div>

<!-- Nric Field -->
<div class="form-group col-lg-6">
    {!! Form::label('IP Address', __('IP Address').':') !!}
    {!! Form::text('ip_address', null, ['class' => 'form-control']) !!}
</div>

<!-- Nric Field -->
<div class="form-group col-lg-6">
    {!! Form::label('Browser', __('Browser').':') !!}
    {!! Form::text('browser', null, ['class' => 'form-control']) !!}
</div>

