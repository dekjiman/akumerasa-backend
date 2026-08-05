<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentBingungSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [

            ['surah' => 2, 'ayat_number' => 2, 'arabic_text' => 'ذَٰلِكَ الْكِتَابُ لَا رَيْبَ ۛ فِيهِ ۛ هُدًى لِلْمُتَّقِينَ', 'translation' => 'Kitab (Al-Qur\'an) ini tidak ada keraguan padanya; petunjuk bagi mereka yang bertakwa.', 'tags' => 'bingung, ragu, petunjuk, Al-Qur\'an'],
            ['surah' => 2, 'ayat_number' => 15, 'arabic_text' => 'اللَّهُ يَسْتَهْزِئُ بِهِمْ وَيَمُدُّهُمْ فِي طُغْيَانِهِمْ يَعْمَهُونَ', 'translation' => 'Allah akan memperolok-olokkan mereka dan membiarkan mereka terombang-ambing dalam kesesatan mereka.', 'tags' => 'bingung, terombang-ambing, kesesatan'],
            ['surah' => 2, 'ayat_number' => 19, 'arabic_text' => 'أَوْ كَصَيِّبٍ مِنَ السَّمَاءِ فِيهِ ظُلُمَاتٌ وَرَعْدٌ وَبَرْقٌ يَجْعَلُونَ أَصَابِعَهُمْ فِي آذَانِهِمْ مِنَ الصَّوَاعِقِ حَذَرَ الْمَوْتِ', 'translation' => 'Atau seperti (orang yang ditimpa) hujan lebat dari langit, yang disertai kegelapan, petir, dan kilat. Mereka menyumbat telinga dengan jari-jarinya karena (mendengar) suara petir, sebab takut mati...', 'tags' => 'bingung, kegelapan, kepanikan'],
            ['surah' => 2, 'ayat_number' => 20, 'arabic_text' => 'يَكَادُ الْبَرْقُ يَخْطَفُ أَبْصَارَهُمْ ۖ كُلَّمَا أَضَاءَ لَهُمْ مَشَوْا فِيهِ وَإِذَا أَظْلَمَ عَلَيْهِمْ قَامُوا', 'translation' => 'Hampir-hampir kilat itu menyambar penglihatan mereka. Setiap kali (kilat itu) menyinari, mereka berjalan di bawah sinar itu, dan apabila gelap menerpa mereka, mereka berhenti...', 'tags' => 'bingung, kebimbangan, petunjuk sementara'],
            ['surah' => 4, 'ayat_number' => 143, 'arabic_text' => 'مُذَبْذَبِينَ بَيْنَ ذَٰلِكَ لَا إِلَىٰ هَٰؤُلَاءِ وَلَا إِلَىٰ هَٰؤُلَاءِ ۚ وَمَنْ يُضْلِلِ اللَّهُ فَلَنْ تَجِدَ لَهُ سَبِيلًا', 'translation' => 'Mereka dalam keadaan ragu-ragu (bingung) antara yang demikian (iman atau kafir); tidak masuk kepada golongan ini dan tidak (pula) kepada golongan itu...', 'tags' => 'bingung, ragu, kemunafikan, kebimbangan'],
            ['surah' => 22, 'ayat_number' => 55, 'arabic_text' => 'وَلَا يَزَالُ الَّذِينَ كَفَرُوا فِي مِرْيَةٍ مِنْهُ حَتَّىٰ تَأْتِيَهُمُ السَّاعَةُ بَغْتَةً', 'translation' => 'Dan orang-orang kafir itu senantiasa berada dalam keraguan tentangnya (Al-Qur\'an), hingga datang kepada mereka hari kiamat secara mendadak...', 'tags' => 'bingung, ragu, kesesatan'],
            ['surah' => 6, 'ayat_number' => 71, 'arabic_text' => 'كَالَّذِي اسْتَهْوَتْهُ الشَّيَاطِينُ فِي الْأَرْضِ حَيْرَانَ لَهُ أَصْحَابٌ يَدْعُونَهُ إِلَى الْهُدَى ائْتِنَا', 'translation' => '...seperti orang yang telah disesatkan oleh setan di bumi dalam keadaan bingung; dia mempunyai kawan-kawan yang memanggilnya kepada petunjuk (dengan mengatakan): \'Kemarilah kepada kami\'...', 'tags' => 'bingung, hairan, disesatkan setan'],
            ['surah' => 18, 'ayat_number' => 10, 'arabic_text' => 'إِذْ أَوَى الْفِتْيَةُ إِلَى الْكَهْفِ فَقَالُوا رَبَّنَا آتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا', 'translation' => '(Ingatlah) ketika pemuda-pemuda itu berlindung ke dalam gua lalu mereka berdoa: \'Ya Tuhan kami, berikanlah rahmat kepada kami dari sisi-Mu dan sempurnakanlah petunjuk yang lurus bagi kami dalam urusan kami.\'', 'tags' => 'bingung, petunjuk, Ashabul Kahfi, doa'],
            ['surah' => 93, 'ayat_number' => 7, 'arabic_text' => 'وَوَجَدَكَ ضَالًّا فَهَدَىٰ', 'translation' => 'Dan Dia mendapatimu sebagai seorang yang bingung (belum mengetahui syariat), lalu Dia memberikan petunjuk.', 'tags' => 'bingung, hidayah, Nabi Muhammad'],
            ['surah' => 27, 'ayat_number' => 63, 'arabic_text' => 'أَمَّنْ يَهْدِيكُمْ فِي ظُلُمَاتِ الْبَرِّ وَالْبَحْرِ', 'translation' => 'Bukankah Dia (Allah) yang memberi petunjuk kepada kamu dalam kegelapan di darat dan laut...', 'tags' => 'bingung, kegelapan, petunjuk Allah'],
            ['surah' => 6, 'ayat_number' => 122, 'arabic_text' => 'أَوَمَنْ كَانَ مَيْتًا فَأَحْيَيْنَاهُ وَجَعَلْنَا لَهُ نُورًا يَمْشِي بِهِ فِي النَّاسِ كَمَنْ مَثَلُهُ فِي الظُّلُمَاتِ لَيْسَ بِخَارِجٍ مِنْهَا', 'translation' => 'Dan apakah orang yang sudah mati lalu Kami hidupkan dan Kami beri cahaya yang terang, yang dengan cahaya itu dia dapat berjalan di tengah-tengah masyarakat manusia, serupa dengan orang yang berada dalam kegelapan yang tidak dapat keluar darinya?', 'tags' => 'bingung, cahaya, kegelapan, hidayah'],
            ['surah' => 20, 'ayat_number' => 25, 'arabic_text' => 'قَالَ رَبِّ اشْرَحْ لِي صَدْرِي', 'translation' => 'Dia (Musa) berkata: \'Ya Tuhanku, lapangkanlah dadaku,\'', 'tags' => 'bingung, lapang dada, Nabi Musa, kelapangan'],
            ['surah' => 20, 'ayat_number' => 26, 'arabic_text' => 'وَيَسِّرْ لِي أَمْرِي', 'translation' => 'dan mudahkanlah untukku urusanku,', 'tags' => 'bingung, kemudahan urusan, doa'],
            ['surah' => 20, 'ayat_number' => 27, 'arabic_text' => 'وَاحْلُلْ عُقْدَةً مِنْ لِسَانِي', 'translation' => 'dan lepaskanlah kekakuan dari lidahku,', 'tags' => 'bingung, kelancaran komunikasi, doa'],
            ['surah' => 20, 'ayat_number' => 28, 'arabic_text' => 'يَفْقَهُوا قَوْلِي', 'translation' => 'agar mereka mengerti perkataanku.', 'tags' => 'bingung, kejelasan, kepahaman'],

            ['surah' => 1, 'ayat_number' => 6, 'arabic_text' => 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ', 'translation' => 'Tunjukilah kami jalan yang lurus,', 'tags' => 'bingung, petunjuk, jalan lurus'],
            ['surah' => 2, 'ayat_number' => 256, 'arabic_text' => 'قَدْ تَبَيَّنَ الرُّشْدُ مِنَ الْغَيِّ', 'translation' => '...Sungguh, telah jelas (perbedaan) antara jalan yang benar dengan jalan yang sesat...', 'tags' => 'bingung, kejelasan, kebajikan'],
            ['surah' => 2, 'ayat_number' => 282, 'arabic_text' => 'وَاتَّقُوا اللَّهَ ۖ وَيُعَلِّمُكُمُ اللَّهُ', 'translation' => '...Dan bertakwalah kepada Allah, Allah memberikan pengajaran kepadamu...', 'tags' => 'bingung, takwa, ilmu, bimbingan'],
            ['surah' => 8, 'ayat_number' => 29, 'arabic_text' => 'يَا أَيُّهَا الَّذِينَ آمَنُوا إِنْ تَتَّقُوا اللَّهَ يَجْعَلْ لَكُمْ فُرْقَانًا', 'translation' => 'Wahai orang-orang yang beriman! Jika kamu bertakwa kepada Allah, niscaya Dia akan memberikan furqan (kemampuan membedakan hak dan batil) kepadamu...', 'tags' => 'bingung, furqan, kejelasan, takwa'],
            ['surah' => 65, 'ayat_number' => 2, 'arabic_text' => 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', 'translation' => '...Barangsiapa bertakwa kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'tags' => 'bingung, jalan keluar, takwa'],
            ['surah' => 24, 'ayat_number' => 35, 'arabic_text' => 'اللَّهُ نُورُ السَّمَاوَاتِ وَالْأَرْضِ ۚ مَثَلُ نُورِهِ كَمِشْكَاةٍ فِيهَا مِصْبَاحٌ', 'translation' => 'Allah (pemberi) cahaya (kepada) langit dan bumi. Perumpamaan cahaya-Nya adalah seperti sebuah lubang yang tidak tembus, yang di dalamnya ada pelita besar...', 'tags' => 'bingung, cahaya Allah, pencerahan'],
            ['surah' => 24, 'ayat_number' => 40, 'arabic_text' => 'أَوْ كَظُلُمَاتٍ فِي بَحْرٍ لُجِّيٍّ يَغْشَاهُ مَوْجٌ مِنْ فَوْقِهِ مَوْجٌ... وَمَنْ لَمْ يَجْعَلِ اللَّهُ لَهُ نُورًا فَمَا لَهُ مِنْ نُورٍ', 'translation' => 'Atau (keadaan orang-orang kafir) seperti gelap gulita di lautan yang dalam, yang diliputi oleh gelombang... Barangsiapa tidak diberi cahaya oleh Allah, tidaklah dia mempunyai cahaya sedikit pun.', 'tags' => 'bingung, kegelapan berlapis, tanpa petunjuk'],
            ['surah' => 16, 'ayat_number' => 43, 'arabic_text' => 'فَاسْأَلُوا أَهْلَ الذِّكْرِ إِنْ كُنْتُمْ لَا تَعْلَمُونَ', 'translation' => '...Maka bertanyalah kepada orang yang mempunyai pengetahuan jika kamu tidak mengetahui.', 'tags' => 'bingung, bertanya, solusi, ilmu'],
            ['surah' => 21, 'ayat_number' => 7, 'arabic_text' => 'فَاسْأَلُوا أَهْلَ الذِّكْرِ إِنْ كُنْتُمْ لَا تَعْلَمُونَ', 'translation' => '...Maka tanyakanlah kepada orang-orang yang berilmu, jika kamu tidak mengetahui.', 'tags' => 'bingung, bertanya, kejelasan'],
            ['surah' => 3, 'ayat_number' => 8, 'arabic_text' => 'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً', 'translation' => '(Mereka berdoa): \'Ya Tuhan kami, janganlah Engkau jadikan hati kami berpaling setelah Engkau beri petunjuk kepada kami, dan karuniakanlah kepada kami rahmat dari sisi-Mu...\'', 'tags' => 'bingung, keraguan, doa ketetapan hati'],
            ['surah' => 22, 'ayat_number' => 46, 'arabic_text' => 'فَإِنَّهَا لَا تَعْمَى الْأَبْصَارُ وَلَٰكِنْ تَعْمَى الْقُلُوبُ الَّتِي فِي الصُّدُورِ', 'translation' => '...sebenarnya bukan mata itu yang buta, tetapi yang buta ialah hati yang di dalam dada.', 'tags' => 'bingung, kebutaan hati, kebingungan batin'],
            ['surah' => 10, 'ayat_number' => 32, 'arabic_text' => 'فَذَٰلِكُمُ اللَّهُ رَبُّكُمُ الْحَقُّ ۖ فَمَاذَا بَعْدَ الْحَقِّ إِلَّا الضَّلَالُ', 'translation' => 'Maka itulah Allah, Tuhan kamu yang sebenarnya; maka tidak ada sesudah kebenaran itu melainkan kesesatan...', 'tags' => 'bingung, kebenaran, kesesatan'],
            ['surah' => 6, 'ayat_number' => 125, 'arabic_text' => 'فَمَنْ يُرِدِ اللَّهُ أَنْ يَهْدِيَهُ يَشْرَحْ صَدْرَهُ لِلْإِسْلَامِ', 'translation' => 'Barangsiapa dikehendaki Allah akan mendapat petunjuk, Dia akan melapangkan dadanya untuk (menerima) Islam...', 'tags' => 'bingung, kelapangan dada, hidayah'],
            ['surah' => 4, 'ayat_number' => 175, 'arabic_text' => 'فَأَمَّا الَّذِينَ آمَنُوا بِاللَّهِ وَاعْتَصَمُوا بِهِ فَسَيُدْخِلُهُمْ فِي رَحْمَةٍ مِنْهُ وَفَضْلٍ وَيَهْدِيهِمْ إِلَيْهِ صِرَاطًا مُسْتَقِيمًا', 'translation' => 'Adapun orang-orang yang beriman kepada Allah dan berpegang teguh kepada (agama)-Nya, maka Allah akan memasukkan mereka ke dalam rahmat dan karunia dari-Nya, dan menunjuki mereka jalan yang lurus kepada-Nya.', 'tags' => 'bingung, pegangan hidup, jalan lurus'],
            ['surah' => 26, 'ayat_number' => 62, 'arabic_text' => 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'translation' => 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'tags' => 'bingung, kepungan, petunjuk Allah'],

            ['surah' => 17, 'ayat_number' => 85, 'arabic_text' => 'وَيَسْأَلُونَكَ عَنِ الرُّوحِ ۖ قُلِ الرُّوحُ مِنْ أَمْرِ رَبِّي وَمَا أُوتِيتُمْ مِنَ الْعِلْمِ إِلَّا قَلِيلًا', 'translation' => 'Dan mereka bertanya kepadamu tentang roh. Katakanlah: \'Roh itu termasuk urusan Tuhanku, dan kamu tidak diberi pengetahuan melainkan sedikit.\'', 'tags' => 'bingung, keterbatasan manusia, rahasia Allah'],
            ['surah' => 18, 'ayat_number' => 24, 'arabic_text' => 'وَاذْكُرْ رَبَّكَ إِذَا نَسِيتَ وَقُلْ عَسَىٰ أَنْ يَهْدِيَنِ رَبِّي لِأَقْرَبَ مِنْ هَٰذَا رَشَدًا', 'translation' => '...Dan ingatlah kepada Tuhanmu jika engkau lupa dan katakanlah: \'Mudah-mudahan Tuhanku akan memberi petunjuk kepada yang lebih dekat kebenarannya daripada ini.\'', 'tags' => 'bingung, lupa, petunjuk, doa'],
            ['surah' => 28, 'ayat_number' => 22, 'arabic_text' => 'وَلَمَّا تَوَجَّهَ تِلْقَاءَ مَدْيَنَ قَالَ عَسَىٰ رَبِّي أَنْ يَهْدِيَنِي سَوَاءَ السَّبِيلِ', 'translation' => 'Dan ketika dia (Musa) menuju ke arah negeri Madyan dia berkata: \'Mudah-mudahan Tuhanku memimpin aku ke jalan yang benar.\'', 'tags' => 'bingung, arah hidup, Nabi Musa, doa'],
            ['surah' => 42, 'ayat_number' => 52, 'arabic_text' => 'مَا كُنْتَ تَدْرِي مَا الْكِتَابُ وَلَا الْإِيمَانُ وَلَٰكِنْ جَعَلْنَاهُ نُورًا نَهْدِي بِهِ مَنْ نَشَاءُ', 'translation' => '...Sebelumnya engkau tidak mengetahui apakah Kitab (Al-Qur\'an) dan apakah iman itu, tetapi Kami jadikan Al-Qur\'an itu cahaya, yang Kami beri petunjuk dengannya siapa yang Kami kehendaki...', 'tags' => 'bingung, cahaya Al-Qur\'an, hidayah'],
            ['surah' => 39, 'ayat_number' => 23, 'arabic_text' => 'اللَّهُ نَزَّلَ أَحْسَنَ الْحَدِيثِ كِتَابًا مُتَشَابِهًا مَثَانِيَ تَقْشَعِرُّ مِنْهُ جُلُودُ الَّذِينَ يَخْشَوْنَ رَبَّهُمْ', 'translation' => 'Allah telah menurunkan perkataan yang paling baik (yaitu) Al-Qur\'an yang serupa (ayat-ayatnya) lagi berulang-ulang...', 'tags' => 'bingung, penentram, Al-Qur\'an'],
        ];

        $hadiths = [
            ['arabic_text' => 'دَعْ مَا يَرِيبُكَ إِلَى مَا لاَ يَرِيبُكَ', 'translation' => 'Tinggalkanlah apa yang meragukanmu (membuatmu bingung) menuju apa yang tidak meragukanmu.', 'book' => 'Tirmidzi, An-Nasa\'i', 'number' => '2518', 'source' => 'HR. Tirmidzi no. 2518 & An-Nasa\'i'],
            ['arabic_text' => 'اسْتَفْتِ قَلْبَكَ، الْبِرُّ مَا اطْمَأَنَّتْ إِلَيْهِ النَّفْسُ وَاطْمَأَنَّ إِلَيْهِ الْقَلْبُ، وَالإِثْمُ مَا حَاكَ فِي النَّفْسِ وَتَرَدَّدَ فِي الصَّدْرِ', 'translation' => 'Mintalah fatwa pada hatimu. Kebaikan itu adalah apa yang membuat jiwa dan hati merasa tenang kepadanya, sedangkan dosa adalah apa yang meragukan/mengganjal dalam jiwa dan berbolak-balik dalam dada...', 'book' => 'Ahmad', 'number' => '17742', 'source' => 'HR. Ahmad no. 17742'],
            ['arabic_text' => 'إِنَّ الحَلاَلَ بَيِّنٌ وَإِنَّ الحَرَامَ بَيِّنٌ وَبَيْنَهُمَا أُمُورٌ مُشْتَبِهَاتٌ لاَ يَعْلَمُهُنَّ كَثِيرٌ مِنَ النَّاسِ', 'translation' => 'Sesungguhnya yang halal itu jelas dan yang haram itu jelas, dan di antara keduanya ada perkara-perkara samar (subhat/membingungkan) yang tidak diketahui oleh kebanyakan manusia...', 'book' => 'Bukhari, Muslim', 'number' => '52, 1599', 'source' => 'HR. Bukhari no. 52 & Muslim no. 1599'],
            ['arabic_text' => 'كَانَ رَسُولُ اللَّهِ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ يُعَلِّمُنَا الاِسْتِخَارَةَ فِي الأُمُورِ كُلِّهَا', 'translation' => 'Rasulullah SAW mengajari kami salat Istikharah (memohon petunjuk saat bingung memilih) dalam segala urusan.', 'book' => 'Bukhari', 'number' => '1162', 'source' => 'HR. Bukhari no. 1162'],
            ['arabic_text' => 'اللَّهُمَّ إِنِّي أَسْتَخِيرُكَ بِعِلْمِكَ وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ', 'translation' => 'Ya Allah, sesungguhnya aku memohon pilihan yang baik dengan ilmu-Mu, memohon takdir yang baik dengan kuasa-Mu... (Doa Istikharah).', 'book' => 'Bukhari', 'number' => '1162', 'source' => 'HR. Bukhari no. 1162'],
            ['arabic_text' => 'يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَى دِينِكَ', 'translation' => 'Wahai Dzat yang membolak-balikkan hati, teguhkanlah hatiku di atas agama-Mu.', 'book' => 'Tirmidzi', 'number' => '2140', 'source' => 'HR. Tirmidzi no. 2140'],
            ['arabic_text' => 'اللَّهُمَّ اهْدِنِي وَسَدِّدْنِي', 'translation' => 'Ya Allah, berilah aku petunjuk dan luruskanlah jalanku.', 'book' => 'Muslim', 'number' => '2725', 'source' => 'HR. Muslim no. 2725'],
            ['arabic_text' => 'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى وَالتُّقَى وَالْعَفَافَ وَالْغِنَى', 'translation' => 'Ya Allah, aku memohon kepada-Mu petunjuk (hidayah), ketakwaan, kesucian diri, dan kecukupan.', 'book' => 'Muslim', 'number' => '2721', 'source' => 'HR. Muslim no. 2721'],
            ['arabic_text' => 'اللَّهُمَّ أَرِنَا الْحَقَّ حَقًّا وَارْزُقْنَا اتِّبَاعَهُ وَأَرِنَا الْبَاطِلَ بَاطِلًا وَارْزُقْنَا اجْتِنَابَهُ', 'translation' => 'Ya Allah, perlihatkanlah kepada kami kebenaran sebagai kebenaran dan berilah kami kemampuan untuk mengikutinya, serta perlihatkanlah kebatilan sebagai kebatilan dan berilah kami kemampuan untuk menjauhinya.', 'book' => 'Ulama', 'number' => null, 'source' => 'HR. Al-Ghazali (Ihya Ulumuddin) & populer di kalangan ulama'],
            ['arabic_text' => 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ', 'translation' => 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku.', 'book' => 'Abu Dawud', 'number' => '5090', 'source' => 'HR. Abu Dawud no. 5090'],
            ['arabic_text' => 'تَرَكْتُ فِيكُمْ أَمْرَيْنِ لَنْ تَضِلُّوا مَا تَمَسَّكْتُمْ بِهِمَا: كِتَابَ اللَّهِ وَسُنَّةَ نَبِيِّهِ', 'translation' => 'Aku tinggalkan untuk kalian dua perkara yang kalian tidak akan sesat/bingung selama-lamanya jika berpegang teguh pada keduanya: Kitab Allah dan Sunnah Nabi-Nya.', 'book' => 'Malik', 'number' => '1661', 'source' => 'HR. Malik (Muwatta no. 1661)'],
            ['arabic_text' => 'إِنَّ اللَّهَ لاَ يَقْبِضُ الْعِلْمَ انْتِزَاعًا... وَلَكِنْ يَقْبِضُ الْعِلْمَ بِقَبْضِ الْعُلَمَاءِ حَتَّى إِذَا لَمْ يُبْقِ عَالِمًا اتَّخَذَ النَّاسُ رُؤُوسًا جُهَّالاً فَسُئِلُوا فَأَفْتَوْا بِغَيْرِ عِلْمٍ فَضَلُّوا وَأَضَلُّوا', 'translation' => '...sehingga apabila tidak tersisa orang alim, manusia mengangkat pemimpin yang bodoh. Lalu mereka ditanya dan memberi fatwa tanpa ilmu, sehingga mereka sesat dan menyesatkan.', 'book' => 'Bukhari, Muslim', 'number' => '100', 'source' => 'HR. Bukhari no. 100 & Muslim'],
            ['arabic_text' => 'مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُفَقِّهْهُ فِي الدِّينِ', 'translation' => 'Barangsiapa yang dikehendaki kebaikan oleh Allah, maka Dia akan memahamkannya dalam urusan agama.', 'book' => 'Bukhari, Muslim', 'number' => '71', 'source' => 'HR. Bukhari no. 71 & Muslim'],
            ['arabic_text' => 'سِيَاهُ الشَّيْطَانِ يَأْتِي أَحَدَكُمْ فَيَقُولُ مَنْ خَلَقَ كَذَا مَنْ خَلَقَ كَذَا حَتَّى يَقُولَ مَنْ خَلَقَ رَبَّكَ فَإِذَا بَلَغَهُ فَلْيَسْتَعِذْ بِاللَّهِ وَلْيَنْتَهِ', 'translation' => 'Setan mendatangi salah seorang dari kalian lalu bertanya: \'Siapa yang menciptakan ini? Siapa yang menciptakan itu?\' Hingga bertanya: \'Siapa yang menciptakan Tuhanmu?\' Jika sampai demikian, hendaklah ia memohon perlindungan kepada Allah dan menyudahinya.', 'book' => 'Bukhari, Muslim', 'number' => '3276', 'source' => 'HR. Bukhari no. 3276 & Muslim'],
            ['arabic_text' => 'إِنَّ اللَّهَ كَتَبَ الإِحْسَانَ عَلَى كُلِّ شَيْءٍ', 'translation' => 'Sesungguhnya Allah mewajibkan berbuat baik (termasuk bersikap bijak dan tidak membuat bingung) dalam segala hal...', 'book' => 'Muslim', 'number' => '1955', 'source' => 'HR. Muslim no. 1955'],
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (bingung).' . PHP_EOL;
    }
}
