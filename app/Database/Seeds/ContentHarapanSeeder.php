<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ContentHarapanSeeder extends Seeder
{
    public function run()
    {
        $now = date('Y-m-d H:i:s');

        $quranVerses = [

            ['surah' => 39, 'ayat_number' => 53, 'arabic_text' => 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنْفُسِهِمْ لَا تَقْنَطُوا مِنْ رَحْمَةِ اللَّهِ ۚ إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا', 'translation' => 'Katakanlah: \'Wahai hamba-hamba-Ku yang melampaui batas terhadap diri mereka sendiri, janganlah kamu berputus asa dari rahmat Allah. Sesungguhnya Allah mengampuni dosa-dosa semuanya...\'', 'tags' => 'harapan, rahmat Allah, ampuan'],
            ['surah' => 12, 'ayat_number' => 87, 'arabic_text' => 'وَلَا تَيْأَسُوا مِنْ رَوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِنْ رَوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ', 'translation' => '...dan jangan kamu berputus asa dari rahmat Allah. Sesungguhnya yang berputus asa dari rahmat Allah, hanyalah kaum yang kafir.', 'tags' => 'harapan, pantang putus asa, optimisme'],
            ['surah' => 94, 'ayat_number' => 5, 'arabic_text' => 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'translation' => 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'tags' => 'harapan, kemudahan, kelapangan'],
            ['surah' => 94, 'ayat_number' => 6, 'arabic_text' => 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'translation' => 'Sesungguhnya bersama kesulitan ada kemudahan.', 'tags' => 'harapan, janji Allah, kelapangan'],
            ['surah' => 94, 'ayat_number' => 8, 'arabic_text' => 'وَإِلَىٰ رَبِّكَ فَارْغَبْ', 'translation' => 'Dan hanya kepada Tuhanmulah engkau berharap.', 'tags' => 'harapan, sandaran jiwa, raja\''],
            ['surah' => 15, 'ayat_number' => 56, 'arabic_text' => 'قَالَ وَمَنْ يَقْنَطُ مِنْ رَحْمَةِ رَبِّهِ إِلَّا الضَّالُّونَ', 'translation' => 'Dia (Ibrahim) berkata: \'Tidak ada yang berputus asa dari rahmat Tuhannya, melainkan orang-orang yang sesat.\'', 'tags' => 'harapan, rahmat Allah, Nabi Ibrahim'],
            ['surah' => 65, 'ayat_number' => 2, 'arabic_text' => 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', 'translation' => '...Barangsiapa bertakwa kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'tags' => 'harapan, jalan keluar, takwa'],
            ['surah' => 65, 'ayat_number' => 3, 'arabic_text' => 'وَيَرْزُقْهُ مِنْ حَيْثُ لَا يَحْتَسِبُ ۚ وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', 'translation' => 'Dan Dia memberinya rezeki dari arah yang tidak disangka-sangkanya. Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.', 'tags' => 'harapan, rezeki tak terduga, tawakal'],
            ['surah' => 65, 'ayat_number' => 7, 'arabic_text' => 'سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', 'translation' => 'Allah kelak akan memberikan kelapangan setelah kesempitan.', 'tags' => 'harapan, kesempitan, kelapangan'],
            ['surah' => 2, 'ayat_number' => 186, 'arabic_text' => 'وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ ۖ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ', 'translation' => 'Dan apabila hamba-hamba-Ku bertanya kepadamu tentang Aku, maka bahwasanya Aku adalah dekat. Aku mengabulkan permohonan orang yang berdoa apabila ia berdoa kepada-Ku...', 'tags' => 'harapan, doa, kedekatan Allah'],
            ['surah' => 2, 'ayat_number' => 218, 'arabic_text' => 'إِنَّ الَّذِينَ آمَنُوا وَالَّذِينَ هَاجَرُوا وَجَاهَدُوا فِي سَبِيلِ اللَّهِ أُولَٰئِكَ يَرْجُونَ رَحْمَتَ اللَّهِ', 'translation' => 'Sesungguhnya orang-orang yang beriman, orang-orang yang berhijrah dan berjihad di jalan Allah, mereka itu mengharapkan rahmat Allah...', 'tags' => 'harapan, raja\', rahmat Allah'],
            ['surah' => 18, 'ayat_number' => 110, 'arabic_text' => 'فَمَنْ كَانَ يَرْجُو لِقَاءَ رَبِّهِ فَلْيَعْمَلْ عَمَلًا صَالِحًا وَلَا يُشْرِكْ بِعِبَادَةِ رَبِّهِ أَحَدًا', 'translation' => '...Barangsiapa mengharap perjumpaan dengan Tuhannya, maka hendaklah dia mengerjakan kebajikan dan janganlah mempersekutukan seorang pun dalam beribadah kepada Tuhannya.', 'tags' => 'harapan, perjumpaan Allah, amal saleh'],
            ['surah' => 93, 'ayat_number' => 3, 'arabic_text' => 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'translation' => 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'tags' => 'harapan, kasih sayang Allah, penguat batin'],
            ['surah' => 93, 'ayat_number' => 4, 'arabic_text' => 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ', 'translation' => 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.', 'tags' => 'harapan, optimisme, masa depan'],
            ['surah' => 93, 'ayat_number' => 5, 'arabic_text' => 'وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ', 'translation' => 'Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas.', 'tags' => 'harapan, janji Allah, kepuasan'],

            ['surah' => 21, 'ayat_number' => 87, 'arabic_text' => 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'translation' => 'Maka dia (Yunus) berdoa dalam kegelapan: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'tags' => 'harapan, doa terdesak, Nabi Yunus'],
            ['surah' => 21, 'ayat_number' => 88, 'arabic_text' => 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ', 'translation' => 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.', 'tags' => 'harapan, pengabulan doa, pertolongan'],
            ['surah' => 21, 'ayat_number' => 89, 'arabic_text' => 'وَزَكَرِيَّا إِذْ نَادَىٰ رَبَّهُ رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنْتَ خَيْرُ الْوَارِثِينَ', 'translation' => 'Dan (ingatlah kisah) Zakaria, ketika dia berdoa kepada Tuhannya: \'Ya Tuhanku, janganlah Engkau biarkan aku hidup seorang diri...\'', 'tags' => 'harapan, doa, Nabi Zakaria'],
            ['surah' => 21, 'ayat_number' => 90, 'arabic_text' => 'فَاسْتَجَبْنَا لَهُ وَوَهَبْنَا لَهُ يَحْيَىٰ... إِنَّهُمْ كَانُوا يُسَارِعُونَ فِي الْخَيْرَاتِ وَيَدْعُونَنَا رَغَبًا وَرَهَبًا', 'translation' => 'Maka Kami kabulkan doanya dan Kami anugerahkan kepadanya Yahya... Sungguh, mereka selalu berdoa kepada Kami dengan penuh harapan dan rasa takut...', 'tags' => 'harapan, raghab, karunia'],
            ['surah' => 21, 'ayat_number' => 83, 'arabic_text' => 'وَأَيُّوبَ إِذْ نَادَىٰ رَبَّهُ أَنِّي مَسَّنِيَ الضُّرُّ وَأَنْتَ أَرْحَمُ الرَّاحِمِينَ', 'translation' => 'Dan (ingatlah kisah) Ayub, ketika dia berdoa kepada Tuhannya: \'(Ya Tuhanku), sungguh, aku telah ditimpa penyakit, padahal Engkau Tuhan Yang Maha Penyayang...\'', 'tags' => 'harapan, kesembuhan, Nabi Ayub'],
            ['surah' => 21, 'ayat_number' => 84, 'arabic_text' => 'فَاسْتَجَبْنَا لَهُ فَكَشَفْنَا مَا بِهِ مِنْ ضُرٍّ', 'translation' => 'Maka Kami kabulkan doanya, lalu Kami lenyapkan penyakit yang ada padanya...', 'tags' => 'harapan, pemulihan, rahmat'],
            ['surah' => 28, 'ayat_number' => 24, 'arabic_text' => 'رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ', 'translation' => '(Musa berdoa): \'Ya Tuhanku, sesungguhnya aku sangat memerlukan sesuatu kebaikan yang Engkau turunkan kepadaku.\'', 'tags' => 'harapan, rezeki, Nabi Musa'],
            ['surah' => 26, 'ayat_number' => 62, 'arabic_text' => 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'translation' => 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'tags' => 'harapan, pertolongan, keteguhan'],
            ['surah' => 3, 'ayat_number' => 173, 'arabic_text' => 'وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', 'translation' => '...dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'', 'tags' => 'harapan, tawakal, pertolongan'],
            ['surah' => 3, 'ayat_number' => 174, 'arabic_text' => 'فَانْقَلَبُوا بِنِعْمَةٍ مِنَ اللَّهِ وَفَضْلٍ لَمْ يَمْسَسْهُمْ سُوءٌ', 'translation' => 'Maka mereka kembali dengan nikmat dan karunia yang besar dari Allah, mereka tidak ditimpa suatu bencana pun...', 'tags' => 'harapan, hasil tawakal, perlindungan'],
            ['surah' => 7, 'ayat_number' => 156, 'arabic_text' => 'وَرَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ', 'translation' => '...dan rahmat-Ku meliputi segala sesuatu...', 'tags' => 'harapan, rahmat Allah, keluasan karunia'],
            ['surah' => 29, 'ayat_number' => 5, 'arabic_text' => 'مَنْ كَانَ يَرْجُو لِقَاءَ اللَّهِ فَإِنَّ أَجَلَ اللَّهِ لَآتٍ ۚ وَهُوَ السَّمِيعُ الْعَلِيمُ', 'translation' => 'Barangsiapa mengharap perjumpaan dengan Allah, maka sesungguhnya waktu (yang dijanjikan) Allah itu pasti datang...', 'tags' => 'harapan, janji Allah, akhirat'],
            ['surah' => 33, 'ayat_number' => 21, 'arabic_text' => 'لَقَدْ كَانَ لَكُمْ فِي رَسُولِ اللَّهِ أُسْوَةٌ حَسَنَةٌ لِمَنْ كَانَ يَرْجُو اللَّهَ وَالْيَوْمَ الْآخِرَ', 'translation' => 'Sungguh, telah ada pada (diri) Rasulullah itu suri teladan yang baik bagimu (yaitu) bagi orang yang mengharap (rahmat) Allah dan (kedatangan) hari kiamat...', 'tags' => 'harapan, teladan rasul, keteladanan'],
            ['surah' => 60, 'ayat_number' => 6, 'arabic_text' => 'لَقَدْ كَانَ لَكُمْ فِيهِمْ أُسْوَةٌ حَسَنَةٌ لِمَنْ كَانَ يَرْجُو اللَّهَ وَالْيَوْمَ الْآخِرَ', 'translation' => 'Sungguh, pada mereka itu (Ibrahim dan pengikutnya) terdapat suri teladan yang baik bagimu; (yaitu) bagi orang yang mengharap (pahala) Allah dan (keselamatan) hari kemudian...', 'tags' => 'harapan, teladan, kesuksesan'],

            ['surah' => 29, 'ayat_number' => 69, 'arabic_text' => 'وَالَّذِينَ جَاهَدُوا فِينَا لَنَهْدِيَنَّهُمْ سُبُلَنَا', 'translation' => 'Dan orang-orang yang berjihad (bersungguh-sungguh) untuk (mencari keridhaan) Kami, sungguh Kami akan tunjukkan kepada mereka jalan-jalan Kami...', 'tags' => 'harapan, petunjuk, kesungguhan'],
            ['surah' => 41, 'ayat_number' => 30, 'arabic_text' => 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ', 'translation' => 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih; dan bergembiralah dengan surga...\'', 'tags' => 'harapan, kabar gembira, surga'],
            ['surah' => 32, 'ayat_number' => 16, 'arabic_text' => 'تَتَجَافَىٰ جُنُوبُهُمْ عَنِ الْمَضَاجِعِ يَدْعُونَ رَبَّهُمْ خَوْفًا وَطَمَعًا', 'translation' => 'Lambung mereka jauh dari tempat tidurnya, mereka berdoa kepada Tuhannya dengan rasa takut dan penuh harapan...', 'tags' => 'harapan, thama\', doa malam'],
            ['surah' => 7, 'ayat_number' => 56, 'arabic_text' => 'وَادْعُوهُ خَوْفًا وَطَمَعًا ۚ إِنَّ رَحْمَتَ اللَّهِ قَرِيبٌ مِنَ الْمُحْسِنِينَ', 'translation' => '...dan berdoalah kepada-Nya dengan rasa takut dan harapan. Sesungguhnya rahmat Allah sangat dekat kepada orang-orang yang berbuat baik.', 'tags' => 'harapan, rahmat dekat, ihsan'],
            ['surah' => 10, 'ayat_number' => 58, 'arabic_text' => 'قُلْ بِفَضْلِ اللَّهِ وَبِرَحْمَتِهِ فَبِذَٰلِكَ فَلْيَفْرَحُوا', 'translation' => 'Katakanlah (Muhammad): \'Dengan karunia Allah dan rahmat-Nya, hendaklah dengan itu mereka bergembira...\'', 'tags' => 'harapan, kegembiraan, karunia'],
            ['surah' => 4, 'ayat_number' => 104, 'arabic_text' => 'وَتَرْجُونَ مِنَ اللَّهِ مَا لَا يَرْجُونَ', 'translation' => '...sedang kamu mengharapkan dari Allah apa yang tidak mereka harapkan...', 'tags' => 'harapan, keunggulan mukmin, pahala'],
        ];

        $hadiths = [
            ['arabic_text' => 'أَنَا عِنْدَ ظَنِّ عَبْدِي بِي', 'translation' => 'Aku sesuai dengan persangkaan hamba-Ku kepada-Ku (Husnudzon/Harapan).', 'book' => 'Bukhari, Muslim', 'number' => '7405, 2675', 'source' => 'HR. Bukhari no. 7405 & Muslim no. 2675'],
            ['arabic_text' => 'لاَ يَمُوتَنَّ أَحَدُكُمْ إِلاَّ وَهُوَ يُحْسِنُ الظَّنَّ بِاللَّهِ عَزَّ وَجَلَّ', 'translation' => 'Janganlah sekali-kali salah seorang di antara kalian meninggal dunia melainkan dalam keadaan berprasangka baik (penuh harapan) kepada Allah.', 'book' => 'Muslim', 'number' => '2877', 'source' => 'HR. Muslim no. 2877'],
            ['arabic_text' => 'ادْعُوا اللَّهَ وَأَنْتُمْ مُوقِنُونَ بِالإِجَابَةِ', 'translation' => 'Berdoalah kepada Allah dalam keadaan kalian yakin (penuh harapan) akan dikabulkan.', 'book' => 'Tirmidzi', 'number' => '3479', 'source' => 'HR. Tirmidzi no. 3479'],
            ['arabic_text' => 'إِنَّ اللَّهَ حَيِيٌّ كَرِيمٌ يَسْتَحْيِي إِذَا رَفَعَ الرَّجُلُ إِلَيْهِ يَدَيْهِ أَنْ يَرُدَّهُمَا صِفْرًا خَائِبَتَيْنِ', 'translation' => 'Sesungguhnya Allah Maha Pemalu lagi Mahamulia. Dia malu jika seorang hamba mengangkat kedua tangannya kepada-Nya, lalu Dia mengembalikannya dalam keadaan kosong.', 'book' => 'Tirmidzi', 'number' => '3556', 'source' => 'HR. Tirmidzi no. 3556'],
            ['arabic_text' => 'لَوْ أَنَّكُمْ تَتَوَكَّلُونَ عَلَى اللَّهِ حَقَّ تَوَكُّلِهِ لَرَزَقَكُمْ كَمَا يَرْزُقُ الطَّيْرَ', 'translation' => 'Seandainya kalian bertawakal kepada Allah dengan sungguh-sungguh tawakal, niscaya Allah akan memberi kalian rezeki sebagaimana Dia memberi rezeki kepada burung...', 'book' => 'Tirmidzi', 'number' => '2344', 'source' => 'HR. Tirmidzi no. 2344'],
            ['arabic_text' => 'يَسِّرُوا وَلاَ تُعَسِّرُوا، وَبَشِّرُوا وَلاَ تُنَفِّرُوا', 'translation' => 'Permudahlah dan jangan kamu persulit, berilah kabar gembira (bangkitkan harapan) dan jangan buat mereka lari/putus asa.', 'book' => 'Bukhari, Muslim', 'number' => '69, 1734', 'source' => 'HR. Bukhari no. 69 & Muslim no. 1734'],
            ['arabic_text' => 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ', 'translation' => 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan janganlah merasa lemah/patah semangat.', 'book' => 'Muslim', 'number' => '2664', 'source' => 'HR. Muslim no. 2664'],
            ['arabic_text' => 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا', 'translation' => 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.', 'book' => 'Ahmad', 'number' => '2803', 'source' => 'HR. Ahmad no. 2803'],
            ['arabic_text' => 'لاَ طِيَرَةَ وَخَيْرُهَا الْفَأْلُ... الكَلِمَةُ الصَّالِحَةُ', 'translation' => 'Tidak ada anggapan sial (tiyarah), dan yang terbaik adalah al-fa\'l (prakiraan baik/optimisme), yaitu kata-kata yang baik.', 'book' => 'Bukhari, Muslim', 'number' => '5754, 2223', 'source' => 'HR. Bukhari no. 5754 & Muslim no. 2223'],
            ['arabic_text' => 'مَا مِنْ مُسْلِمٍ يَدْعُو بِدَعْوَةٍ لَيْسَ فِيهَا إِثْمٌ وَلاَ قَطِيعَةُ رَحِمٍ إِلاَّ أَعْطَاهُ اللَّهُ بِهَا إِحْدَى ثَلاَثٍ', 'translation' => 'Tidak ada seorang muslim pun yang berdoa... melainkan Allah pasti memberinya salah satu dari tiga hal (dikabulkan langsung, disimpan di akhirat, atau dijauhkan dari keburukan).', 'book' => 'Ahmad', 'number' => '11133', 'source' => 'HR. Ahmad no. 11133'],
            ['arabic_text' => 'إِنَّ الرَّحْمَةَ غَلَبَتِ الْغَضَبَ', 'translation' => 'Sesungguhnya rahmat-Ku mendahului/mengalahkan murka-Ku.', 'book' => 'Bukhari, Muslim', 'number' => '7553, 2751', 'source' => 'HR. Bukhari no. 7553 & Muslim no. 2751'],
            ['arabic_text' => 'لَلَّهُ أَرْحَمُ بِعِبَادِهِ مِنْ هَذِهِ بِوَلَدِهَا', 'translation' => 'Sungguh, Allah lebih menyayangi hamba-hamba-Nya daripada ibu ini menyayangi anaknya.', 'book' => 'Bukhari, Muslim', 'number' => '5999, 2754', 'source' => 'HR. Bukhari no. 5999 & Muslim no. 2754'],
            ['arabic_text' => 'جَعَلَ اللَّهُ الرَّحْمَةَ مِائَةَ جُزْءٍ فَأَمْسَكَ عِنْدَهُ تِسْعَةً وَتِسْعِينَ جُزْءًا وَأَنْزَلَ فِي الأَرْضِ جُزْءًا وَاحِدًا', 'translation' => 'Allah menjadikan rahmat itu seratus bagian. Dia menahan 99 bagian di sisi-Nya dan menurunkan satu bagian ke bumi...', 'book' => 'Bukhari, Muslim', 'number' => '6000, 2752', 'source' => 'HR. Bukhari no. 6000 & Muslim no. 2752'],
            ['arabic_text' => 'يَا ابْنَ آدَمَ إِنَّكَ مَا دَعَوْتَنِي وَرَجَوْتَنِي غَفَرْتُ لَكَ عَلَى مَا كَانَ مِنْكَ وَلاَ أُبَالِي', 'translation' => 'Wahai anak Adam, sesungguhnya selagi engkau berdoa kepada-Ku dan mengharapkan-Ku, Aku akan mengampunimu atas dosa apa pun yang ada padamu.', 'book' => 'Tirmidzi', 'number' => '3540', 'source' => 'HR. Tirmidzi no. 3540'],
            ['arabic_text' => 'سَدِّدُوا وَقَارِبُوا وَأَبْشِرُوا', 'translation' => 'Berlakulah lurus, mendekatlah (kepada kebenaran), dan bergembiralah (peliharalah harapanmu).', 'book' => 'Bukhari, Muslim', 'number' => '6467, 2818', 'source' => 'HR. Bukhari no. 6467 & Muslim no. 2818'],
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

        echo 'Seeded ' . count($quranVerses) . ' quran verses and ' . count($hadiths) . ' hadiths (harapan).' . PHP_EOL;
    }
}
