<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ResetPasswordMail extends Mailable
{
    use Queueable, SerializesModels;
    public $resetCode;
    public $name;
    public function __construct($resetCode, $name)
    {
        $this->resetCode = $resetCode;
        $this->name = $name;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('admin.email.password_reset')
            ->with(['resetCode' => $this->resetCode, 'name' => $this->name]);
    }
}
