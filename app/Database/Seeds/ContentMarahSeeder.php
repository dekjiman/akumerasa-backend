<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentMarahSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [
            ['surah' => 3, 'ayat_number' => 134, 'arabic_text' => 'الَّذِينَ يُنْفِقُونَ فِي السَّرَّاءِ وَالضَّرَّاءِ وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ', 'translation' => '(yaitu) orang-orang yang menginfakkan (hartanya), baik di waktu lapang maupun sempit, dan orang-orang yang menahan amarahnya dan memaafkan (kesalahan) orang lain. Dan Allah menyukai orang-orang yang berbuat kebaikan.', 'tags' => 'marah, menahan amarah, memaafkan'],
            ['surah' => 3, 'ayat_number' => 159, 'arabic_text' => 'فَبِمَا رَحْمَةٍ مِنَ اللَّهِ لِنْتَ لَهُمْ ۖ وَلَوْ كُنْتَ فَظًّا غَلِيظَ الْقَلْبِ لَانْفَضُّوا مِنْ حَوْلِكَ', 'translation' => 'Maka berkat rahmat Allah engkau (Muhammad) berlaku lemah lembut terhadap mereka. Sekiranya engkau bersikap keras dan berhati kasar (mudah marah), tentulah mereka menjauhkan diri dari sekitarmu.', 'tags' => 'marah, lemah lembut, adab'],
            ['surah' => 42, 'ayat_number' => 37, 'arabic_text' => 'وَالَّذِينَ يَجْتَنِبُونَ كَبَائِرَ الْإِثْمِ وَالْفَوَاحِشَ وَإِذَا مَا غَضِبُوا هُمْ يَغْفِرُونَ', 'translation' => 'Dan (juga bagi) orang-orang yang menjauhi dosa-dosa besar dan perbuatan-perbuatan keji, dan apabila mereka marah mereka memberi maaf.', 'tags' => 'marah, ampunan, memaafkan'],
            ['surah' => 42, 'ayat_number' => 40, 'arabic_text' => 'وَجَزَاءُ سَيِّئَةٍ سَيِّئَةٌ مِثْلُهَا ۖ فَمَنْ عَفَا وَأَصْلَحَ فَأَجْرُهُ عَلَى اللَّهِ', 'translation' => 'Dan balasan suatu kejahatan adalah kejahatan yang serupa, maka barangsiapa memaafkan dan berbuat baik maka pahalanya atas (tanggungan) Allah.', 'tags' => 'marah, balasan, memaafkan'],
            ['surah' => 41, 'ayat_number' => 34, 'arabic_text' => 'وَلَا تَسْتَوِي الْحَسَنَةُ وَلَا السَّيِّئَةُ ۚ ادْفَعْ بِالَّتِي هِيَ أَحْسَنُ فَإِذَا الَّذِي بَيْنَكَ وَبَيْنَهُ عَدَاوَةٌ كَأَنَّهُ وَلِيٌّ حَمِيمٌ', 'translation' => 'Dan tidak sama kebaikan dengan kejahatan. Tolaklah (kejahatan itu) dengan cara yang lebih baik, sehingga orang yang ada rasa permusuhan antara engkau dan dia akan seperti teman yang setia.', 'tags' => 'marah, meredam emosi, kebaikan'],
            ['surah' => 7, 'ayat_number' => 150, 'arabic_text' => 'وَلَمَّا رَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا قَالَ بِئْسَمَا خَلَفْتُمُونِي مِنْ بَعْدِي', 'translation' => 'Dan ketika Musa telah kembali kepada kaumnya, dengan marah dan sedih hati berkatalah dia: \'Alangkah buruknya perbuatan yang kamu kerjakan sesudah kepergianku!\'', 'tags' => 'marah, Nabi Musa, emosi manusiawi'],
            ['surah' => 7, 'ayat_number' => 154, 'arabic_text' => 'وَلَمَّا سَكَتَ عَنْ مُوسَى الْغَضَبُ أَخَذَ الْأَلْوَاحَ', 'translation' => 'Dan setelah amarah Musa mereda, diambilnya (kembali) luh-luh (Taurat) itu...', 'tags' => 'marah, reda amarah, Nabi Musa'],
            ['surah' => 7, 'ayat_number' => 199, 'arabic_text' => 'خُذِ الْعَفْوَ وَأْمُرْ بِالْعُرْفِ وَأَعْرِضْ عَنِ الْجَاهِلِينَ', 'translation' => 'Jadilah pemaaf dan suruhlah orang mengerjakan yang makruf, serta jangan pedulikan orang-orang yang bodoh.', 'tags' => 'marah, pemaaf, kesabaran'],
            ['surah' => 7, 'ayat_number' => 200, 'arabic_text' => 'وَإِمَّا يَنْزَغَنَّكَ مِنَ الشَّيْطَانِ نَزْغٌ فَاسْتَعِذْ بِاللَّهِ ۚ إِنَّهُ سَمِيعٌ عَلِيمٌ', 'translation' => 'Dan jika setan datang menggodamu dengan suatu godaan (termasuk emosi/amarah), maka mohonlah perlindungan kepada Allah. Sungguh, Dia Maha Mendengar lagi Maha Mengetahui.', 'tags' => 'marah, godaan setan, ta\'awwudz'],
            ['surah' => 21, 'ayat_number' => 87, 'arabic_text' => 'وَذَا النُّونِ إِذْ ذَهَبَ مُغَاضِبًا فَظَنَّ أَنْ لَنْ نَقْدِرَ عَلَيْهِ', 'translation' => 'Dan (ingatlah kisah) Dzun Nuun (Yunus), ketika dia pergi dalam keadaan marah, lalu dia menyangka bahwa Kami tidak akan menyulitkannya...', 'tags' => 'marah, Nabi Yunus, pelajaran amarah'],
            ['surah' => 9, 'ayat_number' => 15, 'arabic_text' => 'وَيُذْهِبْ غَيْظَ قُلُوبِهِمْ ۗ وَيَتُوبُ اللَّهُ عَلَىٰ مَنْ يَشَاءُ', 'translation' => 'Dan menghilangkan kemarahan hati orang-orang yang beriman. Dan Allah menerima taubat orang yang dikehendaki-Nya...', 'tags' => 'marah, penawar amarah, ketenangan'],
            ['surah' => 48, 'ayat_number' => 26, 'arabic_text' => 'إِذْ جَعَلَ الَّذِينَ كَفَرُوا فِي قُلُوبِهِمُ الْحَمِيَّةَ حَمِيَّةَ الْجَاهِلِيَّةِ فَأَنْزَلَ اللَّهِ سَكِينَتَهُ عَلَىٰ رَسُولِهِ', 'translation' => 'Ketika orang-orang yang kafir menanamkan dalam hati mereka kesombongan (yaitu) kesombongan jahiliyah, lalu Allah menurunkan ketenangan kepada Rasul-Nya...', 'tags' => 'marah, emosi jahiliyah, ketenangan'],
            ['surah' => 20, 'ayat_number' => 86, 'arabic_text' => 'فَرَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا', 'translation' => 'Kemudian Musa kembali kepada kaumnya dengan marah dan sedih hati...', 'tags' => 'marah, kekecewaan, Nabi Musa'],
            ['surah' => 33, 'ayat_number' => 25, 'arabic_text' => 'وَرَدَّ اللَّهُ الَّذِينَ كَفَرُوا بِغَيْظِهِمْ لَمْ يَنَالُوا خَيْرًا', 'translation' => 'Dan Allah menghalau orang-orang kafir itu yang keadaan hatinya penuh kejengkelan (kemarahan), mereka tidak memperoleh keuntungan apa pun...', 'tags' => 'marah, kejengkelan musuh, perlindungan'],
            ['surah' => 5, 'ayat_number' => 8, 'arabic_text' => 'وَلَا يَجْرِمَنَّكُمْ شَنَآنُ قَوْمٍ عَلَىٰ أَلَّا تَعْدِلُوا ۚ اعْدِلُوا هُوَ أَقْرَبُ لِلتَّقْوَىٰ', 'translation' => '...Dan janganlah kebencian/kemarahanmu terhadap suatu kaum, mendorong kamu untuk berlaku tidak adil. Berlaku adillah, karena adil itu lebih dekat kepada takwa...', 'tags' => 'marah, benci, keadilan'],
            ['surah' => 25, 'ayat_number' => 63, 'arabic_text' => 'وَعِبَادُ الرَّحْمَٰنِ الَّذِينَ يَمْشُونَ عَلَى الْأَرْضِ هَوْنًا وَإِذَا خَاطَبَهُمُ الْجَاهِلُونَ قَالُوا سَلَامًا', 'translation' => 'Adapun hamba-hamba Tuhan Yang Maha Pengasih itu adalah orang-orang yang berjalan di bumi dengan rendah hati dan apabila orang-orang bodoh menyapa mereka (dengan kata-kata menghina), mereka mengucapkan \'selamat\'.', 'tags' => 'marah, kesabaran, meredam emosi'],
            ['surah' => 31, 'ayat_number' => 18, 'arabic_text' => 'وَلَا تُصَعِّرْ خَدَّكَ لِلنَّاسِ وَلَا تَمْشِ فِي الْأَرْضِ مَرَحًا', 'translation' => 'Dan janganlah kamu memalingkan mukamu dari manusia (karena sombong/marah) dan janganlah berjalan di bumi dengan angkuh...', 'tags' => 'marah, adab, kesombongan'],
            ['surah' => 16, 'ayat_number' => 126, 'arabic_text' => 'وَإِنْ عَاقَبْتُمْ فَعَاقِبُوا بِمِثْلِ مَا عُوقِبْتُمْ بِهِ ۖ وَلَئِنْ صَبَرْتُمْ لَهُوَ خَيْرٌ لِلصَّابِرِينَ', 'translation' => 'Dan jika kamu membalas, maka balaslah dengan yang serupa dengan siksaan yang ditimpakan kepadamu. Tetapi jika kamu bersabar, sungguh itu lebih baik bagi orang-orang yang sabar.', 'tags' => 'marah, amarah, balasan adil, sabar'],
            ['surah' => 64, 'ayat_number' => 14, 'arabic_text' => 'وَإِنْ تَعْفُوا وَتَصْفَحُوا وَتَغْفِرُوا فَإِنَّ اللَّهَ غَفُورٌ رَحِيمٌ', 'translation' => '...Dan jika kamu memaafkan dan kamu santuni serta ampunkan (kesalahan mereka), maka sungguh, Allah Maha Pengampun lagi Maha Penyayang.', 'tags' => 'marah, lapang dada, memaafkan'],
            ['surah' => 2, 'ayat_number' => 109, 'arabic_text' => 'فَاعْفُوا وَاصْفَحُوا حَتَّىٰ يَأْتِيَ اللَّهُ بِأَمْرِهِ', 'translation' => '...Maka maafkanlah dan lapangkanlah dada (jangan menuruti amarah) sampai Allah mendatangkan perintah-Nya...', 'tags' => 'marah, lapang dada, kesabaran'],
            ['surah' => 24, 'ayat_number' => 22, 'arabic_text' => 'وَلْيَعْفُوا وَلْيَصْفَحُوا ۗ أَلَا تُحِبُّونَ أَنْ يَغْفِرَ اللَّهُ لَكُمْ', 'translation' => '...dan hendaklah mereka memaafkan dan berlapang dada. Apakah kamu tidak suka bahwa Allah mengampunimu?', 'tags' => 'marah, ampunan Allah, memaafkan'],
            ['surah' => 5, 'ayat_number' => 13, 'arabic_text' => 'فَاعْفُ عَنْهُمْ وَاصْفَحْ ۚ إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ', 'translation' => '...Maka maafkanlah mereka dan biarkanlah mereka, sesungguhnya Allah menyukai orang-orang yang berbuat baik.', 'tags' => 'marah, memaafkan, ihsan'],
            ['surah' => 15, 'ayat_number' => 85, 'arabic_text' => 'فَاصْفَحِ الصَّفْحَ الْجَمِيلَ', 'translation' => 'Maka maafkanlah (mereka) dengan cara yang baik.', 'tags' => 'marah, maaf yang indah, sabar'],
            ['surah' => 2, 'ayat_number' => 263, 'arabic_text' => 'قَوْلٌ مَعْرُوفٌ وَمَغْفِرَةٌ خَيْرٌ مِنْ صَدَقَةٍ يَتْبَعُهَا أَذًى', 'translation' => 'Perkataan yang baik dan pemberian maaf lebih baik daripada sedekah yang diiringi tindakan yang menyakiti...', 'tags' => 'marah, tutur kata baik, memaafkan'],
            ['surah' => 68, 'ayat_number' => 48, 'arabic_text' => 'فَاصْبِرْ لِحُكْمِ رَبِّكَ وَلَا تَكُنْ كَصَاحِبِ الْحُوتِ إِذْ نَادَىٰ وَهُوَ مَكْظُومٌ', 'translation' => 'Maka bersabarlah engkau (Muhammad) terhadap ketetapan Tuhanmu, dan janganlah engkau seperti orang yang berada dalam (perut) ikan (Yunus) ketika dia berdoa dengan hati penuh duka/amarah yang tertahan.', 'tags' => 'marah, menahan amarah, Nabi Yunus'],
            ['surah' => 3, 'ayat_number' => 155, 'arabic_text' => 'إِنَّمَا اسْتَزَلَّهُمُ الشَّيْطَانُ بِبَعْضِ مَا كَسَبُوا', 'translation' => '...Sesungguhnya mereka digelincirkan oleh setan (termasuk emosi tak terkontrol), disebabkan sebagian kesalahan yang telah mereka perbuat...', 'tags' => 'marah, godaan setan, kelemahan'],
            ['surah' => 17, 'ayat_number' => 53, 'arabic_text' => 'وَقُلْ لِعِبَادِي يَقُولُوا الَّتِي هِيَ أَحْسَنُ ۚ إِنَّ الشَّيْطَانَ يَنْزَغُ بَيْنَهُمْ', 'translation' => 'Dan katakanlah kepada hamba-hamba-Ku: \'Hendaklah mereka mengucapkan perkataan yang lebih baik (benar). Sungguh, setan itu selalu menimbulkan perselisihan di antara mereka...\'', 'tags' => 'marah, adab berbicara, godaan setan'],
            ['surah' => 20, 'ayat_number' => 44, 'arabic_text' => 'فَقُولَا لَهُ قَوْلًا لَيِّنًا لَعَلَّهُ يَتَذَكَّرُ أَوْ يَخْشَىٰ', 'translation' => 'Maka berbicaralah kamu berdua kepadanya (Firaun) dengan kata-kata yang lemah lembut, mudah-mudahan dia sadar atau takut.', 'tags' => 'marah, kata-kata lembut, kontrol emosi'],
            ['surah' => 28, 'ayat_number' => 15, 'arabic_text' => 'فَوَكَزَهُ مُوسَىٰ فَقَضَىٰ عَلَيْهِ ۖ قَالَ هَٰذَا مِنْ عَمَلِ الشَّيْطَانِ', 'translation' => '...Maka Musa meninjunya, dan matilah musuhnya itu. Musa berkata: \'Ini adalah perbuatan setan (impulsif/amarah)...\'', 'tags' => 'marah, akibat emosi, perbuatan setan'],
            ['surah' => 12, 'ayat_number' => 100, 'arabic_text' => 'مِنْ بَعْدِ أَنْ نَزَغَ الشَّيْطَانُ بَيْنِي وَبَيْنَ إِخْوَتِي', 'translation' => '...setelah setan merusak (hubungan/merangsang amarah) antara aku dan saudara-saudaraku...', 'tags' => 'marah, adu domba, perpecahan'],
        ];

        $hadiths = [
            ['arabic_text' => 'لَيْسَ الشَّدِيدُ بِالصُّرَعَةِ، إِنَّمَا الشَّدِيدُ الَّذِي يَمْلِكُ نَفْسَهُ عِنْدَ الْغَضَبِ', 'translation' => 'Orang yang kuat itu bukanlah orang yang jago gulat, melainkan orang yang mampu mengendalikan dirinya saat marah.', 'book' => 'Bukhari, Muslim', 'number' => '6114, 2609', 'source' => 'HR. Bukhari no. 6114 & Muslim no. 2609'],
            ['arabic_text' => 'لاَ تَغْضَبْ، وَلَكَ الْجَنَّةُ', 'translation' => 'Janganlah engkau marah, maka bagimu surga.', 'book' => 'Thabrani', 'number' => null, 'source' => 'HR. Thabrani (Mu\'jam al-Awsat) & Sahih al-Jami\' no. 7374'],
            ['arabic_text' => 'لاَ تَغْضَبْ', 'translation' => 'Jangan marah.', 'book' => 'Bukhari', 'number' => '6116', 'source' => 'HR. Bukhari no. 6116'],
            ['arabic_text' => 'إِذَا غَضِبَ أَحَدُكُمْ فَلْيَسْكُتْ', 'translation' => 'Apabila salah seorang di antara kalian marah, hendaklah ia diam.', 'book' => 'Ahmad', 'number' => '2137', 'source' => 'HR. Ahmad no. 2137'],
            ['arabic_text' => 'إِذَا غَضِبَ أَحَدُكُمْ وَهُوَ قَائِمٌ فَلْيَجْلِسْ، فَإِنْ ذَهَبَ عَنْهُ الْغَضَبُ وَإِلاَّ فَلْيَضْطَجِعْ', 'translation' => 'Apabila salah seorang di antara kalian marah dalam keadaan berdiri, hendaklah ia duduk. Jika amarahnya belum hilang, hendaklah ia berbaring.', 'book' => 'Abu Dawud', 'number' => '4782', 'source' => 'HR. Abu Dawud no. 4782'],
            ['arabic_text' => 'إِنَّ الْغَضَبَ مِنَ الشَّيْطَانِ وَإِنَّ الشَّيْطَانَ خُلِقَ مِنَ النَّارِ وَإِنَّمَا تُطْفَأُ النَّارُ بِالْمَاءِ فَإِذَا غَضِبَ أَحَدُكُمْ فَلْيَتَوَضَّأْ', 'translation' => 'Sesungguhnya amarah itu dari setan, dan setan diciptakan dari api. Api hanya dapat dipadamkan dengan air. Maka apabila salah seorang di antara kalian marah, hendaklah ia berwudu.', 'book' => 'Abu Dawud', 'number' => '4784', 'source' => 'HR. Abu Dawud no. 4784'],
            ['arabic_text' => 'إِنِّي لأَعْلَمُ كَلِمَةً لَوْ قَالَهَا لَذَهَبَ عَنْهُ مَا يَجِدُ: أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ', 'translation' => 'Sungguh aku mengetahui satu kalimat yang jika diucapkannya, niscaya akan hilang apa yang dirasakannya (amarah): \'A\'udzu billahi minasysyaithanirrajim\'.', 'book' => 'Bukhari, Muslim', 'number' => '6115, 2610', 'source' => 'HR. Bukhari no. 6115 & Muslim no. 2610'],
            ['arabic_text' => 'مَنْ كَظَمَ غَيْظًا وَهُوَ قَادِرٌ عَلَى أَنْ يُنْفِذَهُ دَعَاهُ اللَّهُ عَزَّ وَجَلَّ عَلَى رُؤُوسِ الْخَلاَئِقِ يَوْمَ الْقِيَامَةِ حَتَّى يُخَيِّرَهُ اللَّهُ مِنَ الْحُورِ الْعِينِ مَا شَاءَ', 'translation' => 'Barangsiapa menahan amarah padahal dia sanggup melampiaskannya, Allah akan memanggilnya di hadapan seluruh makhluk pada hari kiamat dan memberinya kebebasan memilih bidadari yang diinginkannya.', 'book' => 'Abu Dawud, Tirmidzi', 'number' => '4777, 2021', 'source' => 'HR. Abu Dawud no. 4777 & Tirmidzi no. 2021'],
            ['arabic_text' => 'مَا مِنْ جُرْعَةٍ أَعْظَمُ أَجْرًا عِنْدَ اللَّهِ مِنْ جُرْعَةِ غَيْظٍ كَظَمَهَا عَبْدٌ ابْتِغَاءَ وَجْهِ اللَّهِ', 'translation' => 'Tidak ada satu tegukan pun yang lebih besar pahalanya di sisi Allah selain tegukan amarah yang ditahan seorang hamba semata-mata karena mengharap wajah Allah.', 'book' => 'Ibnu Majah', 'number' => '4189', 'source' => 'HR. Ibn Majah no. 4189'],
            ['arabic_text' => 'لاَ يَقْضِيَنَّ حَكَمٌ بَيْنَ اثْنَيْنِ وَهُوَ غَضْبَانُ', 'translation' => 'Janganlah seorang hakim memutuskan hukum antara dua orang dalam keadaan ia sedang marah.', 'book' => 'Bukhari, Muslim', 'number' => '7158, 1717', 'source' => 'HR. Bukhari no. 7158 & Muslim no. 1717'],
            ['arabic_text' => 'لاَ تَدْعُوا عَلَى أَنْفُسِكُمْ وَلاَ تَدْعُوا عَلَى أَوْلاَدِكُمْ وَلاَ تَدْعُوا عَلَى أَمْوَالِكُمْ', 'translation' => 'Janganlah kalian mendoakan keburukan atas diri kalian, anak-anak kalian, maupun harta kalian (saat marah).', 'book' => 'Muslim', 'number' => '3009', 'source' => 'HR. Muslim no. 3009'],
            ['arabic_text' => 'اللَّهُمَّ إِنِّي أَسْأَلُكَ كَلِمَةَ الْحَقِّ فِي الرِّضَا وَالْغَضَبِ', 'translation' => 'Ya Allah, aku memohon kepada-Mu (kemampuan mengucapkan) kalimat yang haq (benar) dalam keadaan ridha maupun marah.', 'book' => 'An-Nasa\'i', 'number' => '1305', 'source' => 'HR. An-Nasa\'i no. 1305'],
            ['arabic_text' => 'أَنَّ رَسُولَ اللَّهِ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ لَمْ يَكُنْ يَغْضَبُ لِنَفْسِهِ، إِلاَّ أَنْ تُنْتَهَكَ حُرُمَاتُ اللَّهِ', 'translation' => 'Rasulullah SAW tidak pernah marah karena urusan pribadinya, kecuali jika batasan-batasan (kehormatan) Allah dilanggar.', 'book' => 'Bukhari, Muslim', 'number' => '6126, 2327', 'source' => 'HR. Bukhari no. 6126 & Muslim no. 2327'],
            ['arabic_text' => 'مَا نَقَصَتْ صَدَقَةٌ مِنْ مَالٍ، وَمَا زَادَ اللَّهُ عَبْدًا بِعَفْوٍ إِلاَّ عِزًّا', 'translation' => 'Sedekah tidak akan mengurangi harta, dan tidaklah Allah menambah bagi seorang hamba yang suka memaafkan (meredam amarah) melainkan kemuliaan.', 'book' => 'Muslim', 'number' => '2588', 'source' => 'HR. Muslim no. 2588'],
            ['arabic_text' => 'إِنَّ اللَّهَ رَفِيقٌ يُحِبُّ الرِّفْقَ، وَيُعْطِي عَلَى الرِّفْقِ مَا لاَ يُعْطِي عَلَى الْعُنْفِ', 'translation' => 'Sesungguhnya Allah Maha Lembut dan menyukai kelembutan. Dia memberikan pada kelembutan apa yang tidak Dia berikan pada kekerasan (amarah).', 'book' => 'Muslim', 'number' => '2593', 'source' => 'HR. Muslim no. 2593'],
            ['arabic_text' => 'مَنْ يُحْرَمِ الرِّفْقَ يُحْرَمِ الْخَيْرَ', 'translation' => 'Barangsiapa dihalangi dari sifat lembut (mudah marah/kasar), maka ia dihalangi dari seluruh kebaikan.', 'book' => 'Muslim', 'number' => '2592', 'source' => 'HR. Muslim no. 2592'],
            ['arabic_text' => 'إِنَّ الرِّفْقَ لاَ يَكُونُ فِي شَيْءٍ إِلاَّ زَانَهُ، وَلاَ يُنْزَعُ مِنْ شَيْءٍ إِلاَّ شَانَهُ', 'translation' => 'Sungguh, kelembutan itu tidaklah ada pada sesuatu melainkan akan menghiasinya, dan tidaklah dicabut dari sesuatu melainkan akan memperburuknya.', 'book' => 'Muslim', 'number' => '2594', 'source' => 'HR. Muslim no. 2594'],
            ['arabic_text' => 'أَلاَ أُخْبِرُكُمْ بِمَنْ يَحْرُمُ عَلَى النَّارِ؟ عَلَى كُلِّ قَرِيبٍ هَيِّنٍ سَهْلٍ', 'translation' => 'Maukah kalian kuingatkan tentang orang yang diharamkan dari api neraka? Yaitu setiap orang yang dekat (ramah), tenang, dan mudah/tidak gampang marah.', 'book' => 'Tirmidzi', 'number' => '2488', 'source' => 'HR. Tirmidzi no. 2488'],
            ['arabic_text' => 'ثَلاَثٌ مُنْجِيَاتٌ: خَشْيَةُ اللَّهِ فِي السِّرِّ وَالْعَلاَنِيَةِ، وَالْعَدْلُ فِي الرِّضَا وَالْغَضَبِ...', 'translation' => 'Tiga hal yang menyelamatkan: takut kepada Allah saat sendiri maupun terang-terangan, dan berlaku adil saat ridha maupun marah...', 'book' => 'Thabrani', 'number' => null, 'source' => 'HR. Thabrani (Al-Mu\'jam al-Awsat) & Albani'],
            ['arabic_text' => 'اللَّهُمَّ قِنِي شَرَّ نَفْسِي وَاعْزِمْ لِي عَلَى أَرْشَدِ أَمْرِي', 'translation' => 'Ya Allah, lindungilah aku dari kejahatan diriku (termasuk hawa nafsu dan amarahku) dan mantapkanlah aku pada urusanku yang paling lurus.', 'book' => 'Ahmad', 'number' => '19992', 'source' => 'HR. Ahmad no. 19992'],
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (marah).' . PHP_EOL;
    }
}
