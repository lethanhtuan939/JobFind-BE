<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'description'];

    public function posts()
    {
        return $this->belongsToMany(Post::class, 'post_position', 'position_id', 'post_id');
    }
}
