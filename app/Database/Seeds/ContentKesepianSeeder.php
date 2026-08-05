<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentKesepianSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [
            [
                'surah' => 9, 'ayat_number' => 40,
                'arabic_text' => 'لاَ تَحْزَنْ إِنَّ اللَّهَ مَعَنَا',
                'translation' => 'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.',
                'tags' => 'kesepian, pertolongan Allah, penenang hati',
            ],
            [
                'surah' => 50, 'ayat_number' => 16,
                'arabic_text' => 'وَنَحْنُ أَقْرَبُ إِلَيْهِ مِنْ حَبْلِ الْوَرِيدِ',
                'translation' => 'Dan Kami lebih dekat kepadanya daripada urat lehernya sendiri.',
                'tags' => 'kesepian, kedekatan Allah, penentram jiwa',
            ],
            [
                'surah' => 2, 'ayat_number' => 186,
                'arabic_text' => 'وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ ۖ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ',
                'translation' => 'Dan apabila hamba-hamba-Ku bertanya kepadamu tentang Aku, maka (jawablah), bahwasanya Aku adalah dekat. Aku mengabulkan permohonan orang yang berdoa apabila ia berdoa kepada-Ku...',
                'tags' => 'kesepian, kedekatan Allah, doa',
            ],
            [
                'surah' => 93, 'ayat_number' => 3,
                'arabic_text' => 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ',
                'translation' => 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.',
                'tags' => 'kesepian, merasa ditinggalkan, kasih sayang Allah',
            ],
            [
                'surah' => 21, 'ayat_number' => 89,
                'arabic_text' => 'وَزَكَرِيَّا إِذْ نَادَىٰ رَبَّهُ رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنْتَ خَيْرُ الْوَارِثِينَ',
                'translation' => 'Dan (ingatlah kisah) Zakaria, ketika dia berdoa kepada Tuhannya: \'Ya Tuhanku, janganlah Engkau biarkan aku hidup seorang diri (tanpa keturunan) dan Engkaulah Ahli Waris yang paling baik.\'',
                'tags' => 'kesepian, Nabi Zakaria, doa mohon teman',
            ],
            [
                'surah' => 12, 'ayat_number' => 86,
                'arabic_text' => 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ',
                'translation' => 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku...\'',
                'tags' => 'kesepian, mengadu kepada Allah, Nabi Yakub',
            ],
            [
                'surah' => 20, 'ayat_number' => 46,
                'arabic_text' => 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ',
                'translation' => 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'',
                'tags' => 'kesepian, kebersamaan Allah, penentram',
            ],
            [
                'surah' => 57, 'ayat_number' => 4,
                'arabic_text' => 'وَهُوَ مَعَكُمْ أَيْنَ مَا كُنْتُمْ ۚ وَاللَّهُ بِمَا تَعْمَلُونَ بَصِيرٌ',
                'translation' => 'Dan Dia bersama kamu di mana saja kamu berada. Dan Allah Maha Melihat apa yang kamu kerjakan.',
                'tags' => 'kesepian, kebersamaan Allah, pengawasan',
            ],
            [
                'surah' => 58, 'ayat_number' => 7,
                'arabic_text' => 'مَا يَكُونُ مِنْ نَجْوَىٰ ثَلَاثَةٍ إِلَّا هُوَ رَابِعُهُمْ وَلَا خَمْسَةٍ إِلَّا هُوَ سَادِسُهُمْ وَلَا أَدْنَىٰ مِنْ ذَٰلِكَ وَلَا أَكْثَرَ إِلَّا هُوَ مَعَهُمْ أَيْنَ مَا كَانُوا',
                'translation' => 'Tidak ada pembicaraan rahasia antara tiga orang, melainkan Dialah yang keempatnya. Dan tidak ada (pembicaraan antara) lima orang, melainkan Dialah yang keenamnya. Dan tidak ada yang kurang dari itu atau lebih banyak, melainkan Dia pasti ada bersama mereka di mana pun mereka berada...',
                'tags' => 'kesepian, tidak sendirian, hadirnya Allah',
            ],
            [
                'surah' => 13, 'ayat_number' => 28,
                'arabic_text' => 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                'translation' => '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.',
                'tags' => 'kesepian, zikir, ketenangan hati',
            ],
            [
                'surah' => 94, 'ayat_number' => 8,
                'arabic_text' => 'وَإِلَىٰ رَبِّكَ فَارْغَبْ',
                'translation' => 'Dan hanya kepada Tuhanmulah engkau berharap.',
                'tags' => 'kesepian, sandaran jiwa, harapan',
            ],
            [
                'surah' => 3, 'ayat_number' => 173,
                'arabic_text' => 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
                'translation' => 'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.',
                'tags' => 'kesepian, kecukupan, tawakal',
            ],
            [
                'surah' => 39, 'ayat_number' => 36,
                'arabic_text' => 'أَلَيْسَ اللَّهُ بِكَافٍ عَبْدَهُ',
                'translation' => 'Bukankah Allah yang mencukupi hamba-Nya?',
                'tags' => 'kesepian, kecukupan, penenang',
            ],
            [
                'surah' => 65, 'ayat_number' => 3,
                'arabic_text' => 'وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
                'translation' => 'Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.',
                'tags' => 'kesepian, tawakal, kecukupan',
            ],
            [
                'surah' => 9, 'ayat_number' => 129,
                'arabic_text' => 'فَإِنْ تَوَلَّوْا فَقُلْ حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ ۖ عَلَيْهِ تَوَكَّلْتُ ۖ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ',
                'translation' => 'Maka jika mereka berpaling (meninggalkanmu), katakanlah: \'Cukuplah Allah bagiku; tidak ada tuhan selain Dia. Hanya kepada-Nya aku bertawakal, dan Dia adalah Tuhan yang memiliki \'Arsy yang agung.\'',
                'tags' => 'kesepian, ditinggalkan, tawakal',
            ],
            [
                'surah' => 21, 'ayat_number' => 87,
                'arabic_text' => 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ',
                'translation' => 'Maka dia (Yunus) berdoa dalam kegelapan yang berlapis-lapis: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'',
                'tags' => 'kesepian, krisis jiwa, Nabi Yunus',
            ],
            [
                'surah' => 21, 'ayat_number' => 88,
                'arabic_text' => 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ',
                'translation' => 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita/kesesakan. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.',
                'tags' => 'kesepian, penyelamatan, penderitaan',
            ],
            [
                'surah' => 28, 'ayat_number' => 24,
                'arabic_text' => 'رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ',
                'translation' => '(Musa berdoa): \'Ya Tuhanku, sesungguhnya aku sangat memerlukan sesuatu kebaikan (kebutuhan) yang Engkau turunkan kepadaku.\'',
                'tags' => 'kesepian, Nabi Musa, pengaduan',
            ],
            [
                'surah' => 26, 'ayat_number' => 62,
                'arabic_text' => 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ',
                'translation' => 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'',
                'tags' => 'kesepian, keyakinan, pendampingan Allah',
            ],
            [
                'surah' => 28, 'ayat_number' => 10,
                'arabic_text' => 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا',
                'translation' => 'Dan hati ibu Musa menjadi hampa (merasa sangat kehilangan). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya...',
                'tags' => 'kesepian, kehampaan hati, peneguh jiwa',
            ],
            [
                'surah' => 8, 'ayat_number' => 63,
                'arabic_text' => 'وَأَلَّفَ بَيْنَ قُلُوبِهِمْ ۚ لَوْ أَنْفَقْتَ مَا فِي الْأَرْضِ جَمِيعًا مَا أَلَّفْتَ بَيْنَ قُلُوبِهِمْ وَلَٰكِنَّ اللَّهَ أَلَّفَ بَيْنَهُمْ',
                'translation' => 'Dan Dialah yang mempersatukan hati mereka (orang-orang yang beriman). Walaupun engkau menginfakkan semua yang ada di bumi, niscaya engkau tidak dapat mempersatukan hati mereka, tetapi Allah telah mempersatukan hati mereka...',
                'tags' => 'kesepian, kehangatan ukhuwah, pemersatu hati',
            ],
            [
                'surah' => 49, 'ayat_number' => 10,
                'arabic_text' => 'إِنَّمَا الْمُؤْمِنُونَ إِخْوَةٌ',
                'translation' => 'Orang-orang beriman itu sesungguhnya bersaudara...',
                'tags' => 'kesepian, persaudaraan, ukhuwah',
            ],
            [
                'surah' => 41, 'ayat_number' => 30,
                'arabic_text' => 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا',
                'translation' => 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'',
                'tags' => 'kesepian, malaikat, penenang',
            ],
            [
                'surah' => 10, 'ayat_number' => 62,
                'arabic_text' => 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ',
                'translation' => 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran/rasa takut terhadap mereka dan tidak (pula) mereka merasa sedih.',
                'tags' => 'kesepian, wali Allah, kedamaian',
            ],
            [
                'surah' => 6, 'ayat_number' => 33,
                'arabic_text' => 'قَدْ نَعْلَمُ إِنَّهُ لَيَحْزُنُكَ الَّذِي يَقُولُونَ',
                'translation' => 'Sungguh, Kami mengetahui bahwa apa yang mereka katakan itu menyedihkan (dan memojokkan) hatimu...',
                'tags' => 'kesepian, empati Allah, penguat Nabi',
            ],
            [
                'surah' => 15, 'ayat_number' => 97,
                'arabic_text' => 'وَلَقَدْ نَعْلَمُ أَنَّكَ يَضِيقُ صَدْرُكَ بِمَا يَقُولُونَ',
                'translation' => 'Dan sungguh, Kami mengetahui bahwa dadamu menjadi sempit (merasa tertekan/terasing) disebabkan apa yang mereka katakan.',
                'tags' => 'kesepian, penyempitan dada, pengakuan Allah',
            ],
            [
                'surah' => 15, 'ayat_number' => 98,
                'arabic_text' => 'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَكُنْ مِنَ السَّاجِدِينَ',
                'translation' => 'Maka bertasbihlah dengan memuji Tuhanmu dan jadilah engkau di antara orang-orang yang bersujud (salat).',
                'tags' => 'kesepian, solusi kesepian, tasbih dan sujud',
            ],
            [
                'surah' => 15, 'ayat_number' => 99,
                'arabic_text' => 'وَاعْبُدْ رَبَّكَ حَتَّىٰ يَأْتِيَكَ الْيَقِينُ',
                'translation' => 'Dan sembahlah Tuhanmu sampai datang kepadamu yang diyakini (ajal).',
                'tags' => 'kesepian, istiqamah, ibadah',
            ],
            [
                'surah' => 4, 'ayat_number' => 45,
                'arabic_text' => 'وَكَفَىٰ بِاللَّهِ وَلِيًّا وَكَفَىٰ بِاللَّهِ نَصِيرًا',
                'translation' => 'Dan cukuplah Allah menjadi Pelindung, dan cukuplah Allah menjadi Penolong (bagimu).',
                'tags' => 'kesepian, pelindung sejati, pertolongan',
            ],
            [
                'surah' => 11, 'ayat_number' => 113,
                'arabic_text' => 'وَمَا لَكُمْ مِنْ دُونِ اللَّهِ مِنْ أَوْلِيَاءَ ثُمَّ لَا تُنْصَرُونَ',
                'translation' => '...Dan kamu tidak mempunyai seorang pelindung pun selain Allah, kemudian kamu tidak akan diberi pertolongan.',
                'tags' => 'kesepian, pelindung sejati, penyerahan',
            ],
            [
                'surah' => 29, 'ayat_number' => 22,
                'arabic_text' => 'وَمَا لَكُمْ مِنْ دُونِ اللَّهِ مِنْ وَلِيٍّ وَلَا نَصِيرٍ',
                'translation' => '...Dan kamu tidak memperoleh seorang pelindung dan tidak (pula) seorang penolong selain Allah.',
                'tags' => 'kesepian, ketauhidan, penyandaran diri',
            ],
            [
                'surah' => 2, 'ayat_number' => 257,
                'arabic_text' => 'اللَّهُ وَلِيُّ الَّذِينَ آمَنُوا يُخْرِجُهُمْ مِنَ الظُّلُمَاتِ إِلَى النُّورِ',
                'translation' => 'Allah adalah Pelindung orang-orang yang beriman; Dia mengeluarkan mereka dari kegelapan (kegelisahan/kesepian) kepada cahaya (terang)...',
                'tags' => 'kesepian, kegelapan jiwa, pencerahan',
            ],
            [
                'surah' => 25, 'ayat_number' => 74,
                'arabic_text' => 'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ',
                'translation' => 'Ya Tuhan kami, anugerahkanlah kepada kami pasangan kami dan keturunan kami sebagai penyenang hati (penghilang sepi)...',
                'tags' => 'kesepian, doa pasangan, penyenang hati',
            ],
            [
                'surah' => 30, 'ayat_number' => 21,
                'arabic_text' => 'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُمْ مِنْ أَنْفُسِكُمْ أَزْوَاجًا لِتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُمْ مَوَدَّةً وَرَحْمَةً',
                'translation' => 'Dan di antara tanda-tanda kekuasaan-Nya ialah Dia menciptakan untukmu pasangan dari jenismu sendiri, supaya kamu cenderung dan merasa tenteram kepadanya, dan dijadikan-Nya di antaramu rasa kasih dan sayang...',
                'tags' => 'kesepian, ketenangan, kasih sayang',
            ],
            [
                'surah' => 4, 'ayat_number' => 1,
                'arabic_text' => 'يَا أَيُّهَا النَّاسُ اتَّقُوا رَبَّكُمُ الَّذِي خَلَقَكُمْ مِنْ نَفْسٍ وَاحِدَةٍ وَخَلَقَ مِنْهَا زَوْجَهَا',
                'translation' => 'Wahai manusia! Bertakwalah kepada Tuhanmu yang telah menciptakan kamu dari diri yang satu (Adam), dan darinya Allah menciptakan pasangannya...',
                'tags' => 'kesepian, penciptaan, ketiadaan kesendirian',
            ],
        ];

        $hadiths = [
            [
                'arabic_text' => 'بَدَأَ الإِسْلاَمُ غَرِيبًا وَسَيَعُودُ كَمَا بَدَأَ غَرِيبًا فَطُوبَى لِلْغُرَبَاءِ',
                'translation' => 'Islam bermula dalam keadaan asing (terasing/sendiri), dan akan kembali asing sebagaimana mulanya. Maka beruntunglah orang-orang yang terasing (al-ghuraba\').',
                'book' => 'Muslim',
                'number' => '145',
                'source' => 'HR. Muslim no. 145',
            ],
            [
                'arabic_text' => 'أَنَا عِنْدَ ظَنِّ عَبْدِي بِي وَأَنَا مَعَهُ إِذَا ذَكَرَنِي',
                'translation' => 'Aku sesuai dengan persangkaan hamba-Ku kepada-Ku, dan Aku bersamanya apabila ia mengingat-Ku.',
                'book' => 'Bukhari, Muslim',
                'number' => '7405, 2675',
                'source' => 'HR. Bukhari no. 7405 & Muslim no. 2675',
            ],
            [
                'arabic_text' => 'فَإِنْ ذَكَرَنِي فِي نَفْسِهِ ذَكَرْتُهُ فِي نَفْسِي وَإِنْ ذَكَرَنِي فِي مَلإٍ ذَكَرْتُهُ فِي مَلإٍ خَيْرٍ مِنْهُمْ',
                'translation' => 'Jika ia mengingat-Ku dalam hatinya (saat sendiri), Aku pun mengingatnya dalam diri-Ku. Dan jika ia mengingat-Ku dalam perkumpulan, Aku mengingatnya dalam perkumpulan yang lebih baik dari mereka.',
                'book' => 'Bukhari',
                'number' => '7405',
                'source' => 'HR. Bukhari no. 7405',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ آنِسْ وَحْشَتِي فِي قَبْرِي',
                'translation' => 'Ya Allah, berilah rasa hangat/hiburan pada kesepianku di dalam kuburku.',
                'book' => 'Al-Dainuri',
                'number' => null,
                'source' => 'HR. Al-Dainuri & Doa yang masyhur di kalangan ulama',
            ],
            [
                'arabic_text' => 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ غَضَبِهِ وَعِقَابِهِ وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَنْ يَحْضُرُونِ',
                'translation' => 'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari murka-Nya, siksa-Nya, kejahatan hamba-hamba-Nya, dan dari bisikan setan. (Doa yang diajarkan Rasulullah saat merasa cemas/kesepian di malam hari).',
                'book' => 'Tirmidzi, Abu Dawud',
                'number' => '3528',
                'source' => 'HR. Tirmidzi no. 3528 & Abu Dawud',
            ],
            [
                'arabic_text' => 'المُؤْمِنُ لِلْمُؤْمِنِ كَالْبُنْيَانِ يَشُدُّ بَعْضُهُ بَعْضًا',
                'translation' => 'Seorang mukmin bagi mukmin lainnya adalah bagaikan satu bangunan yang saling menguatkan satu sama lain.',
                'book' => 'Bukhari, Muslim',
                'number' => '481, 2585',
                'source' => 'HR. Bukhari no. 481 & Muslim no. 2585',
            ],
            [
                'arabic_text' => 'مَثَلُ الْمُؤْمِنِينَ فِي تَوَادِّهِمْ وَتَرَاحُمِهِمْ وَتَعَاطُفِهِمْ مَثَلُ الْجَسَدِ إِذَا اشْتَكَى مِنْهُ عُضْوٌ تَدَاعَى لَهُ سَائِرُ الْجَسَدِ بِالسَّهَرِ وَالْحُمَّى',
                'translation' => 'Perumpamaan orang-orang mukmin dalam hal saling mencintai, mengasihi, dan menyayangi adalah bagaikan satu tubuh. Apabila ada salah satu anggota tubuh yang sakit, maka seluruh tubuh ikut merasa tidak bisa tidur dan demam.',
                'book' => 'Muslim',
                'number' => '2586',
                'source' => 'HR. Muslim no. 2586',
            ],
            [
                'arabic_text' => 'الرَّجُلُ عَلَى دِينِ خَلِيلِهِ فَلْيَنْظُرْ أَحَدُكُمْ مَنْ يُخَالِلُ',
                'translation' => 'Seseorang itu tergantung pada agama teman dekatnya. Maka hendaklah salah seorang di antara kalian memperhatikan siapa yang dijadikan teman dekatnya.',
                'book' => 'Abu Dawud, Tirmidzi',
                'number' => '4833',
                'source' => 'HR. Abu Dawud no. 4833 & Tirmidzi',
            ],
            [
                'arabic_text' => 'إِنَّمَا جُلَسَاءُ الْخَيْرِ وَجُلَسَاءُ السُّوءِ كَحَامِلِ الْمِسْكِ وَنَافِخِ الْكِيرِ',
                'translation' => 'Permisalan teman yang baik dan teman yang buruk adalah seperti penjual minyak wangi dan pentiup cerobong tukang besi...',
                'book' => 'Bukhari',
                'number' => '5534',
                'source' => 'HR. Bukhari no. 5534',
            ],
            [
                'arabic_text' => 'لاَ تَصَاحِبْ إِلاَّ مُؤْمِنًا وَلاَ يَأْكُلْ طَعَامَكَ إِلاَّ تَقِيٌّ',
                'translation' => 'Janganlah engkau berteman dekat melainkan dengan orang mukmin, dan janganlah memakan makananmu melainkan orang yang bertakwa.',
                'book' => 'Abu Dawud',
                'number' => '4832',
                'source' => 'HR. Abu Dawud no. 4832',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ',
                'translation' => 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri (sendirian tanpa perlindungan-Mu) walau sekejap mata pun...',
                'book' => 'Abu Dawud',
                'number' => '5090',
                'source' => 'HR. Abu Dawud no. 5090',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ',
                'translation' => 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas dan kesedihan (termasuk duka akibat rasa sepi).',
                'book' => 'Bukhari',
                'number' => '6369',
                'source' => 'HR. Bukhari no. 6369',
            ],
            [
                'arabic_text' => 'إِنَّ اللَّهَ حَيِيٌّ كَرِيمٌ يَسْتَحْيِي إِذَا رَفَعَ الرَّجُلُ إِلَيْهِ يَدَيْهِ أَنْ يَرُدَّهُمَا صِفْرًا خَائِبَتَيْنِ',
                'translation' => 'Sesungguhnya Allah Maha Pemalu lagi Mahamulia. Dia malu jika seorang hamba mengangkat kedua tangannya kepada-Nya, lalu Dia mengembalikannya dalam keadaan kosong/hampa.',
                'book' => 'Tirmidzi',
                'number' => '3556',
                'source' => 'HR. Tirmidzi no. 3556',
            ],
            [
                'arabic_text' => 'مَا مِنْ مُسْلِمٍ يَدْعُو بِدَعْوَةٍ لَيْسَ فِيهَا إِثْمٌ وَلاَ قَطِيعَةُ رَحِمٍ إِلاَّ أَعْطَاهُ اللَّهُ بِهَا إِحْدَى ثَلاَثٍ',
                'translation' => 'Tidak ada seorang muslim pun yang berdoa dengan suatu doa yang tidak mengandung dosa dan tidak memutuskan silaturahmi, melainkan Allah pasti memberinya salah satu dari tiga hal (dikabulkan langsung, disimpan untuk akhirat, atau dijauhkan dari keburukan)...',
                'book' => 'Ahmad',
                'number' => '11133',
                'source' => 'HR. Ahmad no. 11133',
            ],
            [
                'arabic_text' => 'صَلاَةُ الْجَمَاعَةِ تَفْضُلُ صَلاَةَ الْفَذِّ بِسَبْعٍ وَعِشْرِينَ دَرَجَةً',
                'translation' => 'Salat berjamaah itu lebih utama daripada salat sendirian sebanyak 27 derajat.',
                'book' => 'Bukhari, Muslim',
                'number' => '645, 650',
                'source' => 'HR. Bukhari no. 645 & Muslim no. 650',
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (kesepian).' . PHP_EOL;
    }
}
