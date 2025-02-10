<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Http\Requests\RegistrationRequest;
use Illuminate\Foundation\Auth\User;

use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    private $form_show = [RegisterController::class, 'signupForm'];
    private $form_confirm = [RegisterController::class, 'confirm'];
    private $form_complete = [RegisterController::class, 'complete'];

    private $formItems = ["name", "email", "password"];

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'complete']);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    /*protected function validator(array $data)
    {
        $data = session()->all();
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'max:16', 'confirmed'],
        ], RegistersUsers::$registerErrorMessage);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */


    /**
     * 登録処理
     *
     */


    /**
     * 新規登録入力
     *
     */
    public function signupForm()
    {
        return view('auth.signup');
    }

    /*
     * 入力->確認
     */
    public function signupPost(RegistrationRequest $request)
    {
        return view('auth.signup_conf', [
            'input' => $request
        ]);
    }

    /*
     * 完了画面出力
     */
    public function signupComplete(User $user,Request $request)
    {
        if ($request->has('back')) {
            return redirect('/signup')->withInput();
        }

        $columns = ['name', 'email'];

        foreach ($columns as $column) {
            $user->$column = $request->$column;
        }

        $user->password = Hash::make($request->password);

        $user->save();

        return view('auth.signup_comp');
    }

    public function confirm()
    {
        return redirect('/signup');
    }

    public function complete()
    {
        return redirect('/signup');
    }
}
