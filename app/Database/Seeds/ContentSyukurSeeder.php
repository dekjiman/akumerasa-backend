<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentSyukurSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [
            [
                'surah' => 14,
                'ayat_number' => 7,
                'arabic_text' => 'وَإِذْ تَأَذَّنَ رَبُّكُمْ لَئِنْ شَكَرْتُمْ لَأَزِيدَنَّكُمْ ۖ وَلَئِنْ كَفَرْتُمْ إِنَّ عَذَابِي لَشَدِيدٌ',
                'translation' => 'Ingatlah ketika Tuhanmu memaklumkan, jika kamu bersyukur, Niscaya Kami akan menambah nikmat kepadamu, tetapi jika kamu mengingkari, sungguh azab-Ku sangat berat.',
                'tags' => 'syukur, penambahan nikmat, janji Allah',
            ],
            [
                'surah' => 2,
                'ayat_number' => 152,
                'arabic_text' => 'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ',
                'translation' => 'Ingatlah kepada-Ku, Niscaya Aku ingat kepadamu. Bersyukurlah kepada-Ku dan janganlah kamu ingkar.',
                'tags' => 'syukur, zikir, perintah bersyukur',
            ],
            [
                'surah' => 2,
                'ayat_number' => 172,
                'arabic_text' => 'يَا أَيُّهَا الَّذِينَ آمَنُوا كُلُوا مِنْ طَيِّبَاتِ مَا رَزَقْنَاكُمْ وَاشْكُرُوا لِلَّهِ إِنْ كُنْتُمْ إِيَّاهُ تَعْبُدُونَ',
                'translation' => 'Wahai orang-orang yang beriman, makanlah dari rezeki yang baik yang Kami berikan kepadamu dan bersyukurlah kepada Allah jika kamu hanya menyembah kepada-Nya.',
                'tags' => 'syukur, rezeki, ibadah',
            ],
            [
                'surah' => 31,
                'ayat_number' => 12,
                'arabic_text' => 'وَلَقَدْ آتَيْنَا لُقْمَانَ الْحِكْمَةَ أَنِ اشْكُرْ لِلَّهِ ۚ وَمَنْ يَشْكُرْ فَإِنَّمَا يَشْكُرُ لِنَفْسِهِ ۖ وَمَنْ كَفَرَ فَإِنَّ اللَّهَ غَنِيٌّ حَمِيدٌ',
                'translation' => 'Sungguh, Kami telah memberikan hikmah kepada Luqman, yaitu bersyukurlah kepada Allah. Barangsiapa bersyukur, sesungguhnya dia bersyukur untuk dirinya sendiri.',
                'tags' => 'syukur, hikmah, manfaat syukur',
            ],
            [
                'surah' => 16,
                'ayat_number' => 78,
                'arabic_text' => 'وَاللَّهُ أَخْرَجَكُمْ مِنْ بُطُونِ أُمَّهَاتِكُمْ لَا تَعْلَمُونَ شَيْئًا وَجَعَلَ لَكُمُ السَّمْعَ وَالْأَبْصَارَ وَالْأَفْئِدَةَ ۙ لَعَلَّكُمْ تَشْكُرُونَ',
                'translation' => 'Allah mengeluarkan kamu dari perut ibumu dalam keadaan tidak mengetahui sesuatu pun, dan Dia memberimu pendengaran, penglihatan, dan hati agar kamu bersyukur.',
                'tags' => 'syukur, nikmat penciptaan, panca indra',
            ],
            [
                'surah' => 16,
                'ayat_number' => 114,
                'arabic_text' => 'فَكُلُوا مِمَّا رَزَقَكُمُ اللَّهُ حَلَالًا طَيِّبًا وَاشْكُرُوا نِعْمَتَ اللَّهِ إِنْ كُنْتُمْ إِيَّاهُ تَعْبُدُونَ',
                'translation' => 'Makanlah rezeki yang halal lagi baik yang telah Allah berikan kepadamu, dan syukurilah nikmat Allah jika kamu hanya menyembah kepada-Nya.',
                'tags' => 'syukur, rezeki halal, ibadah',
            ],
            [
                'surah' => 16,
                'ayat_number' => 53,
                'arabic_text' => 'وَمَا بِكُمْ مِنْ نِعْمَةٍ فَمِنَ اللَّهِ ۖ ثُمَّ إِذَا مَسَّكُمُ الضُّرُّ فَإِلَيْهِ تَجْأَرُونَ',
                'translation' => 'Segala nikmat yang ada padamu adalah dari Allah, kemudian apabila kamu ditimpa kesusahan, hanya kepada-Nyalah kamu memohon pertolongan.',
                'tags' => 'syukur, sumber nikmat, pengakuan',
            ],
            [
                'surah' => 55,
                'ayat_number' => 13,
                'arabic_text' => 'فَبِأَيِّ آلَاءِ رَبِّكُمَا تُكَذِّبَانِ',
                'translation' => 'Maka nikmat Tuhanmu yang manakah yang kamu dustakan?',
                'tags' => 'syukur, nikmat Allah, pengingat',
            ],
            [
                'surah' => 93,
                'ayat_number' => 11,
                'arabic_text' => 'وَأَمَّا بِنِعْمَةِ رَبِّكَ فَحَدِّثْ',
                'translation' => 'Dan terhadap nikmat Tuhanmu, hendaklah engkau nyatakan (dengan bersyukur).',
                'tags' => 'syukur, tahadduts bin ni\'mah, pernyataan nikmat',
            ],
            [
                'surah' => 27,
                'ayat_number' => 40,
                'arabic_text' => 'هَٰذَا مِنْ فَضْلِ رَبِّي لِيَبْلُوَنِي أَأَشْكُرُ أَمْ أَكْفُرُ ۖ وَمَنْ شَكَرَ فَإِنَّمَا يَشْكُرُ لِنَفْسِهِ',
                'translation' => 'Ini termasuk karunia Tuhanku untuk mengujiku, apakah aku bersyukur atau ingkar. Barangsiapa bersyukur, sesungguhnya dia bersyukur untuk kebaikan dirinya sendiri.',
                'tags' => 'syukur, ujian karunia, Nabi Sulaiman',
            ],
            [
                'surah' => 39,
                'ayat_number' => 7,
                'arabic_text' => 'إِنْ تَكْفُرُوا فَإِنَّ اللَّهَ غَنِيٌّ عَنْكُمْ ۖ وَلَا يَرْضَىٰ لِعِبَادِهِ الْكُفْرَ ۖ وَإِنْ تَشْكُرُوا يَرْضَهُ لَكُمْ',
                'translation' => 'Jika kamu ingkar, sesungguhnya Allah Mahakaya atasmu. Dia tidak meridhai keingkaran hamba-Nya, dan jika kamu bersyukur, Dia meridhai kesyukuranmu itu.',
                'tags' => 'syukur, ridha Allah, pilihan hamba',
            ],
            [
                'surah' => 3,
                'ayat_number' => 144,
                'arabic_text' => 'وَسَيَجْزِي اللَّهُ الشَّاكِرِينَ',
                'translation' => 'Dan Allah akan memberi balasan kepada orang-orang yang bersyukur.',
                'tags' => 'syukur, pahala, balasan Allah',
            ],
            [
                'surah' => 3,
                'ayat_number' => 145,
                'arabic_text' => 'وَمَنْ يُرِدْ ثَوَابَ الْآخِرَةِ نُؤْتِهِ مِنْهَا ۚ وَسَنَجْزِي الشَّاكِرِينَ',
                'translation' => 'Barangsiapa menghendaki pahala akhirat, Kami berikan kepadanya. Kami akan memberi balasan kepada orang-orang yang bersyukur.',
                'tags' => 'syukur, pahala akhirat, balasan',
            ],
            [
                'surah' => 4,
                'ayat_number' => 147,
                'arabic_text' => 'مَا يَفْعَلُ اللَّهُ بِعَذَابِكُمْ إِنْ شَكَرْتُمْ وَآمَنْتُمْ ۚ وَكَانَ اللَّهُ شَاكِرًا عَلِيمًا',
                'translation' => 'Allah tidak akan menyiksamu jika kamu bersyukur dan beriman. Allah Maha Mensyukuri lagi Maha Mengetahui.',
                'tags' => 'syukur, keselamatan, iman',
            ],
            [
                'surah' => 35,
                'ayat_number' => 30,
                'arabic_text' => 'لِيُوَفِّيَهُمْ أُجُورَهُمْ وَيَزِيدَهُمْ مِنْ فَضْلِهِ ۚ إِنَّهُ غَفُورٌ شَكُورٌ',
                'translation' => 'Agar Allah menyempurnakan pahala mereka dan menambah karunia-Nya. Sesungguhnya Allah Maha Pengampun lagi Maha Mensyukuri.',
                'tags' => 'syukur, karunia, Asmaul Husna',
            ],
            [
                'surah' => 35,
                'ayat_number' => 34,
                'arabic_text' => 'وَقَالُوا الْحَمْدُ لِلَّهِ الَّذِي أَذْهَبَ عَنَّا الْحَزَنَ ۖ إِنَّ رَبَّنَا لَغَفُورٌ شَكُورٌ',
                'translation' => 'Mereka berkata, Segala puji bagi Allah yang telah menghilangkan duka cita dari kami. Sesungguhnya Tuhan kami Maha Pengampun lagi Maha Mensyukuri.',
                'tags' => 'syukur, pujian, surga',
            ],
            [
                'surah' => 64,
                'ayat_number' => 17,
                'arabic_text' => 'إِنْ تُقْرِضُوا اللَّهَ قَرْضًا حَسَنًا يُضَاعِفْهُ لَكُمْ وَيَغْفِرْ لَكُمْ ۚ وَاللَّهُ شَكُورٌ حَلِيمٌ',
                'translation' => 'Jika kamu meminjamkan kepada Allah pinjaman yang baik, Niscaya Dia melipatgandakan balasannya dan mengampunimu. Allah Maha Mensyukuri lagi Maha Penyantun.',
                'tags' => 'syukur, sedekah, kelipatan pahala',
            ],
            [
                'surah' => 42,
                'ayat_number' => 23,
                'arabic_text' => 'وَمَنْ يَقْتَرِفْ حَسَنَةً نَزِدْ لَهُ فِيهَا حُسْنًا ۚ إِنَّ اللَّهَ غَفُورٌ شَكُورٌ',
                'translation' => 'Siapa yang mengerjakan kebaikan, Kami tambahkan kebaikan baginya. Sesungguhnya Allah Maha Pengampun lagi Maha Mensyukuri.',
                'tags' => 'syukur, kebaikan, penambahan pahala',
            ],
            [
                'surah' => 100,
                'ayat_number' => 6,
                'arabic_text' => 'إِنَّ الْإِنْسَانَ لِرَبِّهِ لَكَنُودٌ',
                'translation' => 'Sesungguhnya manusia itu sangat ingkar (tidak bersyukur) kepada Tuhannya.',
                'tags' => 'syukur, kelalaian manusia',
            ],
        ];

        foreach ($quranVerses as $verse) {
            $this->db->table('quran_verses')->insert([
                'surah'       => $verse['surah'],
                'ayat_number' => $verse['ayat_number'],
                'arabic_text' => $verse['arabic_text'],
                'translation' => $verse['translation'],
                'source'      => "Al-Qur'an",
                'tags'        => $verse['tags'],
                'status'      => 'approved',
                'created_at'  => $now,
                'updated_at'  => $now,
            ]);
        }

        echo 'Seeded ' . count($quranVerses) . ' quran verses (syukur).' . PHP_EOL;
    }
}
