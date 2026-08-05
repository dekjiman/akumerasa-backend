<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentStresSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [

            ['surah' => 94, 'ayat_number' => 1, 'arabic_text' => 'أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ', 'translation' => 'Bukankah Kami telah melapangkan dadamu (Muhammad)?', 'tags' => 'stres, kelapangan dada, penenang jiwa'],
            ['surah' => 94, 'ayat_number' => 2, 'arabic_text' => 'وَوَضَعْنَا عَنْكَ وِزْرَكَ', 'translation' => 'dan Kami pun telah melepaskan bebanmu darimu,', 'tags' => 'stres, beban berat, pelepasan beban'],
            ['surah' => 94, 'ayat_number' => 3, 'arabic_text' => 'الَّذِي أَنْقَضَ ظَهْرَكَ', 'translation' => 'yang memberatkan punggungmu,', 'tags' => 'stres, tekanan hidup, beban berat'],
            ['surah' => 94, 'ayat_number' => 5, 'arabic_text' => 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'translation' => 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'tags' => 'stres, kemudahan, optimisme'],
            ['surah' => 94, 'ayat_number' => 6, 'arabic_text' => 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'translation' => 'Sesungguhnya bersama kesulitan ada kemudahan.', 'tags' => 'stres, janji Allah, kelapangan'],
            ['surah' => 15, 'ayat_number' => 97, 'arabic_text' => 'وَلَقَدْ نَعْلَمُ أَنَّكَ يَضِيقُ صَدْرُكَ بِمَا يَقُولُونَ', 'translation' => 'Dan sungguh, Kami mengetahui bahwa dadamu menjadi sempit (tertekan/stres) disebabkan apa yang mereka katakan.', 'tags' => 'stres, tekanan batin, penyempitan dada'],
            ['surah' => 15, 'ayat_number' => 98, 'arabic_text' => 'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَكُنْ مِنَ السَّاجِدِينَ', 'translation' => 'Maka bertasbihlah dengan memuji Tuhanmu dan jadilah engkau di antara orang-orang yang bersujud.', 'tags' => 'stres, solusi stres, tasbih dan sujud'],
            ['surah' => 20, 'ayat_number' => 25, 'arabic_text' => 'قَالَ رَبِّ اشْرَحْ لِي صَدْرِي', 'translation' => 'Dia (Musa) berkata: \'Ya Tuhanku, lapangkanlah dadaku,\'', 'tags' => 'stres, kelapangan dada, doa Nabi Musa'],
            ['surah' => 20, 'ayat_number' => 26, 'arabic_text' => 'وَيَسِّرْ لِي أَمْرِي', 'translation' => 'dan mudahkanlah untukku urusanku,', 'tags' => 'stres, kemudahan urusan, doa'],
            ['surah' => 2, 'ayat_number' => 286, 'arabic_text' => 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا', 'translation' => 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.', 'tags' => 'stres, beban hidup, batas kemampuan'],
            ['surah' => 2, 'ayat_number' => 286, 'arabic_text' => 'رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ', 'translation' => '...Ya Tuhan kami, janganlah Engkau pikulkan kepada kami apa yang tidak sanggup kami memikulnya...', 'tags' => 'stres, doa pembebas beban, batas kemampuan'],
            ['surah' => 13, 'ayat_number' => 28, 'arabic_text' => 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', 'translation' => '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'tags' => 'stres, zikir, penenang batin'],
            ['surah' => 90, 'ayat_number' => 4, 'arabic_text' => 'لَقَدْ خَلَقْنَا الْإِنْسَانَ فِي كَبَدٍ', 'translation' => 'Sungguh, Kami telah menciptakan manusia berada dalam susah payah.', 'tags' => 'stres, hakikat hidup, susah payah'],
            ['surah' => 65, 'ayat_number' => 2, 'arabic_text' => 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', 'translation' => '...Barangsiapa bertakwa kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'tags' => 'stres, jalan keluar, takwa'],
            ['surah' => 65, 'ayat_number' => 3, 'arabic_text' => 'وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', 'translation' => '...Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya...', 'tags' => 'stres, tawakal, kecukupan'],

            ['surah' => 65, 'ayat_number' => 7, 'arabic_text' => 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا مَا آتَاهَا ۚ سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', 'translation' => '...Allah tidak membebani seseorang melainkan sesuai dengan apa yang diberikan Allah kepadanya. Allah kelak akan memberikan kelapangan setelah kesempitan.', 'tags' => 'stres, kelapangan, kesempitan'],
            ['surah' => 2, 'ayat_number' => 153, 'arabic_text' => 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', 'translation' => 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.', 'tags' => 'stres, pertolongan, sabar dan salat'],
            ['surah' => 21, 'ayat_number' => 87, 'arabic_text' => 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'translation' => 'Maka dia (Yunus) berdoa dalam kegelapan: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'tags' => 'stres, terdesak, Nabi Yunus, doa'],
            ['surah' => 21, 'ayat_number' => 88, 'arabic_text' => 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ', 'translation' => 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita/kesesakan batin. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.', 'tags' => 'stres, duka cita, penyelamatan'],
            ['surah' => 12, 'ayat_number' => 86, 'arabic_text' => 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ', 'translation' => 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku...\'', 'tags' => 'stres, curhat kepada Allah, Nabi Yakub'],
            ['surah' => 93, 'ayat_number' => 3, 'arabic_text' => 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'translation' => 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'tags' => 'stres, penguat batin, kasih sayang Allah'],
            ['surah' => 93, 'ayat_number' => 4, 'arabic_text' => 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ', 'translation' => 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.', 'tags' => 'stres, perspektif masa depan, harapan'],
            ['surah' => 93, 'ayat_number' => 5, 'arabic_text' => 'وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ', 'translation' => 'Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas.', 'tags' => 'stres, kepuasan batin, janji Allah'],
            ['surah' => 33, 'ayat_number' => 10, 'arabic_text' => 'إِذْ جَاءُوكُمْ مِنْ فَوْقِكُمْ وَمِنْ أَسْفَلَ مِنْكُمْ وَإِذْ زَاغَتِ الْأَبْصَارُ وَبَلَغَتِ الْقُلُوبُ الْحَنَاجِرَ', 'translation' => 'Ketika mereka datang kepadamu dari atas dan dari bawahmu, dan ketika penglihatanmu terpana dan hatimu menyesak sampai ke tenggorokan (sangat stres/panik)...', 'tags' => 'stres, kepanikan, perang ahzab'],
            ['surah' => 3, 'ayat_number' => 173, 'arabic_text' => 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', 'translation' => '...ternyata ucapan itu menambah iman mereka dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'', 'tags' => 'stres, tekanan publik, tawakal'],
            ['surah' => 16, 'ayat_number' => 127, 'arabic_text' => 'وَاصْبِرْ وَمَا صَبْرُكَ إِلَّا بِاللَّهِ ۚ وَلَا تَحْزَنْ عَلَيْهِمْ وَلَا تَكُ فِي ضَيْقٍ مِمَّا يَمْكُرُونَ', 'translation' => 'Bersabarlah (hai Muhammad) dan tiadalah kesabaranmu itu melainkan dengan pertolongan Allah dan janganlah kamu bersedih hati terhadap mereka dan jangan (pula) kamu bersempit dada (stres) terhadap apa yang mereka reka-dekakan.', 'tags' => 'stres, kesabaran, berlapang dada'],
            ['surah' => 28, 'ayat_number' => 10, 'arabic_text' => 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا', 'translation' => 'Dan hati ibu Musa menjadi kosong (hampa/stres berat). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya...', 'tags' => 'stres, kehampaan batin, keteguhan'],
            ['surah' => 26, 'ayat_number' => 61, 'arabic_text' => 'فَلَمَّا تَرَاءَى الْجَمْعَانِ قَالَ أَصْحَابُ مُوسَىٰ إِنَّا لَمُدْرَكُونَ', 'translation' => 'Maka ketika kedua golongan itu saling melihat, berkatalah pengikut-pengikut Musa: \'Kita benar-benar akan tersusul!\'', 'tags' => 'stres, kebuntuan, kepanikan'],
            ['surah' => 26, 'ayat_number' => 62, 'arabic_text' => 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'translation' => 'Dia (Musa) menjawab: \'Sekali-kali tidak akan tersusul! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'tags' => 'stres, keyakinan, pertolongan Allah'],
            ['surah' => 10, 'ayat_number' => 57, 'arabic_text' => 'يَا أَيُّهَا النَّاسُ قَدْ جَاءَتْكُمْ مَوْعِظَةٌ مِنْ رَبِّكُمْ وَشِفَاءٌ لِمَا فِي الصُّدُورِ', 'translation' => 'Wahai manusia! Sungguh, telah datang kepadamu pelajaran (Al-Qur\'an) dari Tuhanmu, dan penyembuh bagi penyakit yang ada dalam dada...', 'tags' => 'stres, syifa, obat hati, Al-Qur\'an'],

            ['surah' => 17, 'ayat_number' => 82, 'arabic_text' => 'وَنُنَزِّلُ مِنَ الْقُرْآنِ مَا هُوَ شِفَاءٌ وَرَحْمَةٌ لِلْمُؤْمِنِينَ', 'translation' => 'Dan Kami turunkan dari Al-Qur\'an suatu yang menjadi penawar/penyembuh dan rahmat bagi orang-orang yang beriman...', 'tags' => 'stres, obat mental, rahmat'],
            ['surah' => 6, 'ayat_number' => 125, 'arabic_text' => 'فَمَنْ يُرِدِ اللَّهُ أَنْ يَهْدِيَهُ يَشْرَحْ صَدْرَهُ لِلْإِسْلَامِ', 'translation' => 'Barangsiapa dikehendaki Allah akan mendapat petunjuk, Dia akan melapangkan dadanya untuk (menerima) Islam...', 'tags' => 'stres, kelapangan dada, hidayah'],
            ['surah' => 39, 'ayat_number' => 22, 'arabic_text' => 'أَفَمَنْ شَرَحَ اللَّهُ صَدْرَهُ لِلْإِسْلَامِ فَهُوَ عَلَىٰ نُورٍ مِنْ رَبِّهِ', 'translation' => 'Maka apakah orang-orang yang dibukakan hatinya oleh Allah untuk (menerima) agama Islam lalu ia mendapat cahaya dari Tuhannya (sama dengan orang yang hatinya membatu)?', 'tags' => 'stres, pencerahan, ketenangan'],
            ['surah' => 41, 'ayat_number' => 30, 'arabic_text' => 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'translation' => 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'tags' => 'stres, ketenangan malaikat, istiqamah'],
            ['surah' => 48, 'ayat_number' => 4, 'arabic_text' => 'هُوَ الَّذِي أَنْزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا مَعَ إِيمَانِهِمْ', 'translation' => 'Dialah yang telah menurunkan ketenangan (sakinah) ke dalam hati orang-orang mukmin untuk menambah iman atas iman mereka...', 'tags' => 'stres, penawar gelisah, sakinah'],
        ];

        $hadiths = [
            ['arabic_text' => 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ وَالْبُخْلِ وَالْجُبْنِ وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ', 'translation' => 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas (stres masa depan), sedih, lemah, malas, kikir, penakut, beban utang, dan penguasaan/tekanan orang lain.', 'book' => 'Bukhari', 'number' => '6369', 'source' => 'HR. Bukhari no. 6369'],
            ['arabic_text' => 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'translation' => 'Tidaklah seorang muslim tertimpa suatu keletihan, penyakit, kecemasan (stres), kesedihan, gangguan, maupun duka cita melainkan Allah akan menghapus dosa-dosanya karenanya.', 'book' => 'Bukhari, Muslim', 'number' => '5641, 2573', 'source' => 'HR. Bukhari no. 5641 & Muslim no. 2573'],
            ['arabic_text' => 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ', 'translation' => 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku. Tiada tuhan selain Engkau.', 'book' => 'Abu Dawud', 'number' => '5090', 'source' => 'HR. Abu Dawud no. 5090'],
            ['arabic_text' => 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا', 'translation' => 'Tidaklah seseorang tertimpa duka cita/stres lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan kecemasannya dan menggantikannya dengan kelapangan.', 'book' => 'Ahmad, Ibn Hibban', 'number' => '3712', 'source' => 'HR. Ahmad no. 3712 & Ibn Hibban'],
            ['arabic_text' => 'كَانَ النَّبِيُّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ إِذَا حَزَبَهُ أَمْرٌ صَلَّى', 'translation' => 'Nabi SAW apabila ditimpa suatu masalah yang merisaukan/memberatkan (stres), beliau bergegas mendirikan salat.', 'book' => 'Abu Dawud', 'number' => '1319', 'source' => 'HR. Abu Dawud no. 1319'],
            ['arabic_text' => 'أَرِحْنَا بِهَا يَا بِلاَلُ', 'translation' => 'Istirahatkanlah kami (buatlah kami tenang dari stres) dengan salat, wahai Bilal!', 'book' => 'Abu Dawud', 'number' => '4985', 'source' => 'HR. Abu Dawud no. 4985'],
            ['arabic_text' => 'لاَ إِلَهَ إِلاَّ اللهُ الْعَظِيْمُ الْحَلِيْمُ، لاَ إِلَهَ إِلاَّ اللهُ رَبُّ الْعَرْشِ الْعَظِيْمِ', 'translation' => 'Tiada tuhan selain Allah Yang Maha Agung lagi Maha Penyantun. Tiada tuhan selain Allah, Rabb \'Arsy yang agung. (Doa Rasulullah saat menghadapi kesulitan/tekanan berat).', 'book' => 'Bukhari, Muslim', 'number' => '6345, 2730', 'source' => 'HR. Bukhari no. 6345 & Muslim no. 2730'],
            ['arabic_text' => 'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ', 'translation' => 'Wahai Yang Mahahidup, Wahai Yang Maha Berdiri Sendiri, dengan rahmat-Mu aku memohon pertolongan.', 'book' => 'Tirmidzi', 'number' => '3524', 'source' => 'HR. Tirmidzi no. 3524'],
            ['arabic_text' => 'اللهُ اللهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا', 'translation' => 'Allah, Allah adalah Tuhanku, aku tidak mempersekutukan-Nya dengan sesuatu apa pun. (Dibaca saat mengalami tekanan jiwa/stres).', 'book' => 'Abu Dawud', 'number' => '1525', 'source' => 'HR. Abu Dawud no. 1525'],
            ['arabic_text' => 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا', 'translation' => 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.', 'book' => 'Ahmad', 'number' => '2803', 'source' => 'HR. Ahmad no. 2803'],
            ['arabic_text' => 'مَنْ لَزِمَ الاِسْتِغْفَارَ جَعَلَ اللَّهُ لَهُ مِنْ كُلِّ ضِيقٍ مَخْرَجًا وَمِنْ كُلِّ هَمٍّ فَرَجًا', 'translation' => 'Barangsiapa merutinkan istighfar, niscaya Allah jadikan baginya jalan keluar dari setiap kesempitan dan kelapangan dari setiap duka cita/stres.', 'book' => 'Abu Dawud', 'number' => '1518', 'source' => 'HR. Abu Dawud no. 1518'],
            ['arabic_text' => 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'translation' => 'Sungguh menakjubkan urusan seorang mukmin... jika ditimpa kesusahan/tekanan dia bersabar, dan itu baik baginya.', 'book' => 'Muslim', 'number' => '2999', 'source' => 'HR. Muslim no. 2999'],
            ['arabic_text' => 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ', 'translation' => 'Sesungguhnya besarnya balasan (pahala) itu sebanding dengan besarnya ujian/penderitaan.', 'book' => 'Tirmidzi', 'number' => '2396', 'source' => 'HR. Tirmidzi no. 2396'],
            ['arabic_text' => 'إِنَّ لِرَبِّكَ عَلَيْكَ حَقًّا، وَلِنَفْسِكَ عَلَيْكَ حَقًّا', 'translation' => '...Sesungguhnya Rabbmu memiliki hak atasmu, dan dirimu (kesehatan mental & fisikmu) memiliki hak atasmu. Maka berikanlah haknya.', 'book' => 'Bukhari', 'number' => '1968', 'source' => 'HR. Bukhari no. 1968'],
            ['arabic_text' => 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ', 'translation' => 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan janganlah merasa lemah/patah semangat.', 'book' => 'Muslim', 'number' => '2664', 'source' => 'HR. Muslim no. 2664'],
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (stres).' . PHP_EOL;
    }
}
