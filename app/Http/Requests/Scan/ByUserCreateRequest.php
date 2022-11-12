<?php

namespace App\Http\Requests\Scan;

use App\Models\Scan\ByUser;
use Illuminate\Foundation\Http\FormRequest;

class ByUserCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return ByUser::$rules;
    }
}
