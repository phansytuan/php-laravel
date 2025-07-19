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
        Schema::create('a_course_unit', function (Blueprint $table) {
            $table->string('U_CODE', 45)->primary(); // Khóa chính dùng cho khóa ngoại từ bảng khác
            $table->string('name');
            $table->integer('credit')->default(3); // Ví dụ số tín chỉ
            $table->string('description')->nullable(); // Mô tả môn học
            $table->timestamps(); // created_at & updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('a_course_unit');
    }
};
