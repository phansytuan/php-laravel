<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('a_student_major', function (Blueprint $table) {
            $table->unsignedBigInteger('student_id')->primary(); // Khóa chính
            $table->string('student_name');
            $table->string('email')->unique()->nullable();
            $table->string('major_code', 10); // Ví dụ: SE, DS, BA, v.v.
            $table->string('major_name');     // Ví dụ: Software Engineering
            $table->date('enrollment_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('a_student_major');
    }
};
