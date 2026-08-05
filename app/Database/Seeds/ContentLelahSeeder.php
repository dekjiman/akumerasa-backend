<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentLelahSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [
            [
                'surah' => 94,
                'ayat_number' => 7,
                'arabic_text' => 'فَإِذَا فَرَغْتَ فَانْصَبْ',
                'translation' => 'Maka apabila engkau telah selesai (dari suatu urusan), tetaplah bekerja keras (untuk urusan yang lain).',
                'tags' => 'lelah, kerja keras, perjuangan',
            ],
            [
                'surah' => 94,
                'ayat_number' => 8,
                'arabic_text' => 'وَإِلَىٰ رَبِّكَ فَارْغَبْ',
                'translation' => 'Dan hanya kepada Tuhanmulah engkau berharap.',
                'tags' => 'lelah, harapan, tawakal',
            ],
            [
                'surah' => 90,
                'ayat_number' => 4,
                'arabic_text' => 'لَقَدْ خَلَقْنَا الْإِنْسَانَ فِي كَبَدٍ',
                'translation' => 'Sungguh, Kami telah menciptakan manusia berada dalam susah payah (keletihan).',
                'tags' => 'lelah, hakikat hidup, susah payah',
            ],
            [
                'surah' => 18,
                'ayat_number' => 62,
                'arabic_text' => 'فَلَمَّا جَاوَزَا قَالَ لِفَتَاهُ آتِنَا غَدَاءَنَا لَقَدْ لَقِينَا مِنْ سَفَرِنَا هَٰذَا نَصَبًا',
                'translation' => 'Maka ketika mereka telah berjalan lebih jauh, berkatalah Musa kepada pembantunya: \'Bawalah kemari makanan kita; sungguh kita telah merasa sangat letih karena perjalanan kita ini.\'',
                'tags' => 'lelah, letih fisik, perjalanan',
            ],
            [
                'surah' => 9,
                'ayat_number' => 120,
                'arabic_text' => 'ذَٰلِكَ بِأَنَّهُمْ لَا يُصِيبُهُمْ ظَمَأٌ وَلَا نَصَبٌ وَلَا مَخْمَصَةٌ فِي سَبِيلِ اللَّهِ... إِلَّا كُتِبَ لَهُمْ بِهِ عَمَلٌ صَالِحٌ',
                'translation' => 'Yang demikian itu karena mereka tidak ditimpa kehausan, keletihan, dan kelaparan di jalan Allah... melainkan dituliskan bagi mereka sebagai suatu amal saleh.',
                'tags' => 'lelah, pahala, perjuangan di jalan Allah',
            ],
            [
                'surah' => 35,
                'ayat_number' => 35,
                'arabic_text' => 'الَّذِي أَحَلَّنَا دَارَ الْمُقَامَةِ مِنْ فَضْلِهِ لَا يَمَسُّنَا فِيهَا نَصَبٌ وَلَا يَمَسُّنَا فِيهَا لُغُوبٌ',
                'translation' => 'Yang dengan karunia-Nya menempatkan kami dalam tempat yang kekal (surga); di dalamnya kami tidak merasa lelah dan tidak pula merasa lesu.',
                'tags' => 'lelah, surga, tempat istirahat abadi',
            ],
            [
                'surah' => 50,
                'ayat_number' => 38,
                'arabic_text' => 'وَلَقَدْ خَلَقْنَا السَّمَاوَاتِ وَالْأَرْضَ وَمَا بَيْنَهُمَا فِي سِتَّةِ أَيَّامٍ وَمَا مَسَّنَا مِنْ لُغُوبٍ',
                'translation' => 'Dan sungguh, Kami telah menciptakan langit dan bumi dan apa yang ada di antara keduanya dalam enam masa, dan Kami tidak ditimpa keletihan sedikit pun.',
                'tags' => 'kuasa Allah, tidak lelah',
            ],
            [
                'surah' => 78,
                'ayat_number' => 9,
                'arabic_text' => 'وَجَعَلْنَا نَوْمَكُمْ سُبَاتًا',
                'translation' => 'Dan Kami jadikan tidurmu untuk istirahat.',
                'tags' => 'lelah, tidur, istirahat',
            ],
            [
                'surah' => 78,
                'ayat_number' => 10,
                'arabic_text' => 'وَجَعَلْنَا اللَّيْلَ لِبَاسًا',
                'translation' => 'Dan Kami jadikan malam sebagai pakaian (penutup).',
                'tags' => 'lelah, malam, ketenangan',
            ],
            [
                'surah' => 25,
                'ayat_number' => 47,
                'arabic_text' => 'وَهُوَ الَّذِي جَعَلَ لَكُمُ اللَّيْلَ لِبَاسًا وَالنَّوْمَ سُبَاتًا وَجَعَلَ النَّهَارَ نُشُورًا',
                'translation' => 'Dialah yang menjadikan malam untukmu (sebagai) pakaian, dan tidur untuk istirahat, dan Dia menjadikan siang untuk bangkit berusaha.',
                'tags' => 'lelah, istirahat, kerja',
            ],
            [
                'surah' => 28,
                'ayat_number' => 73,
                'arabic_text' => 'وَمِنْ رَحْمَتِهِ جَعَلَ لَكُمُ اللَّيْلَ وَالنَّهَارَ لِتَسْكُنُوا فِيهِ وَلِتَبْتَغُوا مِنْ فَضْلِهِ وَلَعَلَّكُمْ تَشْكُرُونَ',
                'translation' => 'Dan adalah karena rahmat-Nya, Dia jadikan untukmu malam dan siang, agar kamu beristirahat pada malam hari dan agar kamu mencari sebagian dari karunia-Nya (pada siang hari)...',
                'tags' => 'lelah, rahmat Allah, ritme hidup',
            ],
            [
                'surah' => 2,
                'ayat_number' => 286,
                'arabic_text' => 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا',
                'translation' => 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.',
                'tags' => 'lelah, beban hidup, batas kemampuan',
            ],
            [
                'surah' => 94,
                'ayat_number' => 5,
                'arabic_text' => 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا',
                'translation' => 'Maka sesungguhnya bersama kesulitan ada kemudahan.',
                'tags' => 'lelah, kesulitan, solusi',
            ],
            [
                'surah' => 94,
                'ayat_number' => 6,
                'arabic_text' => 'إِنَّ مَعَ الْعُسْرِ يُسْرًا',
                'translation' => 'Sesungguhnya bersama kesulitan ada kemudahan.',
                'tags' => 'lelah, janji Allah, kelapangan',
            ],
            [
                'surah' => 29,
                'ayat_number' => 69,
                'arabic_text' => 'وَالَّذِينَ جَاهَدُوا فِينَا لَنَهْدِيَنَّهُمْ سُبُلَنَا ۚ وَإِنَّ اللَّهَ لَمَعَ الْمُحْسِنِينَ',
                'translation' => 'Dan orang-orang yang berjihad (bersungguh-sungguh/mencurahkan tenaga) untuk (mencari keridhaan) Kami, sungguh Kami akan tunjukkan kepada mereka jalan-jalan Kami...',
                'tags' => 'lelah, kesungguhan, petunjuk',
            ],
            [
                'surah' => 3,
                'ayat_number' => 142,
                'arabic_text' => 'أَمْ حَسِبْتُمْ أَنْ تَدْخُلُوا الْجَنَّةَ وَلَمَّا يَعْلَمِ اللَّهُ الَّذِينَ جَاهَدُوا مِنْكُمْ وَيَعْلَمَ الصَّابِرِينَ',
                'translation' => 'Apakah kamu mengira bahwa kamu akan masuk surga, padahal belum nyata bagi Allah orang-orang yang berjihad di antara kamu dan belum nyata orang-orang yang sabar.',
                'tags' => 'lelah, perjuangan, surga',
            ],
            [
                'surah' => 2,
                'ayat_number' => 214,
                'arabic_text' => 'أَمْ حَسِبْتُمْ أَنْ تَدْخُلُوا الْجَنَّةَ وَلَمَّا يَأْتِكُمْ مَثَلُ الَّذِينَ خَلَوْا مِنْ قَبْلِكُمْ ۖ مَسَّتْهُمُ الْبَأْسَاءُ وَالضَّرَّاءُ وَزُلْزِلُوا',
                'translation' => 'Apakah kamu mengira bahwa kamu akan masuk surga, padahal belum datang kepadamu (cobaan) seperti orang-orang terdahulu sebelum kamu? Mereka ditimpa kemelaratan, penderitaan dan digoncangkan...',
                'tags' => 'lelah, ujian berat, kesabaran',
            ],
            [
                'surah' => 2,
                'ayat_number' => 153,
                'arabic_text' => 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ',
                'translation' => 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.',
                'tags' => 'lelah, pemulihan, salat dan sabar',
            ],
            [
                'surah' => 53,
                'ayat_number' => 39,
                'arabic_text' => 'وَأَنْ لَيْسَ لِلْإِنْسَانِ إِلَّا مَا سَعَىٰ',
                'translation' => 'Dan bahwa manusia hanya memperoleh apa yang telah diusahakannya.',
                'tags' => 'lelah, usaha, hasil',
            ],
            [
                'surah' => 53,
                'ayat_number' => 40,
                'arabic_text' => 'وَأَنَّ سَعْيَهُ سَوْفَ يُرَىٰ',
                'translation' => 'Dan bahwa usahanya itu kelak akan diperlihatkan (kepadanya).',
                'tags' => 'lelah, balasan usaha, keadilan',
            ],
            [
                'surah' => 88,
                'ayat_number' => 3,
                'arabic_text' => 'عَامِلَةٌ نَاصِبَةٌ',
                'translation' => 'Bekerja keras lagi kepayahan (di dunia, namun rugi di akhirat jika tanpa iman).',
                'tags' => 'lelah, kerja keras, peringatan',
            ],
            [
                'surah' => 88,
                'ayat_number' => 8,
                'arabic_text' => 'وُجُوهٌ يَوْمَئِذٍ نَاعِمَةٌ',
                'translation' => 'Pada hari itu banyak wajah yang berseri-seri,',
                'tags' => 'lelah, kebahagiaan akhirat',
            ],
            [
                'surah' => 88,
                'ayat_number' => 9,
                'arabic_text' => 'لِسَعْيِهَا رَاضِيَةٌ',
                'translation' => 'merasa puas karena usahanya (yang telah melelahkannya di dunia).',
                'tags' => 'lelah, kepuasan usaha, pahala',
            ],
            [
                'surah' => 46,
                'ayat_number' => 35,
                'arabic_text' => 'فَاصْبِرْ كَمَا صَبَرَ أُولُو الْعَزْمِ مِنَ الرُّسُلِ',
                'translation' => 'Maka bersabarlah engkau (Muhammad) sebagaimana kesabaran rasul-rasul yang memiliki keteguhan hati...',
                'tags' => 'lelah, keteguhan, teladan rasul',
            ],
            [
                'surah' => 3,
                'ayat_number' => 200,
                'arabic_text' => 'يَا أَيُّهَا الَّذِينَ آمَنُوا اصْبِرُوا وَصَابِرُوا وَرَابِطُوا وَاتَّقُوا اللَّهَ لَعَلَّكُمْ تُفْلِحُونَ',
                'translation' => 'Wahai orang-orang yang beriman! Bersabarlah kamu dan tingkatkanlah kesabaranmu dan tetaplah bersiap-siap dan bertakwalah kepada Allah agar kamu beruntung.',
                'tags' => 'lelah, daya tahan, kemenangan',
            ],
            [
                'surah' => 65,
                'ayat_number' => 7,
                'arabic_text' => 'لِيُنْفِقْ ذُو سَعَةٍ مِنْ سَعَتِهِ ۖ وَمَنْ قُدِرَ عَلَيْهِ رِزْقُهُ فَلْيُنْفِقْ مِمَّا آتَاهُ اللَّهُ ۚ لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا مَا آتَاهَا ۚ سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا',
                'translation' => '...Allah tidak membebani seseorang melainkan sesuai dengan apa yang diberikan Allah kepadanya. Allah kelak akan memberikan kelapangan setelah kesempitan.',
                'tags' => 'lelah, kelapangan, kadar beban',
            ],
            [
                'surah' => 13,
                'ayat_number' => 28,
                'arabic_text' => 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                'translation' => '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.',
                'tags' => 'lelah jiwa, ketenangan, zikir',
            ],
            [
                'surah' => 2,
                'ayat_number' => 255,
                'arabic_text' => 'لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ',
                'translation' => '...Tidak mengantuk dan tidak tidur...',
                'tags' => 'keagungan Allah, tidak pernah lelah',
            ],
            [
                'surah' => 41,
                'ayat_number' => 38,
                'arabic_text' => 'فَإِنِ اسْتَكْبَرُوا فَالَّذِينَ عِنْدَ رَبِّكَ يُسَبِّحُونَ لَهُ بِاللَّيْلِ وَالنَّهَارِ وَهُمْ لَا يَسْأَمُونَ',
                'translation' => 'Jika mereka menyombongkan diri, maka mereka (malaikat) yang di sisi Tuhanmu bertasbih kepada-Nya malam dan siang hari, sedang mereka tidak pernah merasa jemu/lelah.',
                'tags' => 'malaikat, ibadah, tidak lelah',
            ],
            [
                'surah' => 21,
                'ayat_number' => 19,
                'arabic_text' => 'وَمَنْ عِنْدَهُ لَا يَسْتَكْبِرُونَ عَنْ عِبَادَتِهِ وَلَا يَسْتَحْسِرُونَ',
                'translation' => '...Dan malaikat-malaikat yang di sisi-Nya, mereka tidak merasa angkuh untuk menyembah-Nya dan tidak pula merasa letih.',
                'tags' => 'tidak letih, malaikat, ibadah',
            ],
            [
                'surah' => 21,
                'ayat_number' => 20,
                'arabic_text' => 'يُسَبِّحُونَ اللَّيْلَ وَالنَّهَارَ لَا يَفْتُرُونَ',
                'translation' => 'Mereka bertasbih malam dan siang tiada henti-hentinya (tanpa lelah).',
                'tags' => 'konsistensi, bertasbih, tanpa lelah',
            ],
            [
                'surah' => 20,
                'ayat_number' => 2,
                'arabic_text' => 'مَا أَنْزَلْنَا عَلَيْكَ الْقُرْآنَ لِتَشْقَىٰ',
                'translation' => 'Kami tidak menurunkan Al-Qur\'an ini kepadamu (Muhammad) agar engkau menjadi susah/kepayahan.',
                'tags' => 'lelah, kemudahan agama, Al-Qur\'an',
            ],
            [
                'surah' => 22,
                'ayat_number' => 78,
                'arabic_text' => 'وَمَا جَعَلَ عَلَيْكُمْ فِي الدِّينِ مِنْ حَرَجٍ',
                'translation' => '...dan Dia tidak menjadikan kamu merasa keberatan/kesukaran dalam agama...',
                'tags' => 'lelah, kemudahan, syariat',
            ],
            [
                'surah' => 4,
                'ayat_number' => 104,
                'arabic_text' => 'إِنْ تَكُونُوا تَأْلَمُونَ فَإِنَّهُمْ يَأْلَمُونَ كَمَا تَأْلَمُونَ ۖ وَتَرْجُونَ مِنَ اللَّهِ مَا لَا يَرْجُونَ',
                'translation' => '...Jika kamu menderita kesakitan/keletihan, maka sesungguhnya mereka pun menderita kesakitan (pula), sebagaimana kamu menderitanya, sedang kamu mengharapkan dari Allah apa yang tidak mereka harapkan...',
                'tags' => 'lelah, pengorbanan, harapan pahala',
            ],
            [
                'surah' => 16,
                'ayat_number' => 7,
                'arabic_text' => 'وَتَحْمِلُ أَثْقَالَكُمْ إِلَىٰ بَلَدٍ لَمْ تَكُونُوا بَالِغِيهِ إِلَّا بِشِقِّ الْأَنْفُسِ',
                'translation' => 'Dan ia (hewan ternak) mengangkut beban-bebanmu ke suatu negeri yang kamu tidak sanggup sampaikannya, melainkan dengan kesukaran yang memayahkan diri...',
                'tags' => 'lelah, perjalanan, nikmat Allah',
            ],
        ];

        $hadiths = [
            [
                'arabic_text' => 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ',
                'translation' => 'Tidaklah seorang muslim tertimpa suatu keletihan (nasab), penyakit, kecemasan, kesedihan, gangguan, maupun duka cita—bahkan duri yang menusuknya—melainkan Allah akan menghapus dosa-dosanya dengan sebab itu.',
                'book' => 'Bukhari, Muslim',
                'number' => '5641, 2573',
                'source' => 'HR. Bukhari no. 5641 & Muslim no. 2573',
            ],
            [
                'arabic_text' => 'إِنَّ لِرَبِّكَ عَلَيْكَ حَقًّا، وَلِنَفْسِكَ عَلَيْكَ حَقًّا، وَلأَهْلِكَ عَلَيْكَ حَقًّا، فَأَعْطِ كُلَّ ذِي حَقٍّ حَقَّهُ',
                'translation' => 'Sesungguhnya Rabbmu memiliki hak atasmu, dirimu (fisikmu) memiliki hak atasmu, dan keluargamu memiliki hak atasmu. Maka berikanlah setiap pemilik hak itu haknya (termasuk hak tubuh untuk beristirahat saat lelah).',
                'book' => 'Bukhari',
                'number' => '1968',
                'source' => 'HR. Bukhari no. 1968',
            ],
            [
                'arabic_text' => 'إِذَا نَعَسَ أَحَدُكُمْ وَهُوَ يُصَلِّي فَلْيَرْقُدْ حَتَّى يَذْهَبَ عَنْهُ النَّوْمُ',
                'translation' => 'Apabila salah seorang di antara kamu mengantuk (karena lelah) ketika salat, hendaklah ia tidur/istirahat terlebih dahulu hingga hilang mengantuknya.',
                'book' => 'Bukhari, Muslim',
                'number' => '212, 786',
                'source' => 'HR. Bukhari no. 212 & Muslim no. 786',
            ],
            [
                'arabic_text' => 'عَلَيْكُمْ مِنَ الأَعْمَالِ مَا تُطِيقُونَ، فَوَاللَّهِ لاَ يَمَلُّ اللَّهُ حَتَّى تَمَلُّوا',
                'translation' => 'Hendaklah kalian beramal sesuai dengan kemampuan kalian. Demi Allah, Allah tidak akan bosan (memberi pahala) sampai kalian sendiri yang bosan/lelah.',
                'book' => 'Bukhari, Muslim',
                'number' => '43, 785',
                'source' => 'HR. Bukhari no. 43 & Muslim no. 785',
            ],
            [
                'arabic_text' => 'أَحَبُّ الأَعْمَالِ إِلَى اللَّهِ أدْوَمُهَا وَإِنْ قَلَّ',
                'translation' => 'Amalan yang paling dicintai oleh Allah adalah amalan yang berkesinambungan (konsisten) meskipun sedikit.',
                'book' => 'Bukhari, Muslim',
                'number' => '6465, 783',
                'source' => 'HR. Bukhari no. 6465 & Muslim no. 783',
            ],
            [
                'arabic_text' => 'إِنَّ هَذَا الدِّينَ يُسْرٌ، وَلَنْ يُشَادَّ الدِّينَ أَحَدٌ إِلاَّ غَلَبَهُ، فَسَدِّدُوا وَقَارِبُوا',
                'translation' => 'Sesungguhnya agama ini mudah. Tidaklah seseorang memaksakan diri dalam agama melainkan ia akan kalah (lelah/lemah). Maka berlakulah lurus dan mendekatlah...',
                'book' => 'Bukhari',
                'number' => '39',
                'source' => 'HR. Bukhari no. 39',
            ],
            [
                'arabic_text' => 'إِنَّ اللهَ يُحِبُّ إِذَا عَمِلَ أَحَدُكُمْ عَمَلًا أَنْ يُتْقِنَهُ',
                'translation' => 'Sesungguhnya Allah menyukai jika salah seorang di antara kalian melakukan suatu pekerjaan, ia melakukannya dengan itqan (profesional/sungguh-sungguh).',
                'book' => 'Thabrani',
                'number' => '897',
                'source' => 'HR. Thabrani no. 897',
            ],
            [
                'arabic_text' => 'طَلَبُ الْكَسْبِ الْحَلَالِ فَرِيضَةٌ بَعْدَ الْفَرِيضَةِ',
                'translation' => 'Mencari rezeki yang halal adalah kewajiban setelah kewajiban (yang utama).',
                'book' => 'Thabrani, Baihaqi',
                'number' => null,
                'source' => 'HR. Thabrani & Baihaqi',
            ],
            [
                'arabic_text' => 'مَنْ أَمْسَى كَالًّا مِنْ عَمَلِ يَدَيْهِ أَمْسَى مَغْفُورًا لَهُ',
                'translation' => 'Barangsiapa pada sore hari merasa lelah karena bekerja dengan kedua tangannya (mencari rezeki halal), maka pada sore hari itu ia diampuni dosanya.',
                'book' => 'Thabrani',
                'number' => null,
                'source' => 'HR. Thabrani (Riwayat dhaif namun populer dalam keutamaan amal)',
            ],
            [
                'arabic_text' => 'الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللَّهِ مِنَ الْمُؤْمِنِ الضَّعِيفِ وَفِي كُلٍّ خَيْرٌ',
                'translation' => 'Mukmin yang kuat lebih baik dan lebih dicintai Allah daripada mukmin yang lemah, walau pada masing-masing ada kebaikan...',
                'book' => 'Muslim',
                'number' => '2664',
                'source' => 'HR. Muslim no. 2664',
            ],
            [
                'arabic_text' => 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ',
                'translation' => 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan janganlah merasa lemah/patah semangat.',
                'book' => 'Muslim',
                'number' => '2664',
                'source' => 'HR. Muslim no. 2664',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ',
                'translation' => 'Ya Allah, aku berlindung kepada-Mu dari kelemahan (keletihan yang melumpuhkan) dan kemalasan.',
                'book' => 'Bukhari',
                'number' => '6369',
                'source' => 'HR. Bukhari no. 6369',
            ],
            [
                'arabic_text' => 'أَلاَ أَدُلُّكُمَا عَلَى مَا هُوَ خَيْرٌ لَكُمَا مِنْ خَادِمٍ؟ إِذَا أَوَيْتُمَا إِلَى فِرَاشِكُمَا فَكَبِّرَا ثَلاَثًا وَثَلاَثِينَ وَسَبِّحَا ثَلاَثًا وَثَلاَثِينَ وَاحْمَدَا ثَلاَثًا وَثَلاَثِينَ',
                'translation' => 'Maukah kalian kuajari sesuatu yang lebih baik dari seorang pembantu? Jika kalian hendak tidur, bertakbirlah 33x, bertasbihlah 33x, dan bertahmidlah 33x. (Wasiat Nabi kepada Fatimah & Ali ketika lelah bekerja).',
                'book' => 'Bukhari, Muslim',
                'number' => '3113, 2727',
                'source' => 'HR. Bukhari no. 3113 & Muslim no. 2727',
            ],
            [
                'arabic_text' => 'إِنَّ لِكُلِّ عَمَلٍ شِرَّةً وَلِكُلِّ شِرَّةٍ فَتْرَةً',
                'translation' => 'Sesungguhnya setiap amalan memiliki masa semangat, dan setiap masa semangat memiliki masa futur (titik jenuh/lelah)...',
                'book' => 'Ahmad, Ibnu Hibban',
                'number' => '6725',
                'source' => 'HR. Ahmad no. 6725 & Ibn Hibban',
            ],
            [
                'arabic_text' => 'أَفْضَلُ الْجِهَادِ أَنْ يُجَاهِدَ الرَّجُلُ نَفْسَهُ وَهَوَاهُ',
                'translation' => 'Jihad yang paling utama adalah seseorang yang berjuang melawan dirinya sendiri dan hawa nafsunya.',
                'book' => 'Ibnu Najjar, Al-Albani',
                'number' => null,
                'source' => 'HR. Ibn Najjar & Al-Albani',
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

        foreach ($hadiths as $hadith) {
            $this->db->table('hadiths')->insert([
                'arabic_text' => $hadith['arabic_text'],
                'translation' => $hadith['translation'],
                'book'        => $hadith['book'],
                'number'      => $hadith['number'],
                'source'      => $hadith['source'],
                'status'      => 'approved',
                'created_at'  => $now,
                'updated_at'  => $now,
            ]);
        }

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (lelah).' . PHP_EOL;
    }
}
