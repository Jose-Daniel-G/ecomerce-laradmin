<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class CoverSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('covers')->insert([
            [
                'id' => 1,
                'image_path' => 'covers/TrqzYg7RovbifClKWIDN9mMFFSa14jlxFxR82kWu.png',
                'title' => 'Appliance',
                'start_at' => '2025-10-14 00:00:00',
                'end_at' => null,
                'is_active' => 1,
                'order' => 1,
                'created_at' => '2025-10-14 18:15:04',
                'updated_at' => '2025-10-20 21:18:29',
            ],
            [
                'id' => 2,
                'image_path' => 'covers/PfEYLYJaeXmcjZNIaWAtChG5avk6wtaBOkSQ5RwR.png',
                'title' => 'Tv',
                'start_at' => '2025-10-14 00:00:00',
                'end_at' => null,
                'is_active' => 1,
                'order' => 2,
                'created_at' => '2025-10-14 18:16:28',
                'updated_at' => '2025-10-14 18:16:28',
            ],
            [
                'id' => 3,
                'image_path' => 'covers/ndFvhGHWHxBFW6RXQkqVyIltQGIX8K28dDJosY60.png',
                'title' => 'Laptops',
                'start_at' => '2025-10-14 00:00:00',
                'end_at' => null,
                'is_active' => 1,
                'order' => 3,
                'created_at' => '2025-10-14 18:17:16',
                'updated_at' => '2025-10-14 18:17:16',
            ],
        ]);
    }
}
