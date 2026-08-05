<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentTakutSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [

            ['surah' => 2, 'ayat_number' => 155, 'arabic_text' => 'وَلَنَبْلُوَنَّكُمْ بِشَيْءٍ مِنَ الْخَوْفِ وَالْجُوعِ وَنَقْصٍ مِنَ الْأَمْوَالِ وَالْأَنْفُسِ وَالثَّمَرَاتِ ۗ وَبَشِّرِ الصَّابِرِينَ', 'translation' => 'Dan Kami pasti akan menguji kamu dengan sedikit ketakutan, kelaparan, kekurangan harta, jiwa, dan buah-buahan. Dan sampaikanlah kabar gembira kepada orang-orang yang sabar.', 'tags' => 'takut, ujian hidup, musibah, sabar'],
            ['surah' => 10, 'ayat_number' => 62, 'arabic_text' => 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'translation' => 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'tags' => 'takut, wali Allah, rasa aman, kedamaian'],
            ['surah' => 2, 'ayat_number' => 38, 'arabic_text' => 'فَمَنْ تَبِعَ هُدَايَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'translation' => '...Barangsiapa mengikuti petunjuk-Ku, tidak ada rasa takut atas mereka, dan tidak (pula) mereka bersedih hati.', 'tags' => 'takut, petunjuk Allah, hidayah'],
            ['surah' => 20, 'ayat_number' => 46, 'arabic_text' => 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ', 'translation' => 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'', 'tags' => 'takut, kebersamaan Allah, perlindungan'],
            ['surah' => 20, 'ayat_number' => 67, 'arabic_text' => 'فَأَوْجَسَ فِي نَفْسِهِ خِيفَةً مُوسَىٰ', 'translation' => 'Maka Musa merasa takut dalam hatinya.', 'tags' => 'takut, Nabi Musa, emosi manusiawi'],
            ['surah' => 20, 'ayat_number' => 68, 'arabic_text' => 'قُلْنَا لَا تَخَفْ إِنَّكَ أَنْتَ الْأَعْلَىٰ', 'translation' => 'Kami berfirman: \'Jangan takut! Sungguh, engkaulah yang unggul (menang).\'', 'tags' => 'takut, penguat hati, pertolongan'],
            ['surah' => 28, 'ayat_number' => 18, 'arabic_text' => 'فَأَصْبَحَ فِي الْمَدِينَةِ خَائِفًا يَتَرَقَّبُ', 'translation' => 'Karena itu, dia (Musa) menjadi merasa takut di kota itu seraya waspada...', 'tags' => 'takut, kewaspadaan, Nabi Musa'],
            ['surah' => 28, 'ayat_number' => 21, 'arabic_text' => 'فَخَرَجَ مِنْهَا خَائِفًا يَتَرَقَّبُ ۖ قَالَ رَبِّ نَجِّنِي مِنَ الْقَوْمِ الظَّالِمِينَ', 'translation' => 'Maka dia (Musa) lari meninggalkan kota itu dengan rasa takut dan waspada, seraya berdoa: \'Ya Tuhanku, selamatkanlah aku dari orang-orang yang zalim.\'', 'tags' => 'takut, doa keselamatan, Nabi Musa'],
            ['surah' => 28, 'ayat_number' => 25, 'arabic_text' => 'فَلَمَّا جَاءَهُ وَقَصَّ عَلَيْهِ الْقَصَصَ قَالَ لَا تَخَفْ ۖ نَجَوْتَ مِنَ الْقَوْمِ الظَّالِمِينَ', 'translation' => '...Maka ketika dia (Musa) mendatangi ayahnya (Syuaib) dan menceritakan kepadanya kisah tentang dirinya, dia berkata: \'Janganlah engkau takut! Engkau telah selamat dari orang-orang yang zalim itu.\'', 'tags' => 'takut, penenteram jiwa, keselamatan'],
            ['surah' => 28, 'ayat_number' => 31, 'arabic_text' => 'يَا مُوسَىٰ أَقْبِلْ وَلَا تَخَفْ ۖ إِنَّكَ مِنَ الْآمِنِينَ', 'translation' => '(Dia difirmankan): \'Wahai Musa! Kemarilah dan janganlah takut. Sesungguhnya engkau termasuk orang-orang yang aman.\'', 'tags' => 'takut, rasa aman, pertolongan'],
            ['surah' => 28, 'ayat_number' => 7, 'arabic_text' => 'وَلَا تَخَافِي وَلَا تَحْزَنِي ۖ إِنَّا رَادُّوهُ إِلَيْكِ وَجَاعِلُوهُ مِنَ الْمُرْسَلِينَ', 'translation' => '...Dan janganlah engkau takut dan janganlah (pula) bersedih hati, karena sesungguhnya Kami akan mengembalikannya kepadamu...', 'tags' => 'takut, ibu Musa, janji Allah'],
            ['surah' => 106, 'ayat_number' => 4, 'arabic_text' => 'الَّذِي أَطْعَمَهُمْ مِنْ جُوعٍ وَآمَنَهُمْ مِنْ خَوْفٍ', 'translation' => 'Yang telah memberi makanan kepada mereka untuk menghilangkan lapar dan mengamankan mereka dari rasa takut.', 'tags' => 'takut, rasa aman, nikmat Allah'],
            ['surah' => 3, 'ayat_number' => 173, 'arabic_text' => 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', 'translation' => '(Yaitu) orang-orang yang ketika ada orang-orang mengatakan: \'Sesungguhnya orang-orang telah mengumpulkan pasukan untuk menyerang kamu, karena itu takutlah kepada mereka,\' ternyata ucapan itu menambah iman mereka dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami...\'', 'tags' => 'takut, ancaman musuh, tawakal'],
            ['surah' => 3, 'ayat_number' => 175, 'arabic_text' => 'إِنَّمَا ذَٰلِكُمُ الشَّيْطَانُ يُخَوِّفُ أَوْلِيَاءَهُ فَلَا تَخَافُوهُمْ وَخَافُونِ إِنْ كُنْتُمْ مُؤْمِنِينَ', 'translation' => 'Sesungguhnya mereka itu hanyalah setan yang menakut-nakuti kamu dengan teman-teman setianya, karena itu janganlah kamu takut kepada mereka, tetapi takutlah kepada-Ku, jika kamu orang-orang beriman.', 'tags' => 'takut, godaan setan, takut kepada Allah'],
            ['surah' => 33, 'ayat_number' => 10, 'arabic_text' => 'إِذْ جَاءُوكُمْ مِنْ فَوْقِكُمْ وَمِنْ أَسْفَلَ مِنْكُمْ وَإِذْ زَاغَتِ الْأَبْصَارُ وَبَلَغَتِ الْقُلُوبُ الْحَنَاجِرَ', 'translation' => 'Ketika mereka datang kepadamu dari atas dan dari bawahmu, dan ketika penglihatanmu terpana dan hatimu menyesak sampai ke tenggorokan (sangat takut)...', 'tags' => 'takut, kepanikan, perang ahzab'],

            ['surah' => 33, 'ayat_number' => 39, 'arabic_text' => 'الَّذِينَ يُبَلِّغُونَ رِسَالَاتِ اللَّهِ وَيَخْشَوْنَهُ وَلَا يَخْشَوْنَ أَحَدًا إِلَّا اللَّهَ', 'translation' => '(yaitu) orang-orang yang menyampaikan risalah-risalah Allah, mereka takut kepada-Nya dan tidak merasa takut kepada siapa pun selain kepada Allah...', 'tags' => 'takut, keteguhan, khasyyah'],
            ['surah' => 35, 'ayat_number' => 28, 'arabic_text' => 'إِنَّمَا يَخْشَى اللَّهَ مِنْ عِبَادِهِ الْعُلَمَاءُ', 'translation' => '...Di antara hamba-hamba Allah yang takut kepada-Nya, hanyalah para ulama (orang-orang yang berilmu)...', 'tags' => 'takut, khasyyah, ilmu'],
            ['surah' => 13, 'ayat_number' => 21, 'arabic_text' => 'وَالَّذِينَ يَصِلُونَ مَا أَمَرَ اللَّهُ بِهِ أَنْ يُوصَلَ وَيَخْشَوْنَ رَبَّهُمْ وَيَخَافُونَ سُوءَ الْحِسَابِ', 'translation' => 'dan orang-orang yang menghubungkan apa yang diperintahkan Allah agar dihubungkan, dan mereka takut kepada Tuhannya serta takut kepada hisab yang buruk.', 'tags' => 'takut, silaturahmi, hari hisab'],
            ['surah' => 39, 'ayat_number' => 23, 'arabic_text' => 'تَقْشَعِرُّ مِنْهُ جُلُودُ الَّذِينَ يَخْشَوْنَ رَبَّهُمْ ثُمَّ تَلِينُ جُلُودُهُمْ وَقُلُوبُهُمْ إِلَىٰ ذِكْرِ اللَّهِ', 'translation' => '...gemetar karenanya kulit orang-orang yang takut kepada Tuhannya, kemudian menjadi tenang kulit dan hati mereka ketika mengingat Allah...', 'tags' => 'takut, Al-Qur\'an, ketenangan zikir'],
            ['surah' => 21, 'ayat_number' => 49, 'arabic_text' => 'الَّذِينَ يَخْشَوْنَ رَبَّهُمْ بِالْغَيْبِ وَهُمْ مِنَ السَّاعَةِ مُشْفِقُونَ', 'translation' => '(yaitu) orang-orang yang takut kepada Tuhannya (yang tidak terlihat oleh) mereka, dan mereka merasa takut akan tibanya hari kiamat.', 'tags' => 'takut, keimanan ghaib, hari kiamat'],
            ['surah' => 67, 'ayat_number' => 12, 'arabic_text' => 'إِنَّ الَّذِينَ يَخْشَوْنَ رَبَّهُمْ بِالْغَيْبِ لَهُمْ مَغْفِرَةٌ وَأَجْرٌ كَبِيرٌ', 'translation' => 'Sesungguhnya orang-orang yang takut kepada Tuhannya yang tidak terlihat oleh mereka, mereka memperoleh ampunan dan pahala yang besar.', 'tags' => 'takut, ampunan, pahala'],
            ['surah' => 50, 'ayat_number' => 33, 'arabic_text' => 'مَنْ خَشِيَ الرَّحْمَٰنَ بِالْغَيْبِ وَجَاءَ بِقَلْبٍ مُنِيبٍ', 'translation' => '(Yaitu) orang yang takut kepada Tuhan Yang Maha Pengasih tanpa melihat-Nya dan dia datang dengan hati yang bertobat,', 'tags' => 'takut, taubat, hati munib'],
            ['surah' => 79, 'ayat_number' => 40, 'arabic_text' => 'وَأَمَّا مَنْ خَافَ مَقَامَ رَبِّهِ وَنَهَى النَّفْسَ عَنِ الْهَوَىٰ', 'translation' => 'Dan adapun orang-orang yang takut kepada kebesaran Tuhannya dan menahan diri dari (keinginan) hawa nafsunya,', 'tags' => 'takut, hawa nafsu, kontrol diri'],
            ['surah' => 79, 'ayat_number' => 41, 'arabic_text' => 'فَإِنَّ الْجَنَّةَ هِيَ الْمَأْوَىٰ', 'translation' => 'maka sungguh, surgalah tempat tinggal(nya).', 'tags' => 'takut, surga, balasan'],
            ['surah' => 55, 'ayat_number' => 46, 'arabic_text' => 'وَلِمَنْ خَافَ مَقَامَ رَبِّهِ جَنَّتَانِ', 'translation' => 'Dan bagi orang yang takut akan saat menghadap Tuhannya ada dua surga.', 'tags' => 'takut, surga, keagungan Allah'],
            ['surah' => 14, 'ayat_number' => 14, 'arabic_text' => 'ذَٰلِكَ لِمَنْ خَافَ مَقَامِي وَخَافَ وَعِيدِ', 'translation' => '...Yang demikian itu (adalah untuk) orang-orang yang takut akan menghadap kepada-Ku dan takut akan ancaman-Ku.', 'tags' => 'takut, ancaman Allah, akhirat'],
            ['surah' => 76, 'ayat_number' => 10, 'arabic_text' => 'إِنَّا نَخَافُ مِنْ رَبِّنَا يَوْمًا عَبُوسًا قَمْطَرِيرًا', 'translation' => 'Sungguh, kami takut akan (azab) Tuhan kami pada hari ketika orang-orang bermuka masam penuh kesulitan.', 'tags' => 'takut, hari kiamat, azab'],
            ['surah' => 76, 'ayat_number' => 11, 'arabic_text' => 'فَوَقَاهُمُ اللَّهُ شَرَّ ذَٰلِكَ الْيَوْمِ وَلَقَّاهُمْ نَضْرَةً وَسُرُورًا', 'translation' => 'Maka Allah melindungi mereka dari kesusahan hari itu, dan memberikan kepada mereka kecerahan (wajah) dan kegembiraan hati.', 'tags' => 'takut, perlindungan Allah, kebahagiaan'],
            ['surah' => 24, 'ayat_number' => 37, 'arabic_text' => 'يَخَافُونَ يَوْمًا تَتَقَلَّبُ فِيهِ الْقُلُوبُ وَالْأَبْصَارُ', 'translation' => '...mereka takut pada suatu hari yang (pada hari itu) hati dan penglihatan menjadi guncang (kiamat).', 'tags' => 'takut, kiamat, ibadah'],
            ['surah' => 32, 'ayat_number' => 16, 'arabic_text' => 'تَتَجَافَىٰ جُنُوبُهُمْ عَنِ الْمَضَاجِعِ يَدْعُونَ رَبَّهُمْ خَوْفًا وَطَمَعًا', 'translation' => 'Lambung mereka jauh dari tempat tidurnya, mereka berdoa kepada Tuhannya dengan rasa takut dan penuh harapan...', 'tags' => 'takut, harapan, tahajud'],

            ['surah' => 7, 'ayat_number' => 56, 'arabic_text' => 'وَادْعُوهُ خَوْفًا وَطَمَعًا ۚ إِنَّ رَحْمَتَ اللَّهِ قَرِيبٌ مِنَ الْمُحْسِنِينَ', 'translation' => '...dan berdoalah kepada-Nya dengan rasa takut dan harapan. Sesungguhnya rahmat Allah sangat dekat kepada orang-orang yang berbuat baik.', 'tags' => 'takut, doa, rahmat Allah'],
            ['surah' => 21, 'ayat_number' => 90, 'arabic_text' => 'إِنَّهُمْ كَانُوا يُسَارِعُونَ فِي الْخَيْرَاتِ وَيَدْعُونَنَا رَغَبًا وَرَهَبًا', 'translation' => '...Sungguh, mereka selalu bersegera dalam (mengerjakan) kebaikan-kebaikan, dan mereka berdoa kepada Kami dengan penuh harapan dan rasa takut...', 'tags' => 'takut, rahba, motivasi kebaikan'],
            ['surah' => 59, 'ayat_number' => 13, 'arabic_text' => 'لَأَنْتُمْ أَشَدُّ رَهْبَةً فِي صُدُورِهِمْ مِنَ اللَّهِ', 'translation' => 'Sesungguhnya dalam dada mereka, kamu (orang Islam) lebih ditakuti daripada Allah...', 'tags' => 'takut, pemahaman salah, kemunafikan'],
            ['surah' => 41, 'ayat_number' => 30, 'arabic_text' => 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'translation' => 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'tags' => 'takut, istiqamah, kabar malaikat'],
            ['surah' => 16, 'ayat_number' => 112, 'arabic_text' => 'فَأَذَاقَهَا اللَّهُ لِبَاسَ الْجُوعِ وَالْخَوْفِ بِمَا كَانُوا يَصْنَعُونَ', 'translation' => '...maka Allah menimpa kepada mereka bencana kelaparan dan ketakutan, disebabkan apa yang mereka perbuat.', 'tags' => 'takut, kufur nikmat, balasan'],
        ];

        $hadiths = [
            ['arabic_text' => 'اللَّهُمَّ اسْتُرْ عَوْرَاتِي وَآمِنْ رَوْعَاتِي', 'translation' => 'Ya Allah, tutupilah auratku (kekuranganku) dan amankanlah aku dari rasa takut/kecemasan.', 'book' => 'Abu Dawud, Ibnu Majah', 'number' => '5074', 'source' => 'HR. Abu Dawud no. 5074 & Ibn Majah'],
            ['arabic_text' => 'لاَ يَمُوتَنَّ أَحَدُكُمْ إِلاَّ وَهُوَ يُحْسِنُ الظَّنَّ بِاللَّهِ عَزَّ وَجَلَّ', 'translation' => 'Janganlah sekali-kali salah seorang di antara kalian meninggal dunia melainkan dalam keadaan berprasangka baik kepada Allah (menghilangkan takut yang berlebih).', 'book' => 'Muslim', 'number' => '2877', 'source' => 'HR. Muslim no. 2877'],
            ['arabic_text' => 'رَجُلٌ ذَكَرَ اللَّهَ خَالِيًا فَفَاضَتْ عَيْنَاهُ', 'translation' => '...(Termasuk 7 golongan yang dinaungi Allah) yaitu seseorang yang mengingat Allah dalam keadaan sunyi lalu kedua matanya meneteskan air mata (karena takut).', 'book' => 'Bukhari, Muslim', 'number' => '660, 1031', 'source' => 'HR. Bukhari no. 660 & Muslim no. 1031'],
            ['arabic_text' => 'عَيْنَانِ لاَ تَمَسُّهُمَا النَّارُ: عَيْنٌ بَكَتْ مِنْ خَشْيَةِ اللَّهِ...', 'translation' => 'Dua mata yang tidak akan tersentuh api neraka: mata yang menangis karena takut kepada Allah dan mata yang berjaga di jalan Allah.', 'book' => 'Tirmidzi', 'number' => '1639', 'source' => 'HR. Tirmidzi no. 1639'],
            ['arabic_text' => 'لاَ يَلِجُ النَّارَ رَجُلٌ بَكَى مِنْ خَشْيَةِ اللَّهِ حَتَّى يَعُودَ اللَّبَنُ فِي الثَّدْيِ', 'translation' => 'Tidak akan masuk neraka seseorang yang menangis karena takut kepada Allah hingga air susu kembali ke dalam teteknya...', 'book' => 'Tirmidzi, An-Nasa\'i', 'number' => '1633', 'source' => 'HR. Tirmidzi no. 1633 & An-Nasa\'i'],
            ['arabic_text' => 'لَوْ تَعْلَمُونَ مَا أَعْلَمُ لَضَحِكْتُمْ قَلِيلاً وَلَبَكَيْتُمْ كَثِيرًا', 'translation' => 'Seandainya kalian mengetahui apa yang aku ketahui, niscaya kalian akan sedikit tertawa dan banyak menangis (karena takut kepada Allah).', 'book' => 'Bukhari, Muslim', 'number' => '6485, 2359', 'source' => 'HR. Bukhari no. 6485 & Muslim no. 2359'],
            ['arabic_text' => 'نُصِرْتُ بِالرُّعْبِ مَسِيرَةَ شَهْرٍ', 'translation' => 'Aku ditolong oleh Allah dengan ditanamkannya rasa takut (ke dalam hati musuh) dari jarak perjalanan satu bulan.', 'book' => 'Bukhari, Muslim', 'number' => '335, 521', 'source' => 'HR. Bukhari no. 335 & Muslim no. 521'],
            ['arabic_text' => 'وَعِزَّتِي لاَ أَجْمَعُ عَلَى عَبْدِي خَوْفَيْنِ وَلاَ أَجْمَعُ لَهُ أَمْنَيْنِ', 'translation' => '(Allah berfirman): Demi kemuliaan-Ku, Aku tidak akan menggabungkan dua rasa takut dan dua rasa aman pada hamba-Ku. Jika ia takut kepada-Ku di dunia, Aku amankan dia di akhirat...', 'book' => 'Ibn Hibban, Al-Bazzar', 'number' => null, 'source' => 'HR. Ibn Hibban & Al-Bazzar'],
            ['arabic_text' => 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْجُبْنِ', 'translation' => 'Ya Allah, aku berlindung kepada-Mu dari sifat penakut.', 'book' => 'Bukhari', 'number' => '2822', 'source' => 'HR. Bukhari no. 2822'],
            ['arabic_text' => 'اللَّهُمَّ اقْسِمْ لَنَا مِنْ خَشْيَتِكَ مَا تَحُولُ بِهِ بَيْنَنَا وَبَيْنَ مَعَاصِيكَ', 'translation' => 'Ya Allah, bagikanlah untuk kami rasa takut kepada-Mu yang dapat menghalangi kami dari berbuat maksiat kepada-Mu...', 'book' => 'Tirmidzi', 'number' => '3502', 'source' => 'HR. Tirmidzi no. 3502'],
            ['arabic_text' => 'مَنْ خَافَ أَدْلَجَ وَمَنْ أَدْلَجَ بَلَغَ الْمَنْزِلَ أَلَا إِنَّ سِلْعَةَ اللَّهِ غَالِيَةٌ أَلَا إِنَّ سِلْعَةَ اللَّهِ الْجَنَّةُ', 'translation' => 'Barangsiapa yang takut (terlambat), ia akan berjalan di awal malam. Dan barangsiapa berjalan awal malam, ia akan sampai ke tujuan. Ingatlah, barang dagangan Allah itu mahal, ingatlah bahwa barang dagangan Allah adalah surga.', 'book' => 'Tirmidzi', 'number' => '2450', 'source' => 'HR. Tirmidzi no. 2450'],
            ['arabic_text' => 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ غَضَبِهِ وَعِقَابِهِ وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ', 'translation' => 'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari murka-Nya, siksa-Nya, kejahatan hamba-hamba-Nya, dan bisikan setan.', 'book' => 'Tirmidzi, Abu Dawud', 'number' => '3528', 'source' => 'HR. Tirmidzi no. 3528 & Abu Dawud'],
            ['arabic_text' => 'إِنِّي أَرَى مَا لاَ تَرَوْنَ وَأَسْمَعُ مَا لاَ تَسْمَعُونَ أَطَّتِ السَّمَاءُ... وَاللَّهِ لَوْ تَعْلَمُونَ مَا أَعْلَمُ...', 'translation' => 'Aku melihat apa yang tidak kalian lihat dan mendengar apa yang tidak kalian dengar. Langit merintih... Demi Allah, seandainya kalian tahu apa yang aku tahu...', 'book' => 'Tirmidzi', 'number' => '2312', 'source' => 'HR. Tirmidzi no. 2312'],
            ['arabic_text' => 'إِذَا خَافَ الْقَوْمَ قَالَ: اللَّهُمَّ إِنَّا نَجْعَلُكَ فِي نُحُورِهِمْ وَنَعُوذُ بِكَ مِنْ شُرُورِهِمْ', 'translation' => 'Nabi SAW apabila takut kepada suatu kaum/kelompok, beliau berdoa: \'Ya Allah, sesungguhnya kami menjadikan Engkau di leher-leher mereka dan kami berlindung kepada-Mu dari kejahatan mereka.\'', 'book' => 'Abu Dawud', 'number' => '1537', 'source' => 'HR. Abu Dawud no. 1537'],
            ['arabic_text' => 'الْمُؤْمِنُ بَيْنَ مَخَافَتَيْنِ: بَيْنَ أَجَلٍ قَدْ مَضَى لاَ يَدْرِي مَا اللَّهُ صَانِعٌ فِيهِ وَبَيْنَ أَجَلٍ قَدْ بَقِيَ...', 'translation' => 'Seorang mukmin itu berada di antara dua rasa takut: antara ajal yang telah lalu yang ia tidak tahu apa yang Allah lakukan padanya, dan antara ajal yang tersisa...', 'book' => 'Baihaqi', 'number' => null, 'source' => 'HR. Baihaqi (Shu\'ab al-Iman)'],
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (takut).' . PHP_EOL;
    }
}
