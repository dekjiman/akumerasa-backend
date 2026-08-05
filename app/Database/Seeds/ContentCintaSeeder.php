<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentCintaSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [

            ['surah' => 30, 'ayat_number' => 21, 'arabic_text' => 'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُمْ مِنْ أَنْفُسِكُمْ أَزْوَاجًا لِتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُمْ مَوَدَّةً وَرَحْمَةً', 'translation' => 'Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang...', 'tags' => 'cinta, mawaddah, rahmah, pernikahan'],
            ['surah' => 2, 'ayat_number' => 165, 'arabic_text' => 'وَالَّذِينَ آمَنُوا أَشَدُّ حُبًّا لِلَّهِ', 'translation' => '...Adapun orang-orang yang beriman sangat besar cintanya kepada Allah...', 'tags' => 'cinta Allah, keimanan, ketauhidan'],
            ['surah' => 3, 'ayat_number' => 31, 'arabic_text' => 'قُلْ إِنْ كُنْتُمْ تُحِبُّونَ اللَّهَ فَاتَّبِعُونِي يُحْبِبْكُمُ اللَّهُ وَيَغْفِرْ لَكُمْ ذُنُوبَكُمْ', 'translation' => 'Katakanlah (Muhammad): Jika kamu mencintai Allah, ikutilah aku, niscaya Allah mencintaimu dan mengampuni dosa-dosamu...', 'tags' => 'cinta Allah, mahabah, iktiba rasul'],
            ['surah' => 5, 'ayat_number' => 54, 'arabic_text' => 'فَسَوْفَ يَأْتِي اللَّهُ بِقَوْمٍ يُحِبُّهُمْ وَيُحِبُّونَهُ', 'translation' => '...Maka kelak Allah akan mendatangkan suatu kaum yang Dia mencintai mereka dan mereka pun mencintai-Nya...', 'tags' => 'cinta timbal balik, mahabah, keimanan'],
            ['surah' => 20, 'ayat_number' => 39, 'arabic_text' => 'وَأَلْقَيْتُ عَلَيْكَ مَهَبَّةً مِنِّي وَلِتُصْنَعَ عَلَىٰ عَيْنِي', 'translation' => '...Dan Aku telah melimpahkan kepadamu rasa kasih sayang yang datang dari-Ku; dan agar engkau diasuh di bawah pengawasan-Ku.', 'tags' => 'cinta, kasih sayang Allah, Nabi Musa'],
            ['surah' => 19, 'ayat_number' => 96, 'arabic_text' => 'إِنَّ الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ سَيَجْعَلُ لَهُمُ الرَّحْمَٰنُ وُدًّا', 'translation' => 'Sungguh, orang-orang yang beriman dan beramal saleh, kelak Allah Yang Maha Pengasih akan menanamkan rasa kasih sayang (dalam hati mereka).', 'tags' => 'cinta, kasih sayang, amalan saleh'],
            ['surah' => 8, 'ayat_number' => 63, 'arabic_text' => 'وَأَلَّفَ بَيْنَ قُلُوبِهِمْ ۚ لَوْ أَنْفَقْتَ مَا فِي الْأَرْضِ جَمِيعًا مَا أَلَّفْتَ بَيْنَ قُلُوبِهِمْ وَلَٰكِنَّ اللَّهَ أَلَّفَ بَيْنَهُمْ', 'translation' => 'Dan Dialah yang mempersatukan hati mereka (orang beriman). Walaupun engkau menginfakkan semua yang ada di bumi, niscaya engkau tidak dapat mempersatukan hati mereka, tetapi Allah telah mempersatukan hati mereka...', 'tags' => 'cinta, ikatan hati, ukhuwah'],
            ['surah' => 49, 'ayat_number' => 7, 'arabic_text' => 'وَلَٰكِنَّ اللَّهَ حَبَّبَ إِلَيْكُمُ الْإِيمَانَ وَزَيَّنَهُ فِي قُلُوبِكُمْ', 'translation' => '...Tetapi Allah menjadikan kamu cinta kepada keimanan dan menjadikan (iman) itu indah dalam hatimu...', 'tags' => 'cinta keimanan, hidayah, keindahan iman'],
            ['surah' => 9, 'ayat_number' => 24, 'arabic_text' => 'قُلْ إِنْ كَانَ آبَاؤُكُمْ وَأَبْنَاؤُكُمْ وَإِخْوَانُكُمْ وَأَزْوَاجُكُمْ... أَحَبَّ إِلَيْكُمْ مِنَ اللَّهِ وَرَسُولِهِ وَجِهَادٍ فِي سَبِيلِهِ فَتَرَبَّصُوا', 'translation' => 'Katakanlah: Jika bapak-bapakmu, anak-anakmu, saudara-saudaramu, istri-istrimu... lebih kamu cintai daripada Allah dan Rasul-Nya dan daripada berjihad di jalan-Nya, maka tunggulah sampai Allah mendatangkan keputusan-Nya...', 'tags' => 'prioritas cinta, cinta Allah dan Rasul, ujian cinta'],
            ['surah' => 2, 'ayat_number' => 222, 'arabic_text' => 'إِنَّ اللَّهَ يُحِبُّ التَّوَّابِينَ وَيُحِبُّ الْمُتَطَهِّرِينَ', 'translation' => '...Sesungguhnya Allah menyukai/mencintai orang-orang yang bertobat dan menyukai orang-orang yang menyucikan diri.', 'tags' => 'cinta Allah, taubat, kesucian'],
            ['surah' => 3, 'ayat_number' => 134, 'arabic_text' => 'وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ', 'translation' => '...dan orang-orang yang menahan amarahnya dan memaafkan (kesalahan) orang lain. Dan Allah menyukai/mencintai orang-orang yang berbuat kebaikan.', 'tags' => 'cinta Allah, ihsan, menahan amarah'],
            ['surah' => 3, 'ayat_number' => 146, 'arabic_text' => 'وَاللَّهُ يُحِبُّ الصَّابِرِينَ', 'translation' => '...Dan Allah menyukai/mencintai orang-orang yang sabar.', 'tags' => 'cinta Allah, kesabaran, ujian'],
            ['surah' => 3, 'ayat_number' => 159, 'arabic_text' => 'إِنَّ اللَّهَ يُحِبُّ الْمُتَوَكِّلِينَ', 'translation' => '...Sungguh, Allah menyukai/mencintai orang-orang yang bertawakal.', 'tags' => 'cinta Allah, tawakal, kepasrahan'],
            ['surah' => 5, 'ayat_number' => 42, 'arabic_text' => 'إِنَّ اللَّهَ يُحِبُّ الْمُقْسِطِينَ', 'translation' => '...Sesungguhnya Allah menyukai/mencintai orang-orang yang berlaku adil.', 'tags' => 'cinta Allah, keadilan, kejujuran'],
            ['surah' => 49, 'ayat_number' => 9, 'arabic_text' => 'وَأَقْسِطُوا ۖ إِنَّ اللَّهَ يُحِبُّ الْمُقْسِطِينَ', 'translation' => '...Dan berlaku adillah. Sungguh, Allah mencintai orang-orang yang berlaku adil.', 'tags' => 'cinta Allah, keadilan, kedamaian'],
            ['surah' => 9, 'ayat_number' => 4, 'arabic_text' => 'إِنَّ اللَّهَ يُحِبُّ الْمُتَّقِينَ', 'translation' => '...Sesungguhnya Allah menyukai/mencintai orang-orang yang bertakwa.', 'tags' => 'cinta Allah, takwa, ketaatan'],
            ['surah' => 61, 'ayat_number' => 4, 'arabic_text' => 'إِنَّ اللَّهَ يُحِبُّ الَّذِينَ يُقَاتِلُونَ فِي سَبِيلِهِ صَفًّا كَأَنَّهُمْ بُنْيَانٌ مَرْصُوصٌ', 'translation' => 'Sesungguhnya Allah mencintai orang-orang yang berperang di jalan-Nya dalam barisan yang teratur seakan-akan mereka seperti suatu bangunan yang tersusun kokoh.', 'tags' => 'cinta Allah, perjuangan, persatuan'],
            ['surah' => 2, 'ayat_number' => 195, 'arabic_text' => 'وَأَحْسِنُوا ۛ إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ', 'translation' => '...Dan berbuat baiklah, karena sesungguhnya Allah menyukai/mencintai orang-orang yang berbuat baik.', 'tags' => 'cinta Allah, ihsan, kebaikan'],
            ['surah' => 12, 'ayat_number' => 30, 'arabic_text' => 'قَدْ شَغَفَهَا حُبًّا ۖ إِنَّا لَنَرَاهَا فِي ضَلَالٍ مُبِينٍ', 'translation' => '...Sesungguhnya cintanya kepada Yusuf itu sangat mendalam. Sungguh, kami memandangnya dalam kesesatan yang nyata.', 'tags' => 'cinta, Zulaikha dan Yusuf, emosi manusia'],
            ['surah' => 2, 'ayat_number' => 177, 'arabic_text' => 'وَآتَى الْمَالَ عَلَىٰ حُبِّهِ ذَوِي الْقُرْبَىٰ وَالْيَتَامَىٰ وَالْمَسَاكِينَ', 'translation' => '...dan memberikan harta yang dicintainya kepada kerabat, anak-anak yatim, orang-orang miskin...', 'tags' => 'cinta harta, kedermawanan, infak'],
            ['surah' => 3, 'ayat_number' => 92, 'arabic_text' => 'لَنْ تَنَالُوا الْبِرَّ حَتَّىٰ تُنْفِقُوا مِمَّا تُحِبُّونَ', 'translation' => 'Kamu tidak akan memperoleh kebajikan (yang sempurna) sebelum kamu menginfakkan sebagian harta yang kamu cintai...', 'tags' => 'cinta harta, keikhlasan, pengorbanan'],
            ['surah' => 3, 'ayat_number' => 14, 'arabic_text' => 'زُيِّنَ لِلنَّاسِ حُبُّ الشَّهَوَاتِ مِنَ النِّسَاءِ وَالْبَنِينَ وَالْقَنَاطِيرِ الْمُقَنْطَرَةِ', 'translation' => 'Dijadikan terasa indah dalam pandangan manusia cinta kepada apa-apa yang diingini, yaitu: wanita-wanita, anak-anak, harta yang banyak...', 'tags' => 'cinta dunia, syahwat, ujian hidup'],
            ['surah' => 89, 'ayat_number' => 20, 'arabic_text' => 'وَتُحِبُّونَ الْمَالَ حُبًّا جَمًّا', 'translation' => 'Dan kamu mencintai harta dengan kecintaan yang berlebihan.', 'tags' => 'cinta harta, peringatan, kecintaan berlebih'],
            ['surah' => 100, 'ayat_number' => 8, 'arabic_text' => 'وَإِنَّهُ لِحُبِّ الْخَيْرِ لَشَدِيدٌ', 'translation' => 'Dan sesungguhnya cintanya kepada harta benar-benar berlebihan.', 'tags' => 'cinta harta, sifat manusia, evaluasi diri'],
            ['surah' => 76, 'ayat_number' => 8, 'arabic_text' => 'وَيُطْعِمُونَ الطَّعَامَ عَلَىٰ حُبِّهِ مِسْكِينًا وَيَتِيمًا وَأَسِيرًا', 'translation' => 'Dan mereka memberikan makanan yang disukainya kepada orang miskin, anak yatim dan orang yang ditawan,', 'tags' => 'cinta sesama, empati, keikhlasan'],
            ['surah' => 59, 'ayat_number' => 9, 'arabic_text' => 'يُحِبُّونَ مَنْ هَاجَرَ إِلَيْهِمْ وَلَا يَجِدُونَ فِي صُدُورِهِمْ حَاجَةً مِمَّا أُوتُوا', 'translation' => '...Mencintai orang yang berhijrah kepada mereka. Dan mereka tiada menaruh keinginan dalam hati mereka terhadap apa-apa yang diberikan...', 'tags' => 'cinta Anshar dan Muhajirin, ukhuwah, kepedulian'],
            ['surah' => 61, 'ayat_number' => 13, 'arabic_text' => 'وَأُخْرَىٰ تُحِبُّونَهَا ۖ نَصْرٌ مِنَ اللَّهِ وَفَتْحٌ قَرِيبٌ', 'translation' => 'Dan (ada lagi karunia lain) yang kamu sukai/cintai (yaitu) pertolongan dari Allah dan kemenangan yang dekat...', 'tags' => 'cinta pertolongan, kabar gembira, kemenangan'],
            ['surah' => 4, 'ayat_number' => 107, 'arabic_text' => 'إِنَّ اللَّهَ لَا يُحِبُّ مَنْ كَانَ خَوَّانًا أَثِيمًا', 'translation' => '...Sesungguhnya Allah tidak menyukai/mencintai orang-orang yang selalu berkhianat lagi bergelimang dosa.', 'tags' => 'tidak dicintai Allah, pengkhianatan, dosa'],
            ['surah' => 28, 'ayat_number' => 56, 'arabic_text' => 'إِنَّكَ لَا تَهْدِي مَنْ أَحْبَبْتَ وَلَٰكِنَّ اللَّهَ يَهْدِي مَنْ يَشَاءُ', 'translation' => 'Sungguh, engkau (Muhammad) tidak akan dapat memberi petunjuk kepada orang yang engkau cintai, tetapi Allah memberi petunjuk kepada orang yang Dia kehendaki...', 'tags' => 'cinta manusia, hidayah, Rasulullah'],
            ['surah' => 42, 'ayat_number' => 23, 'arabic_text' => 'قُلْ لَا أَسْأَلُكُمْ عَلَيْهِ أَجْرًا إِلَّا الْمَوَدَّةَ فِي الْقُرْبَىٰ', 'translation' => '...Katakanlah (Muhammad): Aku tidak meminta kepadamu sesuatu imbalan pun atas seruanku kecuali rasa kasih sayang dalam kekeluargaan.', 'tags' => 'cinta kerabat, mawaddah, kasih sayang'],
            ['surah' => 60, 'ayat_number' => 7, 'arabic_text' => 'عَسَى اللَّهُ أَنْ يَجْعَلَ بَيْنَكُمْ وَبَيْنَ الَّذِينَ عَادَيْتُمْ مِنْهُمْ مَوَدَّةً', 'translation' => 'Mudah-mudahan Allah menimbulkan rasa kasih sayang di antara kamu dengan orang-orang yang pernah kamu musuhi di antara mereka...', 'tags' => 'cinta, rekonsiliasi, kedamaian'],
            ['surah' => 7, 'ayat_number' => 79, 'arabic_text' => 'وَنَصَحْتُ لَكُمْ وَلَٰكِنْ لَا تُحِبُّونَ النَّاصِحِينَ', 'translation' => '...dan aku telah memberi nasihat kepadamu, tetapi kamu tidak menyukai/mencintai orang-orang yang memberi nasihat.', 'tags' => 'cinta nasihat, kebaikan, penyesalan'],
            ['surah' => 4, 'ayat_number' => 128, 'arabic_text' => 'وَالصُّلْحُ خَيْرٌ ۗ وَأُحْضِرَتِ الْأَنْفُسُ الشُّحَّ', 'translation' => '...dan perdamaian itu lebih baik (bagi suami istri), walaupun manusia itu menurut tabiatnya kikir...', 'tags' => 'cinta suami istri, perdamaian, ikatan perkawinan'],
            ['surah' => 30, 'ayat_number' => 54, 'arabic_text' => 'اللَّهُ الَّذِي خَلَقَكُمْ مِنْ ضَعْفٍ ثُمَّ جَعَلَ مِنْ بَعْدِ ضَعْفٍ قُوَّةً', 'translation' => 'Allah-lah yang menciptakan kamu dari keadaan lemah, kemudian Dia menjadikan (bagimu) sesudah keadaan lemah itu menjadi kuat...', 'tags' => 'cinta kehidupan, fase manusia, rahmat'],
            ['surah' => 2, 'ayat_number' => 216, 'arabic_text' => 'وَعَسَىٰ أَنْ تُحِبُّوا شَيْئًا وَهُوَ شَرٌّ لَكُمْ ۗ وَاللَّهُ يَعْلَمُ وَأَنْتُمْ لَا تَعْلَمُونَ', 'translation' => '...dan boleh jadi kamu menyukai sesuatu, padahal itu buruk bagimu. Allah mengetahui, sedang kamu tidak mengetahui.', 'tags' => 'perspektif cinta, takdir, hikmah Allah'],
        ];

        $hadiths = [
            ['arabic_text' => 'لاَ يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ', 'translation' => 'Tidak sempurna iman salah seorang di antara kalian hingga ia mencintai untuk saudaranya apa yang ia cintai untuk dirinya sendiri.', 'book' => 'Bukhari, Muslim', 'number' => '13, 45', 'source' => 'HR. Bukhari no. 13 & Muslim no. 45'],
            ['arabic_text' => 'لاَ يُؤْمِنُ أَحَدُكُمْ حَتَّى أَكُونَ أَحَبَّ إِلَيْهِ مِنْ وَالِدِهِ وَوَلَدِهِ وَالنَّاسِ أَجْمَعِينَ', 'translation' => 'Tidak sempurna iman salah seorang di antara kalian sampai aku (Nabi) lebih ia cintai daripada orang tuanya, anaknya, dan seluruh manusia.', 'book' => 'Bukhari, Muslim', 'number' => '15, 44', 'source' => 'HR. Bukhari no. 15 & Muslim no. 44'],
            ['arabic_text' => 'ثَلاَثٌ مَنْ كُنَّ فِيهِ وَجَدَ حَلاَوَةَ الإِيمَانِ: أَنْ يَكُونَ اللَّهُ وَرَسُولُهُ أَحَبَّ إِلَيْهِ مِمَّا سِوَاهُمَا', 'translation' => 'Tiga hal yang jika ada pada diri seseorang, ia akan merasakan manisnya iman: Allah dan Rasul-Nya lebih ia cintai dari segala sesuatu...', 'book' => 'Bukhari, Muslim', 'number' => '16, 43', 'source' => 'HR. Bukhari no. 16 & Muslim no. 43'],
            ['arabic_text' => 'وَالَّذِي نَفْسِي بِيَدِهِ لاَ تَدْخُلُوا الْجَنَّةَ حَتَّى تُؤْمِنُوا وَلاَ تُؤْمِنُوا حَتَّى تَحَابُّوا', 'translation' => 'Demi Allah yang jiwaku di tangan-Nya, kalian tidak akan masuk surga hingga kalian beriman, dan kalian tidak akan beriman hingga kalian saling mencintai.', 'book' => 'Muslim', 'number' => '54', 'source' => 'HR. Muslim no. 54'],
            ['arabic_text' => 'أَفْشُوا السَّلاَمَ بَيْنَكُمْ تَحَابُّوا', 'translation' => 'Sebarkanlah salam di antara kalian, niscaya kalian akan saling mencintai.', 'book' => 'Muslim', 'number' => '54', 'source' => 'HR. Muslim no. 54'],
            ['arabic_text' => 'مَثَلُ الْمُؤْمِنِينَ فِي تَوَادِّهِمْ وَتَرَاحُمِهِمْ وَتَعَاطُفِهِمْ مَثَلُ الْجَسَدِ الْوَاحِدِ', 'translation' => 'Perumpamaan orang-orang beriman dalam saling mencintai, menyayangi, dan mengasihi, bagaikan satu tubuh.', 'book' => 'Bukhari, Muslim', 'number' => '6011, 2586', 'source' => 'HR. Bukhari no. 6011 & Muslim no. 2586'],
            ['arabic_text' => 'أَحَبُّ النَّاسِ إِلَى اللَّهِ أَنْفَعُهُمْ لِلنَّاسِ', 'translation' => 'Manusia yang paling dicintai Allah adalah yang paling bermanfaat bagi manusia lainnya.', 'book' => 'Thabrani', 'number' => null, 'source' => 'HR. Thabrani (Al-Mu\'jam al-Awsat) no. 6192, dishahihkan Albani'],
            ['arabic_text' => 'إِذَا أَحَبَّ اللَّهُ عَبْدًا ابْتَلاَهُ، فَإِنْ صَبَرَ اجْتَبَاهُ', 'translation' => 'Apabila Allah mencintai seorang hamba, maka Dia akan mengujinya. Jika ia bersabar, Allah akan memilihnya (meninggikan derajatnya).', 'book' => 'Tirmidzi', 'number' => '2398', 'source' => 'HR. Tirmidzi no. 2398 (hasan)'],
            ['arabic_text' => 'مَنْ أَحَبَّ لِقَاءَ اللَّهِ أَحَبَّ اللَّهُ لِقَاءَهُ', 'translation' => 'Barangsiapa yang senang (cinta) bertemu dengan Allah, maka Allah pun senang (cinta) bertemu dengannya.', 'book' => 'Bukhari, Muslim', 'number' => '6507, 2685', 'source' => 'HR. Bukhari no. 6507 & Muslim no. 2685'],
            ['arabic_text' => 'ثَلاَثٌ مَنْ كُنَّ فِيهِ وَجَدَ حَلاَوَةَ الإِيمَانِ: أَنْ يَكُونَ اللَّهُ وَرَسُولُهُ أَحَبَّ إِلَيْهِ مِمَّا سِوَاهُمَا، وَأَنْ يُحِبَّ الْمَرْءَ لاَ يُحِبُّهُ إِلاَّ لِلَّهِ', 'translation' => 'Tiga hal yang jika ada pada seseorang ia akan merasakan manisnya iman: Allah dan Rasul-Nya lebih ia cintai dari segalanya, dan ia mencintai seseorang hanya karena Allah...', 'book' => 'Bukhari, Muslim', 'number' => '16, 43', 'source' => 'HR. Bukhari no. 16 & Muslim no. 43'],
            ['arabic_text' => 'لَوْ أَنَّ لِي مِثْلَ أُحُدٍ ذَهَبًا لَسَرَّنِي أَنْ لاَ تَمُرَّ عَلَيَّ ثَلاَثُ لَيَالٍ وَعِنْدِي مِنْهُ شَيْءٌ إِلاَّ شَيْءٌ أُرْصِدُهُ لِدَيْنٍ', 'translation' => 'Jika aku memiliki emas sebesar Gunung Uhud, sungguh aku gembira jika tidak ada satu malam pun berlalu melainkan sebagian darinya aku gunakan untuk melunasi utang.', 'book' => 'Bukhari', 'number' => '2389', 'source' => 'HR. Bukhari no. 2389'],
            ['arabic_text' => 'لاَ تَحَاسَدُوا وَلاَ تَبَاغَضُوا وَلاَ تَدَابَرُوا وَكُونُوا عِبَادَ اللَّهِ إِخْوَانًا', 'translation' => 'Janganlah kalian saling hasud (dengki), saling membenci, dan saling membelakangi. Jadilah hamba-hamba Allah yang bersaudara (saling mencintai).', 'book' => 'Bukhari, Muslim', 'number' => '6065, 2564', 'source' => 'HR. Bukhari no. 6065 & Muslim no. 2564'],
            ['arabic_text' => 'أَحَبُّ الأَعْمَالِ إِلَى اللَّهِ أَدْوَمُهَا وَإِنْ قَلَّ', 'translation' => 'Amalan yang paling dicintai Allah adalah yang dilakukan secara kontinu (istiqamah) meskipun sedikit.', 'book' => 'Bukhari, Muslim', 'number' => '6464, 783', 'source' => 'HR. Bukhari no. 6464 & Muslim no. 783'],
            ['arabic_text' => 'إِنَّ اللَّهَ جَمِيلٌ يُحِبُّ الْجَمَالَ', 'translation' => 'Sesungguhnya Allah itu indah (Maha Indah) dan mencintai keindahan.', 'book' => 'Muslim', 'number' => '91', 'source' => 'HR. Muslim no. 91'],
            ['arabic_text' => 'أَحِبَّ حَبِيبَكَ هَوْنًا مَا عَسَى أَنْ يَكُونَ بَغِيضَكَ يَوْمًا مَا', 'translation' => 'Cintailah kekasihmu sewajarnya saja, boleh jadi suatu hari dia akan menjadi musuhmu.', 'book' => 'Tirmidzi', 'number' => '1997', 'source' => 'HR. Tirmidzi no. 1997 (hasan)'],
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (cinta).' . PHP_EOL;
    }
}
