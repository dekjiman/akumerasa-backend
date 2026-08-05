<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentKecewaSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [
            [
                'surah' => 94,
                'ayat_number' => 8,
                'arabic_text' => 'وَإِلَىٰ رَبِّكَ فَارْغَبْ',
                'translation' => 'Dan hanya kepada Tuhanmulah engkau berharap.',
                'tags' => 'kecewa, sandaran harapan, tawakal',
            ],
            [
                'surah' => 12,
                'ayat_number' => 84,
                'arabic_text' => 'وَتَوَلَّىٰ عَنْهُمْ وَقَالَ يَا أَسَفَىٰ عَلَىٰ يُوسُفَ وَابْيَضَّتْ عَيْنَاهُ مِنَ الْحُزْنِ فَهُوَ كَظِيمٌ',
                'translation' => 'Dan dia (Yakub) berpaling dari mereka seraya berkata: \'Aduhai duka citaku terhadap Yusuf,\' dan kedua matanya menjadi putih karena kesedihan dan dia menahan amarahnya.',
                'tags' => 'kecewa, kehilangan, Nabi Yakub, kesedihan',
            ],
            [
                'surah' => 12,
                'ayat_number' => 86,
                'arabic_text' => 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ وَأَعْلَمُ مِنَ اللَّهِ مَا لَا تَعْلَمُونَ',
                'translation' => 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku, dan aku mengetahui dari Allah apa yang tidak kamu ketahui.\'',
                'tags' => 'kecewa, pengaduan batin, harapan pada Allah',
            ],
            [
                'surah' => 12,
                'ayat_number' => 87,
                'arabic_text' => 'وَلَا تَيْأَسُوا مِنْ رَوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِنْ رَوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ',
                'translation' => '...dan jangan kamu berputus asa dari rahmat Allah. Sesungguhnya yang berputus asa dari rahmat Allah, hanyalah kaum yang kafir.',
                'tags' => 'kecewa, larangan putus asa, optimisme',
            ],
            [
                'surah' => 9,
                'ayat_number' => 129,
                'arabic_text' => 'فَإِنْ تَوَلَّوْا فَقُلْ حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ ۖ عَلَيْهِ تَوَكَّلْتُ ۖ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ',
                'translation' => 'Maka jika mereka berpaling (meninggalkanmu), katakanlah: \'Cukuplah Allah bagiku; tidak ada tuhan selain Dia. Hanya kepada-Nya aku bertawakal, dan Dia adalah Tuhan yang memiliki \'Arsy yang agung.\'',
                'tags' => 'kecewa, ditinggalkan, kecukupan Allah',
            ],
            [
                'surah' => 93,
                'ayat_number' => 3,
                'arabic_text' => 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ',
                'translation' => 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.',
                'tags' => 'kecewa, merasa ditinggalkan, kasih sayang Allah',
            ],
            [
                'surah' => 93,
                'ayat_number' => 5,
                'arabic_text' => 'وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ',
                'translation' => 'Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas (ridha).',
                'tags' => 'kecewa, penawar kecewa, kepuasan batin',
            ],
            [
                'surah' => 3,
                'ayat_number' => 153,
                'arabic_text' => 'لِكَيْ لَا تَحْزَنُوا عَلَىٰ مَا فَاتَكُمْ وَلَا مَا أَصَابَكُمْ',
                'translation' => '...agar kamu tidak bersedih hati (kecewa) terhadap apa yang luput dari kamu dan terhadap apa yang menimpa kamu...',
                'tags' => 'kecewa, kegagalan, takdir',
            ],
            [
                'surah' => 57,
                'ayat_number' => 23,
                'arabic_text' => 'لِكَيْ لَا تَأْسَوْا عَلَىٰ مَا فَاتَكُمْ وَلَا تَفْرَحُوا بِمَا آتَاكُمْ',
                'translation' => 'Agar kamu tidak bersedih hati (kecewa) terhadap apa yang luput dari kamu, dan jangan pula terlalu bergembira terhadap apa yang diberikan-Nya kepadamu...',
                'tags' => 'kecewa, lapang dada, qada dan qadar',
            ],
            [
                'surah' => 2,
                'ayat_number' => 216,
                'arabic_text' => 'وَعَسَىٰ أَنْ تَكْرَهُوا شَيْئًا وَهُوَ خَيْرٌ لَكُمْ ۖ وَعَسَىٰ أَنْ تُحِبُّوا شَيْئًا وَهُوَ شَرٌّ لَكُمْ ۗ وَاللَّهُ يَعْلَمُ وَأَنْتُمْ لَا تَعْلَمُونَ',
                'translation' => '...Boleh jadi kamu membenci sesuatu, padahal ia amat baik bagimu, dan boleh jadi (pula) kamu menyukai sesuatu, padahal ia amat buruk bagimu; Allah mengetahui, sedang kamu tidak mengetahui.',
                'tags' => 'kecewa, takdir, hikmah tersembunyi',
            ],
            [
                'surah' => 18,
                'ayat_number' => 6,
                'arabic_text' => 'فَلَعَلَّكَ بَاخِعٌ نَفْسَكَ عَلَىٰ آثَارِهِمْ إِنْ لَمْ يُؤْمِنُوا بِهَٰذَا الْحَدِيثِ أَسَفًا',
                'translation' => 'Maka boleh jadi engkau (Muhammad) akan membinasakan dirimu karena bersedih hati (kecewa) setelah mereka berpaling, sekiranya mereka tidak beriman kepada keterangan ini (Al-Qur\'an).',
                'tags' => 'kecewa, penolakan, beban mental',
            ],
            [
                'surah' => 26,
                'ayat_number' => 3,
                'arabic_text' => 'لَعَلَّكَ بَاخِعٌ نَفْسَكَ أَلَّا يَكُونُوا مُؤْمِنِينَ',
                'translation' => 'Boleh jadi engkau (Muhammad) akan membinasakan dirimu (karena kecewa) karena mereka tidak beriman.',
                'tags' => 'kecewa, empati Nabi, penolakan dakwah',
            ],
            [
                'surah' => 6,
                'ayat_number' => 33,
                'arabic_text' => 'قَدْ نَعْلَمُ إِنَّهُ لَيَحْزُنُكَ الَّذِي يَقُولُونَ ۖ فَإِنَّهُمْ لَا يُكَذِّبُونَكَ وَلَٰكِنَّ الظَّالِمِينَ بِآيَاتِ اللَّهِ يَجْحَدُونَ',
                'translation' => 'Sungguh, Kami mengetahui bahwa apa yang mereka katakan itu menyedihkan (mengecewakan) hatimu, (maka janganlah berduka cita) karena sebenarnya mereka bukan mendustakan engkau, melainkan orang-orang zalim itu mengingkari ayat-ayat Allah.',
                'tags' => 'kecewa, penghibur batin, penolakan',
            ],
            [
                'surah' => 15,
                'ayat_number' => 97,
                'arabic_text' => 'وَلَقَدْ نَعْلَمُ أَنَّكَ يَضِيقُ صَدْرُكَ بِمَا يَقُولُونَ',
                'translation' => 'Dan sungguh, Kami mengetahui bahwa dadamu menjadi sempit (merasa kecewa/tertekan) disebabkan apa yang mereka katakan.',
                'tags' => 'kecewa, penyempitan dada, kata-kata menyakitkan',
            ],
            [
                'surah' => 15,
                'ayat_number' => 98,
                'arabic_text' => 'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَكُنْ مِنَ السَّاجِدِينَ',
                'translation' => 'Maka bertasbihlah dengan memuji Tuhanmu dan jadilah engkau di antara orang-orang yang bersujud.',
                'tags' => 'kecewa, penawar kekecewaan, tasbih dan sujud',
            ],
            [
                'surah' => 28,
                'ayat_number' => 10,
                'arabic_text' => 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا',
                'translation' => 'Dan hati ibu Musa menjadi kosong (karena guncangan/kecewa mendalam). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya...',
                'tags' => 'kecewa, kehampaan batin, keteguhan hati',
            ],
            [
                'surah' => 20,
                'ayat_number' => 86,
                'arabic_text' => 'فَرَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا',
                'translation' => 'Kemudian Musa kembali kepada kaumnya dengan marah dan kecewa hati...',
                'tags' => 'kecewa, kekecewaan Musa, penyimpangan',
            ],
            [
                'surah' => 7,
                'ayat_number' => 150,
                'arabic_text' => 'وَلَمَّا رَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا قَالَ بِئْسَمَا خَلَفْتُمُونِي مِنْ بَعْدِي',
                'translation' => 'Dan ketika Musa telah kembali kepada kaumnya, dengan marah dan kecewa hati berkatalah dia: \'Alangkah buruknya perbuatan yang kamu kerjakan sesudah kepergianku!\'',
                'tags' => 'kecewa, kekecewaan pada manusia, Nabi Musa',
            ],
            [
                'surah' => 9,
                'ayat_number' => 92,
                'arabic_text' => 'تَوَلَّوْا وَأَعْيُنُهُمْ تَفِيضُ مِنَ الدَّمْعِ حَزَنًا أَلَّا يَجِدُوا مَا يُنْفِقُونَ',
                'translation' => '...mereka kembali, sedang mata mereka bercucuran air mata karena sedih/kecewa, lantaran mereka tidak memperoleh apa yang akan mereka infakkan (untuk ikut berjuang).',
                'tags' => 'kecewa, niat baik terhalang, air mata',
            ],
            [
                'surah' => 9,
                'ayat_number' => 25,
                'arabic_text' => 'وَيَوْمَ حُنَيْنٍ ۙ إِذْ أَعْجَبَتْكُمْ كَثْرَتُكُمْ فَلَمْ تُغْنِ عَنْكُمْ شَيْئًا وَضَاقَتْ عَلَيْكُمُ الْأَرْضُ بِمَا رَحُبَتْ ثُمَّ وَلَّيْتُمْ مُدْبِرِينَ',
                'translation' => '...dan (ingatlah) perang Hunain, yaitu ketika kamu menjadi congkak karena banyaknya jumlahmu, maka jumlah yang banyak itu tidak memberi manfaat kepadamu sedikit pun, dan bumi yang luas itu terasa sempit olehmu, kemudian kamu lari berpaling ke belakang.',
                'tags' => 'kecewa, ekspektasi salah, Perang Hunain',
            ],
            [
                'surah' => 22,
                'ayat_number' => 11,
                'arabic_text' => 'وَمِنَ النَّاسِ مَنْ يَعْبُدُ اللَّهَ عَلَىٰ حَرْفٍ ۖ فَإِنْ أَصَابَهُ خَيْرٌ اطْمَأَنَّ بِهِ ۖ وَإِنْ أَصَابَتْهُ فِتْنَةٌ انْقَلَبَ عَلَىٰ وَجْهِهِ خَسِرَ الدُّنْيَا وَالْآخِرَةَ',
                'translation' => 'Dan di antara manusia ada orang yang menyembah Allah dengan berada di tepi; maka jika ia memperoleh kebaikan, tetaplah ia dalam keadaan itu, dan jika ia ditimpa suatu bencana (kecewa), berbaliklah ia ke belakang. Rugilah ia di dunia dan di akhirat.',
                'tags' => 'kecewa, kemanjaan iman, ujian',
            ],
            [
                'surah' => 3,
                'ayat_number' => 139,
                'arabic_text' => 'وَلَا تَهِنُوا وَلَا تَحْزَنُوا وَأَنْتُمُ الْأَعْلَوْنَ إِنْ كُنْتُمْ مُؤْمِنِينَ',
                'translation' => 'Janganlah kamu (merasa) lemah, dan jangan (pula) bersedih hati (kecewa), padahal kamu pun orang-orang yang paling tinggi (derajatnya), jika kamu orang-orang yang beriman.',
                'tags' => 'kecewa, penguat mental, optimisme',
            ],
            [
                'surah' => 2,
                'ayat_number' => 214,
                'arabic_text' => 'مَسَّتْهُمُ الْبَأْسَاءُ وَالضَّرَّاءُ وَزُلْزِلُوا حَتَّىٰ يَقُولَ الرَّسُولُ وَالَّذِينَ آمَنُوا مَعَهُ مَتَىٰ نَصْرُ اللَّهِ ۗ أَلَا إِنَّ نَصْرَ اللَّهِ قَرِيبٌ',
                'translation' => '...Mereka ditimpa kemelaratan, penderitaan dan digoncangkan (hatinya) sehingga berkatalah Rasul dan orang-orang yang beriman bersamanya: \'Bilakah datangnya pertolongan Allah?\' Ingatlah, sesungguhnya pertolongan Allah itu amat dekat.',
                'tags' => 'kecewa, krisis batin, pertolongan dekat',
            ],
            [
                'surah' => 65,
                'ayat_number' => 3,
                'arabic_text' => 'وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
                'translation' => 'Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.',
                'tags' => 'kecewa, penyandaran batin, tawakal',
            ],
            [
                'surah' => 39,
                'ayat_number' => 36,
                'arabic_text' => 'أَلَيْسَ اللَّهُ بِكَافٍ عَبْدَهُ',
                'translation' => 'Bukankah Allah yang mencukupi hamba-Nya?',
                'tags' => 'kecewa, kecukupan, penenang',
            ],
            [
                'surah' => 3,
                'ayat_number' => 173,
                'arabic_text' => 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
                'translation' => 'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.',
                'tags' => 'kecewa, tawakal, benteng jiwa',
            ],
            [
                'surah' => 11,
                'ayat_number' => 77,
                'arabic_text' => 'وَلَمَّا جَاءَتْ رُسُلُنَا لُوطًا سِيءَ بِهِمْ وَضَاقَ بِهِمْ ذَرْعًا وَقَالَ هَٰذَا يَوْمٌ عَصِيبٌ',
                'translation' => 'Dan ketika utusan-utusan Kami (para malaikat) itu datang kepada Lut, dia merasa curiga dan merasa sempit dadanya (kecewa/terdesak) karena kedatangan mereka, dan dia berkata: \'Ini adalah hari yang amat sulit.\'',
                'tags' => 'kecewa, Nabi Lut, krisis terdesak',
            ],
            [
                'surah' => 21,
                'ayat_number' => 87,
                'arabic_text' => 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ',
                'translation' => 'Maka dia (Yunus) berdoa dalam kegelapan: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'',
                'tags' => 'kecewa, Nabi Yunus, krisis jiwa',
            ],
            [
                'surah' => 94,
                'ayat_number' => 5,
                'arabic_text' => 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا',
                'translation' => 'Maka sesungguhnya bersama kesulitan ada kemudahan.',
                'tags' => 'kecewa, kemudahan, harapan',
            ],
            [
                'surah' => 94,
                'ayat_number' => 6,
                'arabic_text' => 'إِنَّ مَعَ الْعُسْرِ يُسْرًا',
                'translation' => 'Sesungguhnya bersama kesulitan ada kemudahan.',
                'tags' => 'kecewa, janji pasti, kepastian',
            ],
            [
                'surah' => 65,
                'ayat_number' => 7,
                'arabic_text' => 'سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا',
                'translation' => 'Allah kelak akan memberikan kelapangan setelah kesempitan.',
                'tags' => 'kecewa, kelapangan, pergantian keadaan',
            ],
            [
                'surah' => 28,
                'ayat_number' => 24,
                'arabic_text' => 'رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ',
                'translation' => '(Musa berdoa): \'Ya Tuhanku, sesungguhnya aku sangat memerlukan sesuatu kebaikan yang Engkau turunkan kepadaku.\'',
                'tags' => 'kecewa, Nabi Musa, permohonan hamba',
            ],
            [
                'surah' => 26,
                'ayat_number' => 62,
                'arabic_text' => 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ',
                'translation' => 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'',
                'tags' => 'kecewa, keyakinan batin, pertolongan',
            ],
            [
                'surah' => 2,
                'ayat_number' => 155,
                'arabic_text' => 'وَلَنَبْلُوَنَّكُمْ بِشَيْءٍ مِنَ الْخَوْفِ وَالْجُوعِ وَنَقْصٍ مِنَ الْأَمْوَالِ وَالْأَنْفُسِ وَالثَّمَرَاتِ ۗ وَبَشِّرِ الصَّابِرِينَ',
                'translation' => 'Dan Kami pasti akan menguji kamu dengan sedikit ketakutan, kelaparan, kekurangan harta, jiwa, dan buah-buahan. Dan sampaikanlah kabar gembira kepada orang-orang yang sabar.',
                'tags' => 'kecewa, ujian kegagalan, sabar',
            ],
            [
                'surah' => 2,
                'ayat_number' => 156,
                'arabic_text' => 'الَّذِينَ إِذَا أَصَابَتْهُمْ مُصِيبَةٌ قَالُوا إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ',
                'translation' => '(yaitu) orang-orang yang apabila ditimpa musibah, mereka berkata: \'Inna lillahi wa inna ilaihi raji\'un\' (Sesungguhnya kami milik Allah dan kepada-Nyalah kami kembali).',
                'tags' => 'kecewa, istirja, keikhlasan',
            ],
        ];

        $hadiths = [
            [
                'arabic_text' => 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ',
                'translation' => 'Sungguh menakjubkan urusan seorang mukmin, seluruh urusannya adalah baik baginya. Jika ia mendapatkan kesenangan ia bersyukur, maka itu baik baginya. Dan jika ditimpa kesusahan (kekecewaan) ia bersabar, maka itu baik baginya.',
                'book' => 'Muslim',
                'number' => '2999',
                'source' => 'HR. Muslim no. 2999',
            ],
            [
                'arabic_text' => 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ',
                'translation' => 'Tidaklah seorang muslim tertimpa suatu keletihan, penyakit, kecemasan, kesedihan, gangguan, maupun duka cita/kekecewaan melainkan Allah akan menghapus dosa-dosanya dengan sebab itu.',
                'book' => 'Bukhari, Muslim',
                'number' => '5641, 2573',
                'source' => 'HR. Bukhari no. 5641 & Muslim no. 2573',
            ],
            [
                'arabic_text' => 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ، وَإِنْ أَصَابَكَ شَيْءٌ فَلاَ تَقُلْ لَوْ أَنِّي فَعَلْتُ كَانَ كَذَا وَكَذَا، وَلَكِنْ قُلْ قَدَرُ اللَّهِ وَمَا شَاءَ فَعَلَ',
                'translation' => 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan jangan lemah. Jika sesuatu menimpamu (membuatmu kecewa), jangan katakan \'Seandainya aku melakukan ini...\', melainkan katakanlah \'Ini takdir Allah, dan apa yang Dia kehendaki pasti terjadi\'.',
                'book' => 'Muslim',
                'number' => '2664',
                'source' => 'HR. Muslim no. 2664',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ',
                'translation' => 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas, sedih/kecewa, lemah, dan malas.',
                'book' => 'Bukhari',
                'number' => '6369',
                'source' => 'HR. Bukhari no. 6369',
            ],
            [
                'arabic_text' => 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا',
                'translation' => 'Tidaklah seseorang tertimpa duka cita dan kekecewaan lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan duka citanya dan menggantikannya dengan kelapangan.',
                'book' => 'Ahmad, Ibn Hibban',
                'number' => '3712',
                'source' => 'HR. Ahmad no. 3712 & Ibn Hibban',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ أْجُرْنِي فِي مُصِيبَتِي وَأَخْلِفْ لِي خَيْرًا مِنْهَا',
                'translation' => 'Ya Allah, berilah aku pahala dalam musibah/kekecewaanku ini dan gantikanlah bagiku dengan yang lebih baik daripadanya.',
                'book' => 'Muslim',
                'number' => '918',
                'source' => 'HR. Muslim no. 918',
            ],
            [
                'arabic_text' => 'إِنَّمَا الصَّبْرُ عِنْدَ الصَّدْمَةِ الأُولَى',
                'translation' => 'Sesungguhnya kesabaran (yang sebenarnya) adalah pada saat pertama kali tertimpa musibah/kekecewaan.',
                'book' => 'Bukhari, Muslim',
                'number' => '1283, 926',
                'source' => 'HR. Bukhari no. 1283 & Muslim no. 926',
            ],
            [
                'arabic_text' => 'وَاعْلَمْ أَنَّ مَا أَخْطَأَكَ لَمْ يَكُنْ لِيُصِيبَكَ، وَمَا أَصَابَكَ لَمْ يَكُنْ لِيُخْطِئَكَ',
                'translation' => 'Dan ketahuilah bahwa apa yang luput darimu (membuatmu kecewa) tidak akan menimpamu, dan apa yang menimpamu tidak akan luput darimu.',
                'book' => 'Tirmidzi',
                'number' => '2516',
                'source' => 'HR. Tirmidzi no. 2516',
            ],
            [
                'arabic_text' => 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا',
                'translation' => 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.',
                'book' => 'Ahmad',
                'number' => '2803',
                'source' => 'HR. Ahmad no. 2803',
            ],
            [
                'arabic_text' => 'مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُصِبْ مِنْهُ',
                'translation' => 'Barangsiapa yang dikehendaki kebaikan oleh Allah, maka Dia akan memberinya ujian/musibah (kekecewaan fana).',
                'book' => 'Bukhari',
                'number' => '5645',
                'source' => 'HR. Bukhari no. 5645',
            ],
            [
                'arabic_text' => 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ وَإِنَّ اللَّهَ إِذَا أَحَبَّ قَوْمًا ابْتَلاَهُمْ',
                'translation' => 'Sesungguhnya besarnya balasan disertai besarnya ujian. Dan sesungguhnya apabila Allah mencintai suatu kaum, Dia akan menguji mereka.',
                'book' => 'Tirmidzi',
                'number' => '2396',
                'source' => 'HR. Tirmidzi no. 2396',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ',
                'translation' => 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku.',
                'book' => 'Abu Dawud',
                'number' => '5090',
                'source' => 'HR. Abu Dawud no. 5090',
            ],
            [
                'arabic_text' => 'إِنَّ العَيْنَ تَدْمَعُ، وَالقَلْبَ يَحْزَنُ، وَلاَ نَقُولُ إِلَّا مَا يَرْضَى رَبُّنَا',
                'translation' => 'Mata boleh menangis dan hati boleh bersedih (kecewa), namun kami tidak mengucapkan kecuali apa yang diridhai oleh Rabb kami.',
                'book' => 'Bukhari',
                'number' => '1303',
                'source' => 'HR. Bukhari no. 1303',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ رَضِّنِي بِمَا قَضَيْتَ وَبَارِكْ لِي فِيمَا قُدِّرَ حَتَّى لاَ أُحِبَّ تعْجِيلَ مَا أَخَّرْتَ وَلاَ تَأْخِيرَ مَا عَجَّلْتَ',
                'translation' => 'Ya Allah, jadikanlah aku ridha dengan apa yang telah Engkau tetapkan dan berkahilah bagiku apa yang telah Engkau takdirkan, sehingga aku tidak ingin menyegerakan apa yang Engkau tangguhkan dan menangguhkan apa yang Engkau segerakan.',
                'book' => 'Ibn al-Suni, Al-Tabarani',
                'number' => '-',
                'source' => 'HR. Ibn al-Suni & Al-Tabarani',
            ],
            [
                'arabic_text' => 'ارْضَ بِمَا قَسَمَ اللَّهُ لَكَ تَكُنْ أَغْنَى النَّاسِ',
                'translation' => 'Ridhalah terhadap apa yang telah Allah bagikan untukmu, niscaya engkau akan menjadi orang yang paling kaya (paling tidak pernah kecewa).',
                'book' => 'Tirmidzi',
                'number' => '2305',
                'source' => 'HR. Tirmidzi no. 2305',
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (kecewa).' . PHP_EOL;
    }
}
