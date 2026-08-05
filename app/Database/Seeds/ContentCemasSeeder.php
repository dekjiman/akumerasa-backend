<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentCemasSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [
            [
                'surah' => 13,
                'ayat_number' => 28,
                'arabic_text' => 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                'translation' => '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.',
                'tags' => 'cemas, zikir, penenang hati',
            ],
            [
                'surah' => 48,
                'ayat_number' => 4,
                'arabic_text' => 'هُوَ الَّذِي أَنْزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا مَعَ إِيمَانِهِمْ',
                'translation' => 'Dialah yang telah menurunkan ketenangan ke dalam hati orang-orang mukmin untuk menambah iman atas iman mereka (yang telah ada).',
                'tags' => 'cemas, ketenangan, sakinah',
            ],
            [
                'surah' => 9,
                'ayat_number' => 40,
                'arabic_text' => 'إِلَّا تَنْصُرُوهُ فَقَدْ نَصَرَهُ اللَّهُ إِذْ أَخْرَجَهُ الَّذِينَ كَفَرُوا ثَانِيَ اثْنَيْنِ إِذْ هُمَا فِي الْغَارِ إِذْ يَقُولُ لِصَاحِبِهِ لَا تَحْزَنْ إِنَّ اللَّهَ مَعَنَا ۖ فَأَنْزَلَ اللَّهُ سَكِينَتَهُ عَلَيْهِ',
                'translation' => '...ketika dia berkata kepada sahabatnya, \'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.\' Maka Allah menurunkan ketenangan-Nya kepadanya...',
                'tags' => 'cemas, takut, kebersamaan Allah',
            ],
            [
                'surah' => 20,
                'ayat_number' => 45,
                'arabic_text' => 'قَالَا رَبَّنَا إِنَّنَا نَخَافُ أَنْ يَفْرُطَ عَلَيْنَا أَوْ أَنْ يَطْغَىٰ',
                'translation' => 'Keduanya berkata: \'Ya Tuhan kami, sungguh kami takut dia (Firaun) akan segera menyiksa kami atau bertindak melampaui batas.\'',
                'tags' => 'cemas, rasa takut, mengadu',
            ],
            [
                'surah' => 20,
                'ayat_number' => 46,
                'arabic_text' => 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ',
                'translation' => 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'',
                'tags' => 'cemas, rasa takut, perlindungan Allah',
            ],
            [
                'surah' => 20,
                'ayat_number' => 67,
                'arabic_text' => 'فَأَوْجَسَ فِي نَفْسِهِ خِيفَةً مُوسَىٰ',
                'translation' => 'Maka Musa merasa takut dalam hatinya.',
                'tags' => 'cemas, takut, manusiawi',
            ],
            [
                'surah' => 20,
                'ayat_number' => 68,
                'arabic_text' => 'قُلْنَا لَا تَخَفْ إِنَّكَ أَنْتَ الْأَعْلَىٰ',
                'translation' => 'Kami berfirman: \'Jangan takut! Sungguh, engkaulah yang unggul (menang).\'',
                'tags' => 'cemas, penguat hati, pertolongan',
            ],
            [
                'surah' => 28,
                'ayat_number' => 10,
                'arabic_text' => 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا لِتَكُونَ مِنَ الْمُؤْمِنِينَ',
                'translation' => 'Dan hati ibu Musa menjadi kosong (karena cemas). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya agar dia termasuk orang-orang yang beriman.',
                'tags' => 'cemas, kekhawatiran, keteguhan hati',
            ],
            [
                'surah' => 10,
                'ayat_number' => 62,
                'arabic_text' => 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ',
                'translation' => 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran/rasa takut terhadap mereka dan tidak (pula) mereka bersedih hati.',
                'tags' => 'cemas, wali Allah, kedamaian',
            ],
            [
                'surah' => 2,
                'ayat_number' => 38,
                'arabic_text' => 'فَمَنْ تَبِعَ هُدَايَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ',
                'translation' => '...Barangsiapa mengikuti petunjuk-Ku, tidak ada rasa takut (cemas) atas mereka, dan tidak (pula) mereka bersedih hati.',
                'tags' => 'cemas, petunjuk Allah, kedamaian',
            ],
            [
                'surah' => 70,
                'ayat_number' => 19,
                'arabic_text' => 'إِنَّ الْإِنْسَانَ خُلِقَ هَلُوعًا',
                'translation' => 'Sungguh, manusia diciptakan bersifat keluh kesah lagi kikir.',
                'tags' => 'cemas, gelisah, sifat manusia',
            ],
            [
                'surah' => 70,
                'ayat_number' => 20,
                'arabic_text' => 'إِذَا مَسَّهُ الشَّرُّ جَزُوعًا',
                'translation' => 'Apabila dia ditimpa kesusahan dia berselisih/gelisah (cemas).',
                'tags' => 'cemas, gelisah, kesusahan',
            ],
            [
                'surah' => 70,
                'ayat_number' => 22,
                'arabic_text' => 'إِلَّا الْمُصَلِّينَ',
                'translation' => 'kecuali orang-orang yang melaksanakan salat,',
                'tags' => 'cemas, penawar gelisah, salat',
            ],
            [
                'surah' => 21,
                'ayat_number' => 87,
                'arabic_text' => 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ',
                'translation' => 'Maka dia (Yunus) berdoa dalam kegelapan yang berlapis-lapis: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'',
                'tags' => 'cemas, doa kesesakan, Nabi Yunus',
            ],
            [
                'surah' => 21,
                'ayat_number' => 88,
                'arabic_text' => 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ',
                'translation' => 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita/kecemasan. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.',
                'tags' => 'cemas, penderitaan, pertolongan',
            ],
            [
                'surah' => 106,
                'ayat_number' => 4,
                'arabic_text' => 'الَّذِي أَطْعَمَهُمْ مِنْ جُوعٍ وَآمَنَهُمْ مِنْ خَوْفٍ',
                'translation' => 'Yang telah memberi makanan kepada mereka untuk menghilangkan lapar dan mengamankan mereka dari rasa takut (kecemasan).',
                'tags' => 'cemas, rasa aman, rezeki',
            ],
            [
                'surah' => 33,
                'ayat_number' => 10,
                'arabic_text' => 'إِذْ جَاءُوكُمْ مِنْ فَوْقِكُمْ وَمِنْ أَسْفَلَ مِنْكُمْ وَإِذْ زَاغَتِ الْأَبْصَارُ وَبَلَغَتِ الْقُلُوبُ الْحَنَاجِرَ',
                'translation' => 'Ketika mereka datang kepadamu dari atas dan dari bawahmu, dan ketika penglihatanmu terpana dan hatimu menyesak sampai ke tenggorokan (sangat cemas)...',
                'tags' => 'cemas, ujian berat, ketakutan hebat',
            ],
            [
                'surah' => 33,
                'ayat_number' => 11,
                'arabic_text' => 'هُنَالِكَ ابْتُلِيَ الْمُؤْمِنُونَ وَزُلْزِلُوا زِلْزَالًا شَدِيدًا',
                'translation' => 'Di situlah diuji orang-orang mukmin dan digoncangkan (hatinya) dengan goncangan yang dahsyat.',
                'tags' => 'cemas, ujian, kepanikan',
            ],
            [
                'surah' => 3,
                'ayat_number' => 173,
                'arabic_text' => 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
                'translation' => '(Yaitu) orang-orang (yang menaati Allah dan Rasul) yang ketika ada orang-orang mengatakan: \'Orang-orang telah mengumpulkan pasukan untuk menyerang kamu, karena itu takutlah kepada mereka,\' ternyata ucapan itu menambah iman mereka dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'',
                'tags' => 'cemas, tawakal, penentram jiwa',
            ],
            [
                'surah' => 3,
                'ayat_number' => 174,
                'arabic_text' => 'فَانْقَلَبُوا بِنِعْمَةٍ مِنَ اللَّهِ وَفَضْلٍ لَمْ يَمْسَسْهُمْ سُوءٌ',
                'translation' => 'Maka mereka kembali dengan nikmat dan karunia yang besar dari Allah, mereka tidak ditimpa suatu bencana pun...',
                'tags' => 'cemas, rasa aman, perlindungan',
            ],
            [
                'surah' => 41,
                'ayat_number' => 30,
                'arabic_text' => 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ الَّتِي كُنْتُمْ تُوعَدُونَ',
                'translation' => 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'',
                'tags' => 'cemas, ketenangan, malaikat',
            ],
            [
                'surah' => 2,
                'ayat_number' => 153,
                'arabic_text' => 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ',
                'translation' => 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.',
                'tags' => 'cemas, salat, solusi',
            ],
            [
                'surah' => 94,
                'ayat_number' => 5,
                'arabic_text' => 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا',
                'translation' => 'Maka sesungguhnya bersama kesulitan ada kemudahan.',
                'tags' => 'cemas, kemudahan, harapan',
            ],
            [
                'surah' => 94,
                'ayat_number' => 6,
                'arabic_text' => 'إِنَّ مَعَ الْعُسْرِ يُسْرًا',
                'translation' => 'Sesungguhnya bersama kesulitan ada kemudahan.',
                'tags' => 'cemas, kepastian, kelapangan',
            ],
            [
                'surah' => 65,
                'ayat_number' => 2,
                'arabic_text' => 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا',
                'translation' => '...Barangsiapa bertakwalah kepada Allah niscaya Dia akan membukakan jalan keluar baginya.',
                'tags' => 'cemas, jalan keluar, takwa',
            ],
            [
                'surah' => 65,
                'ayat_number' => 3,
                'arabic_text' => 'وَيَرْزُقْهُ مِنْ حَيْثُ لَا يَحْتَسِبُ ۚ وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
                'translation' => 'Dan Dia memberinya rezeki dari arah yang tidak disangka-sangkanya. Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.',
                'tags' => 'cemas, masa depan, tawakal',
            ],
            [
                'surah' => 93,
                'ayat_number' => 3,
                'arabic_text' => 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ',
                'translation' => 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.',
                'tags' => 'cemas, rasa terasing, penguatan',
            ],
            [
                'surah' => 93,
                'ayat_number' => 4,
                'arabic_text' => 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ',
                'translation' => 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.',
                'tags' => 'cemas, masa depan, optimisme',
            ],
            [
                'surah' => 2,
                'ayat_number' => 286,
                'arabic_text' => 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا',
                'translation' => 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.',
                'tags' => 'cemas, tekanan hidup, batas kemampuan',
            ],
            [
                'surah' => 16,
                'ayat_number' => 106,
                'arabic_text' => 'إِلَّا مَنْ أُكْرِهَ وَقَلْبُهُ مُطْمَئِنٌّ بِالْإِيمَانِ',
                'translation' => '...kecuali orang yang dipaksa melakukan kufr sedangkan hatinya tetap tenang dalam beriman...',
                'tags' => 'cemas, tekanan, ketenangan iman',
            ],
            [
                'surah' => 8,
                'ayat_number' => 11,
                'arabic_text' => 'إِذْ يُغَشِّيكُمُ النُّعَاسَ أَمَنَةً مِنْهُ وَيُنَزِّلُ عَلَيْكُمْ مِنَ السَّمَاءِ مَاءً لِيُطَهِّرَكُمْ بِهِ وَيُذْهِبَ عَنْكُمْ رِجْزَ الشَّيْطَانِ وَلِيَرْبِطَ عَلَىٰ قُلُوبِكُمْ وَيُثَبِّتَ بِهِ الْأَقْدَامَ',
                'translation' => '(Ingatlah) ketika Allah membuat kamu mengantuk untuk memberi ketenangan dari-Nya, dan menurunkan air dari langit kepadamu untuk menyucikan kamu... dan meneguhkan hatimu...',
                'tags' => 'cemas, ketenangan, perlindungan',
            ],
            [
                'surah' => 26,
                'ayat_number' => 61,
                'arabic_text' => 'فَلَمَّا تَرَاءَى الْجَمْعَانِ قَالَ أَصْحَابُ مُوسَىٰ إِنَّا لَمُدْرَكُونَ',
                'translation' => 'Maka ketika kedua golongan itu saling melihat, berkatalah pengikut-pengikut Musa: \'Kita benar-benar akan tersusul!\'',
                'tags' => 'cemas, kepanikan, kepungan',
            ],
            [
                'surah' => 26,
                'ayat_number' => 62,
                'arabic_text' => 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ',
                'translation' => 'Dia (Musa) menjawab: \'Sekali-kali tidak akan tersusul! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'',
                'tags' => 'cemas, keyakinan, pertolongan',
            ],
            [
                'surah' => 12,
                'ayat_number' => 67,
                'arabic_text' => 'وَقَالَ يَا بَنِيَّ لَا تَدْخُلُوا مِنْ بَابٍ وَاحِدٍ وَادْخُلُوا مِنْ أَبْوَابٍ مُتَفَرِّقَةٍ ۖ وَمَا أُغْنِي عَنْكُمْ مِنَ اللَّهِ مِنْ شَيْءٍ ۖ إِنِ الْحُكْمُ إِلَّا لِلَّهِ ۖ عَلَيْهِ تَوَكَّلْتُ',
                'translation' => 'Dan dia (Yakub) berkata: \'Wahai anak-anakku! Janganlah kamu masuk dari satu pintu gerbang, masuklah dari pintu-pintu gerbang yang berbeda-beda... Kepada-Nyalah aku bertawakal.\'',
                'tags' => 'cemas, ikhtiar, tawakal',
            ],
            [
                'surah' => 39,
                'ayat_number' => 36,
                'arabic_text' => 'أَلَيْسَ اللَّهُ بِكَافٍ عَبْدَهُ ۖ وَيُخَوِّفُونَكَ بِالَّذِينَ مِنْ دُونِهِ',
                'translation' => 'Bukankah Allah yang mencukupi hamba-Nya? Sedang mereka menakut-nakutimu dengan (penyembahan) selain Allah?',
                'tags' => 'cemas, kecukupan, perlindungan',
            ],
        ];

        $hadiths = [
            [
                'arabic_text' => 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ وَالْبُخْلِ وَالْجُبْنِ وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ',
                'translation' => 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas/gelisah, sedih, lemah, malas, kikir, penakut, beban utang, dan penguasaan orang lain.',
                'book' => 'Bukhari',
                'number' => '6369',
                'source' => 'HR. Bukhari no. 6369',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ اسْتُرْ عَوْرَاتِي وَآمِنْ رَوْعَاتِي',
                'translation' => 'Ya Allah, tutupilah auratku (kekuranganku) dan amankanlah aku dari rasa takut/kecemasan.',
                'book' => 'Abu Dawud, Ibnu Majah',
                'number' => '5074',
                'source' => 'HR. Abu Dawud no. 5074 & Ibn Majah',
            ],
            [
                'arabic_text' => 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ',
                'translation' => 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku. Tiada tuhan selain Engkau.',
                'book' => 'Abu Dawud',
                'number' => '5090',
                'source' => 'HR. Abu Dawud no. 5090',
            ],
            [
                'arabic_text' => 'اللهُ اللهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا',
                'translation' => 'Allah, Allah adalah Tuhanku, aku tidak mempersekutukan-Nya dengan sesuatu apa pun. (Dibaca saat dilanda kecemasan/kesusahan berat).',
                'book' => 'Abu Dawud',
                'number' => '1525',
                'source' => 'HR. Abu Dawud no. 1525',
            ],
            [
                'arabic_text' => 'لاَ إِلهَ إِلاَّ اللهُ الْعَظِيْمُ الْحَلِيْمُ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ الْعَرْشِ الْعَظِيْمِ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ السَّمَوَاتِ وَرَبُّ الأَرْضِ وَرَبُّ الْعَرْشِ الْكَرِيْمِ',
                'translation' => 'Tiada tuhan selain Allah Yang Maha Agung lagi Maha Penyantun... (Doa Rasulullah SAW saat berada dalam keraguan/kesusahan/kecemasan berat).',
                'book' => 'Bukhari, Muslim',
                'number' => '6345, 2730',
                'source' => 'HR. Bukhari no. 6345 & Muslim no. 2730',
            ],
            [
                'arabic_text' => 'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ',
                'translation' => 'Wahai Yang Mahahidup, Wahai Yang Maha Berdiri Sendiri, dengan rahmat-Mu aku memohon pertolongan.',
                'book' => 'Tirmidzi',
                'number' => '3524',
                'source' => 'HR. Tirmidzi no. 3524',
            ],
            [
                'arabic_text' => 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا',
                'translation' => 'Tidaklah seseorang tertimpa kegelisahan (kecemasan) dan kesedihan lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan kecemasannya dan menggantikannya dengan kelapangan.',
                'book' => 'Ahmad',
                'number' => '3712',
                'source' => 'HR. Ahmad no. 3712',
            ],
            [
                'arabic_text' => 'كَانَ النَّبِيُّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ إِذَا حَزَبَهُ أَمْرٌ صَلَّى',
                'translation' => 'Nabi SAW apabila ditimpa suatu masalah yang merisaukan/mencemaskan, beliau bergegas mendirikan salat.',
                'book' => 'Abu Dawud',
                'number' => '1319',
                'source' => 'HR. Abu Dawud no. 1319',
            ],
            [
                'arabic_text' => 'دَعْوَةُ ذِي النُّونِ إِذْ دَعَا وَهُوَ فِي بَطْنِ الحُوتِ... لَمْ يَدْعُ بِهَا رَجُلٌ مُسْلِمٌ فِي شَيْءٍ قَطُّ إِلاَّ اسْتَجَابَ اللَّهُ لَهُ',
                'translation' => 'Doa Dzun Nuun (Nabi Yunus) saat di perut ikan... Tidaklah seorang muslim berdoa dengannya dalam keadaan terdesak/cemas melainkan Allah pasti mengabulkannya.',
                'book' => 'Tirmidzi',
                'number' => '3505',
                'source' => 'HR. Tirmidzi no. 3505',
            ],
            [
                'arabic_text' => 'احْفَظِ اللَّهَ يَحْفَظْكَ، احْفَظِ اللَّهَ تَجِدْهُ تُجَاهَكَ، إِذَا سَأَلْتَ فَاسْأَلِ اللَّهَ، وَإِذَا اسْتَعَنْتَ فَاسْتَعِنْ بِاللَّهِ',
                'translation' => 'Jagalah Allah niscaya Dia akan menjagamu... Jika engkau memohon pertolongan, mohonlah kepada Allah.',
                'book' => 'Tirmidzi',
                'number' => '2516',
                'source' => 'HR. Tirmidzi no. 2516',
            ],
            [
                'arabic_text' => 'وَاعْلَمْ أَنَّ الأُمَّةَ لَوْ اجْتَمَعَتْ عَلَى أَنْ يَنْفَعُوكَ بِشَيْءٍ لَمْ يَنْفَعُوكَ إِلاَّ بِشَيْءٍ قَدْ كَتَبَهُ اللَّهُ لَكَ، وَلَوْ اجْتَمَعُوا عَلَى أَنْ يَضُرُّوكَ بِشَيْءٍ لَمْ يَضُرُّوكَ إِلاَّ بِشَيْءٍ قَدْ كَتَبَهُ اللَّهُ عَلَيْكَ',
                'translation' => 'Ketahuilah, sekiranya seluruh umat bersatu untuk memberimu manfaat, mereka tak dapat melakukannya kecuali apa yang telah ditetapkan Allah untukmu. Dan jika mereka bersatu untuk mencelakaimu, mereka tak dapat melakukannya kecuali apa yang telah ditetapkan Allah atasmu.',
                'book' => 'Tirmidzi',
                'number' => '2516',
                'source' => 'HR. Tirmidzi no. 2516',
            ],
            [
                'arabic_text' => 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ',
                'translation' => 'Sesungguhnya besarnya balasan (pahala) itu sebanding dengan besarnya ujian/penderitaan.',
                'book' => 'Tirmidzi',
                'number' => '2396',
                'source' => 'HR. Tirmidzi no. 2396',
            ],
            [
                'arabic_text' => 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ',
                'translation' => 'Tidaklah seorang muslim tertimpa keletihan, penyakit, kecemasan (hamm), kesedihan, gangguan, maupun duka cita melainkan Allah menghapus dosa-dosanya karenanya.',
                'book' => 'Bukhari',
                'number' => '5641',
                'source' => 'HR. Bukhari no. 5641',
            ],
            [
                'arabic_text' => 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ',
                'translation' => 'Sungguh menakjubkan urusan seorang mukmin... jika ditimpa kesusahan/ancaman dia bersabar, dan itu baik baginya.',
                'book' => 'Muslim',
                'number' => '2999',
                'source' => 'HR. Muslim no. 2999',
            ],
            [
                'arabic_text' => 'قُلْ آمَنْتُ بِاللَّهِ ثُمَّ اسْتَقِمْ',
                'translation' => 'Katakanlah: \'Aku beriman kepada Allah\', kemudian beristiqamahlah (teguhkan pendirianmu).',
                'book' => 'Muslim',
                'number' => '38',
                'source' => 'HR. Muslim no. 38',
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (cemas).' . PHP_EOL;
    }
}
