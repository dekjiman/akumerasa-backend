<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentIriSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [

            ['surah' => 113, 'ayat_number' => 5, 'arabic_text' => 'وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ', 'translation' => 'dan dari kejahatan orang yang dengki apabila dia dengki.', 'tags' => 'iri, hasad, perlindungan, Al-Falaq'],
            ['surah' => 4, 'ayat_number' => 32, 'arabic_text' => 'وَلَا تَتَمَنَّوْا مَا فَضَّلَ اللَّهُ بِهِ بَعْضَكُمْ عَلَىٰ بَعْضٍ', 'translation' => 'Dan janganlah kamu iri hati terhadap apa yang dikaruniakan Allah kepada sebagian kamu lebih banyak dari sebagian yang lain...', 'tags' => 'iri, larangan iri hati, karunia Allah'],
            ['surah' => 4, 'ayat_number' => 54, 'arabic_text' => 'أَمْ يَحْسُدُونَ النَّاسَ عَلَىٰ مَا آتَاهُمُ اللَّهُ مِنْ فَضْلِهِ', 'translation' => 'Ataukah mereka dengki kepada manusia (Muhammad) lantaran karunia yang Allah telah berikan kepadanya?', 'tags' => 'iri, dengki, karunia, celaan hasad'],
            ['surah' => 2, 'ayat_number' => 109, 'arabic_text' => 'وَدَّ كَثِيرٌ مِنْ أَهْلِ الْكِتَابِ لَوْ يَرُدُّونَكُمْ مِنْ بَعْدِ إِيمَانِكُمْ كُفَّارًا حَسَدًا مِنْ عِنْدِ أَنْفُسِهِمْ', 'translation' => 'Sebagian besar Ahli Kitab menginginkan agar mereka dapat mengembalikan kamu kepada kekafiran setelah kamu beriman, karena rasa dengki yang (timbul) dari diri mereka sendiri...', 'tags' => 'dengki, hasad, bahaya dengki'],
            ['surah' => 12, 'ayat_number' => 8, 'arabic_text' => 'إِذْ قَالُوا لَيُوسُفُ وَأَخُوهُ أَحَبُّ إِلَىٰ أَبِينَا مِنَّا وَنَحْنُ عُصْبَةٌ إِنَّ أَبَانَا لَفِي ضَلَالٍ مُبِينٍ', 'translation' => '(Yaitu) ketika mereka berkata: \'Sesungguhnya Yusuf dan saudaranya (Bunyamin) lebih dicintai oleh ayah kita daripada kita sendiri, padahal kita adalah satu golongan (yang kuat)...\'', 'tags' => 'iri, kecemburuan, Nabi Yusuf, hubungan keluarga'],
            ['surah' => 12, 'ayat_number' => 9, 'arabic_text' => 'اقْتُلُوا يُوسُفَ أَوِ اطْرَحُوهُ أَرْضًا يَخْلُ لَكُمْ وَجْهُ أَبِيكُمْ', 'translation' => '\'Bunuhlah Yusuf atau buanglah dia ke suatu tempat (yang asing) supaya perhatian ayahmu tertumpah kepadamu saja...\'', 'tags' => 'dampak iri, kejahatan akibat hasad, Nabi Yusuf'],
            ['surah' => 12, 'ayat_number' => 5, 'arabic_text' => 'قَالَ يَا بُنَيَّ لَا تَقْصُصْ رُؤْيَاكَ عَلَىٰ إِخْوَتِكَ فَيَكِيدُوا لَكَ كَيْدًا', 'translation' => 'Dia (ayahnya) berkata: \'Wahai anakku, janganlah engkau ceritakan mimpimu itu kepada saudara-saudaramu, maka mereka akan membuat tipu daya (untuk membinasakan)mu...\'', 'tags' => 'mencegah iri, kewaspadaan, tipu daya hasad'],
            ['surah' => 5, 'ayat_number' => 27, 'arabic_text' => 'وَاتْلُ عَلَيْهِمْ نَبَأَ ابْنَيْ آدَمَ بِالْحَقِّ إِذْ قَرَّبَا قُرْبَانًا فَتُقُبِّلَ مِنْ أَحَدِهِمَا وَلَمْ يُتَقَبَّلْ مِنَ الْآخَرِ قَالَ لَأَقْتُلَنَّكَ', 'translation' => 'Ceritakanlah kepada mereka kisah kedua putra Adam (Habil dan Qabil) menurut yang sebenarnya, ketika keduanya mempersembahkan korban, maka diterima dari salah seorang dari mereka dan tidak diterima dari yang lain. Ia berkata (Qabil): \'Aku pasti membunuhmu!\'', 'tags' => 'iri, pembunuhan pertama, Habil dan Qabil'],
            ['surah' => 5, 'ayat_number' => 30, 'arabic_text' => 'فَطَوَّعَتْ لَهُ نَفْسُهُ قَتْلَ أَخِيهِ فَقَتَلَهُ فَأَصْبَحَ مِنَ الْخَاسِرِينَ', 'translation' => 'Maka hawa nafsu Qabil mendorongnya untuk membunuh saudaranya, sebab itu dibunuhnyalah, maka jadilah dia seorang di antara orang-orang yang rugi.', 'tags' => 'dampak iri, penyesalan, dorongan nafsu'],
            ['surah' => 7, 'ayat_number' => 12, 'arabic_text' => 'قَالَ مَا مَنَعَكَ أَلَّا تَسْجُدَ إِذْ أَمَرْتُكَ ۖ قَالَ أَنَا خَيْرٌ مِنْهُ خَلَقْتَنِي مِنْ نَارٍ وَخَلَقْتَهُ مِنْ طِينٍ', 'translation' => 'Allah berfirman: \'Apakah yang menghalangimu untuk bersujud (kepada Adam) ketika Aku menyuruhmu?\' Iblis menjawab: \'Saya lebih baik daripadanya: Engkau ciptakan saya dari api sedang dia Engkau ciptakan dari tanah.\'', 'tags' => 'iri pertama, kesombongan Iblis, asal usul hasad'],
            ['surah' => 15, 'ayat_number' => 47, 'arabic_text' => 'وَنَزَعْنَا مَا فِي صُدُورِهِمْ مِنْ غِلٍّ إِخْوَانًا عَلَىٰ سُرُرٍ مُتَقَابِلِينَ', 'translation' => 'Dan Kami lenyapkan segala rasa dendam/dengki yang berada dalam dada mereka, mereka merasa bersaudara duduk berhadap-hadapan di atas dipan-dipan.', 'tags' => 'suci dari dengki, surga, kebersihan hati'],
            ['surah' => 59, 'ayat_number' => 10, 'arabic_text' => 'وَلَا تَجْعَلْ فِي قُلُوبِنَا غِلًّا لِلَّذِينَ آمَنُوا رَبَّنَا إِنَّكَ رَءُوفٌ رَحِيمٌ', 'translation' => '...dan janganlah Engkau jadikan dengan rasa dengki/dendam dalam hati kami terhadap orang-orang yang beriman. Ya Tuhan kami, sungguh Engkau Maha Penyantun lagi Maha Penyayang.', 'tags' => 'doa pembersih iri, kedamaian hati, ukhuwah'],
            ['surah' => 3, 'ayat_number' => 120, 'arabic_text' => 'إِنْ تَمْسَسْكُمْ حَسَنَةٌ تَسُؤْهُمْ وَإِنْ تُصِبْكُمْ سَيِّئَةٌ يَفْرَحُوا بِهَا', 'translation' => 'Jika kamu memperoleh kebaikan, niscaya mereka bersedih hati, tetapi jika kamu mendapat bencana, mereka bergembira karenanya...', 'tags' => 'sifat iri, kebencian, ciri pendengki'],
            ['surah' => 9, 'ayat_number' => 50, 'arabic_text' => 'إِنْ تُصِبْكَ حَسَنَةٌ تَسُؤْهُمْ ۖ وَإِنْ تُصِبْكَ مُصِيبَةٌ يَقُولُوا قَدْ أَخَذْنَا أَمْرَنَا مِنْ قَبْلُ', 'translation' => 'Jika kamu mendapat kebaikan, mereka tidak senang; dan jika kamu ditimpa bencana, mereka berkata: \'Sesungguhnya kami telah bersiap siaga sebelum itu\'...', 'tags' => 'sifat iri, kemunafikan, kedengkian'],
            ['surah' => 28, 'ayat_number' => 79, 'arabic_text' => 'فَخَرَجَ عَلَىٰ قَوْمِهِ فِي زِينَتِهِ ۖ قَالَ الَّذِينَ يُرِيدُونَ الْحَيَاةَ الدُّنْيَا يَا لَيْتَ لَنَا مِثْلَ مَا أُوتِيَ قَارُونُ', 'translation' => 'Maka keluarlah Karun kepada kaumnya dalam kemewahannya. Berkatalah orang-orang yang menghendaki kehidupan dunia: \'Moga-moga kita mempunyai seperti apa yang telah diberikan kepada Karun...\'', 'tags' => 'iri kemewahan, Karun, cinta dunia'],

            ['surah' => 28, 'ayat_number' => 80, 'arabic_text' => 'وَقَالَ الَّذِينَ أُوتُوا الْعِلْمَ وَيْلَكُمْ ثَوَابُ اللَّهِ خَيْرٌ لِمَنْ آمَنَ وَعَمِلَ صَالِحًا', 'translation' => 'Berkatalah orang-orang yang dianugerahi ilmu: \'Kecelakaan besarlah bagimu, pahala Allah adalah lebih baik bagi orang-orang yang beriman dan beramal saleh...\'', 'tags' => 'penawar iri, ilmu, nilai akhirat'],
            ['surah' => 18, 'ayat_number' => 39, 'arabic_text' => 'وَلَوْلَا إِذْ دَخَلْتَ جَنَّتَكَ قُلْتَ مَا شَاءَ اللَّهُ لَا قُوَّةَ إِلَّا بِاللَّهِ', 'translation' => 'Dan mengapa kamu tidak mengucapkan ketika kamu memasuki kebunmu \'Maasya-Allah, laa quwwata illa billah\' (Sungguh atas kehendak Allah semua ini terwujud, tidak ada kekuatan kecuali dengan pertolongan Allah)...', 'tags' => 'mencegah ain, penawar iri, mengagungkan Allah'],
            ['surah' => 15, 'ayat_number' => 88, 'arabic_text' => 'وَلَا تَمُدَّنَّ عَيْنَيْكَ إِلَىٰ مَا مَتَّعْنَا بِهِ أَزْوَاجًا مِنْهُمْ', 'translation' => 'Jangan sekali-kali engkau menujukan pandanganmu (dengan iri) kepada kenikmatan yang telah Kami berikan kepada beberapa golongan di antara mereka...', 'tags' => 'iri, membatasi pandangan, qana\'ah'],
            ['surah' => 20, 'ayat_number' => 131, 'arabic_text' => 'وَلَا تَمُدَّنَّ عَيْنَيْكَ إِلَىٰ مَا مَتَّعْنَا بِهِ أَزْوَاجًا مِنْهُمْ زَهْرَةَ الْحَيَاةِ الدُّنْيَا لِنَفْتِنَهُمْ فِيهِ', 'translation' => 'Dan janganlah kamu tujukan kedua matamu kepada apa yang telah Kami berikan kepada golongan-golongan dari mereka, sebagai bunga kehidupan dunia untuk Kami uji mereka dengannya...', 'tags' => 'iri, kenikmatan fana, ujian harta'],
            ['surah' => 3, 'ayat_number' => 54, 'arabic_text' => 'وَمَكَرُوا وَمَكَرَ اللَّهُ ۖ وَاللَّهُ خَيْرُ الْمَاكِرِينَ', 'translation' => 'Orang-orang kafir itu membuat tipu daya (karena dengki), dan Allah membalas tipu daya mereka itu. Dan Allah sebaik-baik pembalas tipu daya.', 'tags' => 'makar dengki, perlindungan Allah'],
            ['surah' => 113, 'ayat_number' => 1, 'arabic_text' => 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ', 'translation' => 'Katakanlah: \'Aku berlindung kepada Tuhan Yang Menguasai subuh,\'', 'tags' => 'perlindungan dari dengki, Al-Falaq'],
            ['surah' => 113, 'ayat_number' => 2, 'arabic_text' => 'مِنْ شَرِّ مَا خَلَقَ', 'translation' => 'dari kejahatan makhluk-Nya,', 'tags' => 'perlindungan, kejahatan makhluk'],
            ['surah' => 26, 'ayat_number' => 88, 'arabic_text' => 'يَوْمَ لَا يَنْفَعُ مَالٌ وَلَا بَنُونَ', 'translation' => '(yaitu) di hari di mana harta dan anak-anak laki-laki tidak berguna,', 'tags' => 'bebas iri, kesucian batin, hari kiamat'],
            ['surah' => 26, 'ayat_number' => 89, 'arabic_text' => 'إِلَّا مَنْ أَتَى اللَّهَ بِقَلْبٍ سَلِيمٍ', 'translation' => 'kecuali orang-orang yang menghadap Allah dengan hati yang bersih.', 'tags' => 'hati bersih, bebas hasad, qalbun salim'],
            ['surah' => 68, 'ayat_number' => 51, 'arabic_text' => 'وَإِنْ يَكَادُ الَّذِينَ كَفَرُوا لَيُزْلِقُونَكَ بِأَبْصَارِهِمْ لَمَّا سَمِعُوا الذِّكْرَ', 'translation' => 'Dan sesungguhnya orang-orang kafir itu benar-benar hampir menggelincirkanmu dengan pandangan mata mereka (karena dengki) ketika mereka mendengar Al-Qur\'an...', 'tags' => 'penyakit ain, pandangan dengki, Al-Qalam'],
        ];

        $hadiths = [
            ['arabic_text' => 'إِيَّاكُمْ وَالْحَسَدَ، فَإِنَّ الْحَسَدَ يَأْكُلُ الْحَسَنَاتِ كَمَا تَأْكُلُ النَّارُ الْحَطَبَ', 'translation' => 'Jauhilah oleh kalian sifat hasad (dengki), karena sesungguhnya hasad itu memakan kebaikan-kebaikan sebagaimana api memakan kayu bakar.', 'book' => 'Abu Dawud', 'number' => '4903', 'source' => 'HR. Abu Dawud no. 4903'],
            ['arabic_text' => 'لاَ تَبَاغَضُوا، وَلاَ تَحَاسَدُوا، وَلاَ تَدَابَرُوا، وَكُونُوا عِبَادَ اللَّهِ إِخْوَانًا', 'translation' => 'Janganlah kalian saling membenci, janganlah saling dengki, dan janganlah saling membelakangi. Jadilah kalian hamba-hamba Allah yang bersaudara.', 'book' => 'Bukhari, Muslim', 'number' => '6065, 2559', 'source' => 'HR. Bukhari no. 6065 & Muslim no. 2559'],
            ['arabic_text' => 'لاَ تَحَاسَدُوا، وَلاَ تَنَاجَشُوا، وَلاَ تَبَاغَضُوا، وَلاَ تَدَابَرُوا', 'translation' => 'Janganlah kalian saling dengki, jangan saling menaikkan penawaran (untuk menipu), jangan saling membenci, dan jangan saling membelakangi...', 'book' => 'Muslim', 'number' => '2564', 'source' => 'HR. Muslim no. 2564'],
            ['arabic_text' => 'لاَ حَسَدَ إِلاَّ فِي اثْنَتَيْنِ: رَجُلٌ آتَاهُ اللَّهُ المَالَ فَسُلِّطَ عَلَى هَلَكَتِهِ فِي الحَقِّ، وَرَجُلٌ آتَاهُ اللَّهُ الحِكْمَةَ فَهُوَ يَقْضِي بِهَا وَيُعَلِّمُهَا', 'translation' => 'Tidak boleh iri (ghibthah) kecuali pada dua hal: seseorang yang diberi harta oleh Allah lalu ia habiskan di jalan kebenaran, dan seseorang yang diberi hikmah (ilmu) lalu ia mengamalkan dan mengajarkannya.', 'book' => 'Bukhari, Muslim', 'number' => '73, 816', 'source' => 'HR. Bukhari no. 73 & Muslim no. 816'],
            ['arabic_text' => 'دَبَّ إِلَيْكُمْ دَاءُ الأُمَمِ قَبْلَكُمُ: الْحَسَدُ وَالْبَغْضَاءُ، هِيَ الْحَالِقَةُ', 'translation' => 'Telah merayap kepada kalian penyakit umat-umat sebelum kalian: yaitu iri dengki dan kebencian. Itulah pemotong (pengikis agama).', 'book' => 'Tirmidzi, Ahmad', 'number' => '2510', 'source' => 'HR. Tirmidzi no. 2510 & Ahmad'],
            ['arabic_text' => 'الْعَيْنُ حَقٌّ، وَلَوْ كَانَ شَيْءٌ سَابَقَ الْقَدَرَ سَبَقَتْهُ الْعَيْنُ', 'translation' => 'Penyakit \'Ain (akibat pandangan dengki/takjub tanpa mendoakan) itu nyata. Seandainya ada sesuatu yang dapat mendahului takdir, niscaya \'ain-lah yang mendahuluinya.', 'book' => 'Muslim', 'number' => '2188', 'source' => 'HR. Muslim no. 2188'],
            ['arabic_text' => 'إِذَا رَأَى أَحَدُكُمْ مِنْ أَخِيهِ مَا يُعْجِبُهُ فَلْيَدْعُ لَهُ بِالْبَرَكَةِ', 'translation' => 'Jika salah seorang dari kalian melihat sesuatu yang menakjubkan pada saudaranya, hendaklah ia mendoakan keberkahan untuknya (agar terhindar dari ain/hasad).', 'book' => 'Ibn Majah, Malik', 'number' => '3509', 'source' => 'HR. Ibn Majah no. 3509 & Malik'],
            ['arabic_text' => 'لاَ يَجْتَمِعَانِ فِي جَوْفِ عَبْدٍ: الإِيمَانُ وَالْحَسَدُ', 'translation' => 'Tidak akan berkumpul di dalam dada seorang hamba: keimanan dan rasa dengki (hasad).', 'book' => 'An-Nasa\'i, Ibn Hibban', 'number' => '3109', 'source' => 'HR. An-Nasa\'i no. 3109 & Ibn Hibban'],
            ['arabic_text' => 'لاَ يَزَالُ النَّاسُ بِخَيْرٍ مَا لَمْ يَتَحَاسَدُوا', 'translation' => 'Manusia akan senantiasa berada dalam kebaikan selama mereka tidak saling mendengki.', 'book' => 'Thabrani', 'number' => null, 'source' => 'HR. Thabrani (Al-Mu\'jam al-Kabir) & Al-Albani'],
            ['arabic_text' => 'يَطْلُعُ عَلَيْكُمُ الآنَ رَجُلٌ مِنْ أَهْلِ الْجَنَّةِ... (قَالَ: لاَ أَجِدُ فِي نَفْسِي لأَحَدٍ مِنَ الْمُسْلِمِينَ غِشًّا وَلاَ حَسَدًا)', 'translation' => 'Nabi bersabda: \'Akan muncul penghuni surga.\' (Lelaki Anshar itu berkata): \'Aku tidak mendapati dalam diriku rasa iri/dengki atau kecurangan kepada seorang pun dari kaum muslimin.\'', 'book' => 'Ahmad', 'number' => '12697', 'source' => 'HR. Ahmad no. 12697'],
            ['arabic_text' => 'كُلُّ ذِي نِعْمَةٍ مَحْسُودٌ', 'translation' => 'Setiap orang yang memiliki nikmat pasti ada yang mendengki (iri).', 'book' => 'Thabrani, Abu Nu\'aim', 'number' => null, 'source' => 'HR. Thabrani & Abu Nu\'aim'],
            ['arabic_text' => 'اسْتَعِينُوا عَلَى إِنْجَاحِ الْحَوَائِجِ بِالْكِتْمَانِ، فَإِنَّ كُلَّ ذِي نِعْمَةٍ مَحْسُودٌ', 'translation' => 'Minta tolonglah dalam menyelesaikan hajat-hajatmu dengan menyembunyikannya (merahasiakannya), karena setiap orang yang mendapat nikmat pasti ada yang iri.', 'book' => 'Thabrani', 'number' => null, 'source' => 'HR. Thabrani (Al-Mu\'jam al-Kabir) & Al-Albani'],
            ['arabic_text' => 'الْمُؤْمِنُ يَغْبِطُ وَالْمُنَافِقُ يَحْسُدُ', 'translation' => 'Seorang mukmin itu merasa ghibthah (ingin seperti orang lain dalam kebaikan tanpa mengharap nikmatnya hilang), sedangkan orang munafik itu merasa hasad (dengki).', 'book' => 'Ibn Abi ad-Dunya', 'number' => null, 'source' => 'HR. Ibn Abi ad-Dunya (Fi ash-Shamt)'],
            ['arabic_text' => 'أَفْضَلُ النَّاسِ: كُلُّ مَخْمُومِ الْقَلْبِ، صَدُوقِ اللِّسَانِ... هُوَ التَّقِيُّ النَّقِيُّ، لاَ إِثْمَ فِيهِ وَلاَ بَغْيَ وَلاَ غِلَّ وَلاَ حَسَدَ', 'translation' => 'Manusia paling utama adalah yang bersih hatinya dan jujur lisannya... Yaitu yang bertakwa, bersih, tidak ada dosa, tidak berbuat zalim, tidak ada dendam, dan tidak ada rasa dengki.', 'book' => 'Ibn Majah', 'number' => '4216', 'source' => 'HR. Ibn Majah no. 4216'],
            ['arabic_text' => 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّةِ مِنْ كُلِّ شَيْطَانٍ وَهَامَّةٍ وَمِنْ كُلِّ عَيْنٍ لاَمَّةٍ', 'translation' => 'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari setiap setan, binatang berbisa, dan dari setiap mata pendengki yang menyakiti (\'ain).', 'book' => 'Bukhari', 'number' => '3371', 'source' => 'HR. Bukhari no. 3371'],
            ['arabic_text' => 'بِسْمِ اللَّهِ أَرْقِيكَ، مِنْ كُلِّ شَيْءٍ يُؤْذِيكَ، مِنْ شَرِّ كُلِّ نَفْسٍ أَوْ عَيْنِ حَاسِدٍ، اللَّهُ يَشْفِيكَ', 'translation' => 'Dengan nama Allah aku meruqyahmu, dari segala sesuatu yang menyakitimu, dari kejahatan setiap jiwa atau mata orang yang dengki, semoga Allah menyembuhkanmu.', 'book' => 'Muslim', 'number' => '2186', 'source' => 'HR. Muslim no. 2186'],
            ['arabic_text' => 'ثَلاَثٌ لاَ يُغَلُّ عَلَيْهِنَّ قَلْبُ مُسْلِمٍ: إِخْلاَصُ الْعَمَلِ لِلَّهِ، وَمُنَاصَحَةُ أُولِي الأَمْرِ، وَلُزُومُ جَمَاعَةِ الْمُسْلِمِينَ', 'translation' => 'Tiga hal yang tidak akan membuat hati seorang muslim menjadi dengki/dendam: mengikhlaskan amal karena Allah, memberi nasihat kepada pemimpin, dan komitmen pada jamaah kaum muslimin.', 'book' => 'Tirmidzi, Ibn Majah', 'number' => '2658', 'source' => 'HR. Tirmidzi no. 2658 & Ibn Majah'],
            ['arabic_text' => 'لاَ يَكُونُ الْمُؤْمِنُ لَعَّانًا وَلاَ طَعَّانًا وَلاَ فَاحِشًا وَلاَ بَذِيئًا', 'translation' => 'Seorang mukmin bukanlah orang yang suka melaknat, suka mencela, berkata kotor, dan bersikap kasar (akibat hasad).', 'book' => 'Tirmidzi', 'number' => '1977', 'source' => 'HR. Tirmidzi no. 1977'],
            ['arabic_text' => 'انْظُرُوا إِلَى مَنْ هُوَ أَسْفَلَ مِنْكُمْ وَلاَ تَنْظُرُوا إِلَى مَنْ هُوَ فَوْقَكُمْ فَهُوَ أَجْدَرُ أَنْ لاَ تَزْدَرُوا نِعْمَةَ اللَّهِ', 'translation' => 'Lihatlah orang yang berada di bawahmu dan jangan melihat orang yang berada di atasmu, karena hal itu lebih layak agar kalian tidak meremehkan nikmat Allah (dan terhindar dari iri).', 'book' => 'Muslim', 'number' => '2963', 'source' => 'HR. Muslim no. 2963'],
            ['arabic_text' => 'اللَّهُمَّ آتِ نَفْسِي تَقْوَاهَا، وَزَكِّهَا أَنْتَ خَيْرُ مَنْ زَكَّاهَا، أَنْتَ وَلِيُّهَا وَمَوْلاَهَا', 'translation' => 'Ya Allah, berikanlah ketakwaan pada jiwaku dan sucikanlah ia (dari dengki), Engkaulah sebaik-baik yang menyucikannya, Engkau Pelindung dan Penolongnya.', 'book' => 'Muslim', 'number' => '2722', 'source' => 'HR. Muslim no. 2722'],
            ['arabic_text' => 'اللَّهُمَّ اهْدِ قَلْبِي، وَاسْلُلْ سَخِيمَةَ صَدْرِي', 'translation' => 'Ya Allah, berilah petunjuk pada hatiku, dan cabutlah/bersihkanlah kedengkian serta kotoran dari dadaku.', 'book' => 'Abu Dawud, Tirmidzi', 'number' => '1510', 'source' => 'HR. Abu Dawud no. 1510 & Tirmidzi'],
            ['arabic_text' => 'إِنَّمَا الأَعْمَالُ بِالنِّيَّاتِ', 'translation' => 'Sesungguhnya setiap amalan bergantung pada niatnya...', 'book' => 'Bukhari, Muslim', 'number' => '1, 1907', 'source' => 'HR. Bukhari no. 1 & Muslim no. 1907'],
            ['arabic_text' => 'الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ', 'translation' => 'Seorang muslim sejati adalah yang orang muslim lainnya selamat dari gangguan lisan dan tangannya (termasuk dampak iri).', 'book' => 'Bukhari, Muslim', 'number' => '10, 40', 'source' => 'HR. Bukhari no. 10 & Muslim no. 40'],
            ['arabic_text' => 'انْصُرْ أَخَاكَ ظَالِمًا أَوْ مَظْلُومًا', 'translation' => 'Tolonglah saudaramu baik yang melakukan zalim (mencegahnya dari dengki/zalim) maupun yang dizalimi.', 'book' => 'Bukhari', 'number' => '2444', 'source' => 'HR. Bukhari no. 2444'],
            ['arabic_text' => 'صَوْمُ شَهْرِ الصَّبْرِ وَثَلاَثَةِ أَيَّامٍ مِنْ كُلِّ شَهْرٍ يُذْهِبْنَ وَحَرَ الصَّدْرِ', 'translation' => 'Puasa bulan sabar (Ramadhan) dan tiga hari setiap bulan (Ayyamul Bidh) dapat menghilangkan kedengkian/kotoran dada.', 'book' => 'An-Nasa\'i, Ahmad', 'number' => '2386', 'source' => 'HR. An-Nasa\'i no. 2386 & Ahmad'],
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (iri).' . PHP_EOL;
    }
}
