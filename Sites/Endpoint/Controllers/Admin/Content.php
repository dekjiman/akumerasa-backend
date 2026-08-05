<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Content extends ResourceController
{
    use ResponseFormat;

    // === EMOTIONS ===
    public function emotions()
    {
        $db = \Config\Database::connect();
        $emotions = $db->table('emotions')->orderBy('sort_order', 'ASC')->get()->getResult();
        return $this->respondSuccess($emotions);
    }

    public function createEmotion()
    {
        $json = $this->request->getJSON(true);
        $name = trim($json['name'] ?? '');
        if (empty($name)) return $this->respondValidationError('Name is required.');

        $db = \Config\Database::connect();
        $db->table('emotions')->insert([
            'name'        => $name,
            'icon'        => $json['icon'] ?? null,
            'description' => $json['description'] ?? null,
            'category'    => $json['category'] ?? 'positif',
            'status'      => $json['status'] ?? 'active',
            'sort_order'  => $json['sort_order'] ?? 0,
            'created_at'  => date('Y-m-d H:i:s'),
            'updated_at'  => date('Y-m-d H:i:s'),
        ]);
        $id = $db->insertID();
        $emotion = $db->table('emotions')->where('id', $id)->get()->getRow();
        return $this->respondCreated($emotion, 'Emotion created.');
    }

    public function updateEmotion($id = null)
    {
        $db = \Config\Database::connect();
        $emotion = $db->table('emotions')->where('id', $id)->get()->getRow();
        if (!$emotion) return $this->respondNotFound('Emotion not found.');

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];
        if (isset($json['name'])) $updateData['name'] = trim($json['name']);
        if (isset($json['icon'])) $updateData['icon'] = $json['icon'];
        if (isset($json['description'])) $updateData['description'] = $json['description'];
        if (isset($json['category'])) $updateData['category'] = $json['category'];
        if (isset($json['status'])) $updateData['status'] = $json['status'];
        if (isset($json['sort_order'])) $updateData['sort_order'] = $json['sort_order'];

        $db->table('emotions')->where('id', $id)->update($updateData);
        $updated = $db->table('emotions')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Emotion updated.');
    }

    public function deleteEmotion($id = null)
    {
        $db = \Config\Database::connect();
        $emotion = $db->table('emotions')->where('id', $id)->get()->getRow();
        if (!$emotion) return $this->respondNotFound('Emotion not found.');
        $db->table('emotions')->where('id', $id)->delete();
        return $this->respondDeleted(null, 'Emotion deleted.');
    }

    // === CONTEXTS ===
    public function contexts()
    {
        $db = \Config\Database::connect();
        $contexts = $db->table('contexts')->orderBy('sort_order', 'ASC')->get()->getResult();
        return $this->respondSuccess($contexts);
    }

    public function createContext()
    {
        $json = $this->request->getJSON(true);
        $name = trim($json['name'] ?? '');
        if (empty($name)) return $this->respondValidationError('Name is required.');

        $db = \Config\Database::connect();
        $db->table('contexts')->insert([
            'name'        => $name,
            'description' => $json['description'] ?? null,
            'sort_order'  => $json['sort_order'] ?? 0,
            'created_at'  => date('Y-m-d H:i:s'),
            'updated_at'  => date('Y-m-d H:i:s'),
        ]);
        $id = $db->insertID();
        $context = $db->table('contexts')->where('id', $id)->get()->getRow();
        return $this->respondCreated($context, 'Context created.');
    }

    public function updateContext($id = null)
    {
        $db = \Config\Database::connect();
        $context = $db->table('contexts')->where('id', $id)->get()->getRow();
        if (!$context) return $this->respondNotFound('Context not found.');

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];
        if (isset($json['name'])) $updateData['name'] = trim($json['name']);
        if (isset($json['description'])) $updateData['description'] = $json['description'];
        if (isset($json['sort_order'])) $updateData['sort_order'] = $json['sort_order'];

        $db->table('contexts')->where('id', $id)->update($updateData);
        $updated = $db->table('contexts')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Context updated.');
    }

    public function deleteContext($id = null)
    {
        $db = \Config\Database::connect();
        $context = $db->table('contexts')->where('id', $id)->get()->getRow();
        if (!$context) return $this->respondNotFound('Context not found.');
        $db->table('contexts')->where('id', $id)->delete();
        return $this->respondDeleted(null, 'Context deleted.');
    }

    // === QURAN VERSES ===
    public function quranVerses()
    {
        $db = \Config\Database::connect();
        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $status = $this->request->getGet('status') ?? null;

        $builder = $db->table('quran_verses');
        if ($status) $builder->where('status', $status);

        $total = $builder->countAllResults(false);
        $verses = $builder->orderBy('surah', 'ASC')->orderBy('ayat_number', 'ASC')
            ->limit($perPage, ($page - 1) * $perPage)->get()->getResult();

        return $this->respondSuccess($verses, 'OK', [
            'current_page' => $page, 'last_page' => ceil($total / $perPage),
            'per_page' => $perPage, 'total' => $total,
        ]);
    }

    public function createQuranVerse()
    {
        $json = $this->request->getJSON(true);
        $surah = $json['surah'] ?? null;
        $ayatNumber = $json['ayat_number'] ?? null;
        $arabicText = trim($json['arabic_text'] ?? '');

        if (!$surah || !$ayatNumber || empty($arabicText)) {
            return $this->respondValidationError('surah, ayat_number, and arabic_text are required.');
        }

        $db = \Config\Database::connect();
        $db->table('quran_verses')->insert([
            'surah'         => $surah,
            'ayat_number'   => $ayatNumber,
            'arabic_text'   => $arabicText,
            'translation'   => $json['translation'] ?? null,
            'source'        => $json['source'] ?? null,
            'tags'          => $json['tags'] ?? null,
            'status'        => $json['status'] ?? 'draft',
            'created_at'    => date('Y-m-d H:i:s'),
            'updated_at'    => date('Y-m-d H:i:s'),
        ]);
        $id = $db->insertID();
        $verse = $db->table('quran_verses')->where('id', $id)->get()->getRow();
        return $this->respondCreated($verse, 'Quran verse created.');
    }

    public function updateQuranVerse($id = null)
    {
        $db = \Config\Database::connect();
        $verse = $db->table('quran_verses')->where('id', $id)->get()->getRow();
        if (!$verse) return $this->respondNotFound('Verse not found.');

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];
        if (isset($json['surah'])) $updateData['surah'] = $json['surah'];
        if (isset($json['ayat_number'])) $updateData['ayat_number'] = $json['ayat_number'];
        if (isset($json['arabic_text'])) $updateData['arabic_text'] = trim($json['arabic_text']);
        if (isset($json['translation'])) $updateData['translation'] = $json['translation'];
        if (isset($json['source'])) $updateData['source'] = $json['source'];
        if (isset($json['tags'])) $updateData['tags'] = $json['tags'];
        if (isset($json['status'])) $updateData['status'] = $json['status'];

        $db->table('quran_verses')->where('id', $id)->update($updateData);
        $updated = $db->table('quran_verses')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Verse updated.');
    }

    public function deleteQuranVerse($id = null)
    {
        $db = \Config\Database::connect();
        $verse = $db->table('quran_verses')->where('id', $id)->get()->getRow();
        if (!$verse) return $this->respondNotFound('Verse not found.');
        $db->table('quran_verses')->where('id', $id)->delete();
        return $this->respondDeleted(null, 'Verse deleted.');
    }

    public function reviewQuranVerse($id = null)
    {
        $db = \Config\Database::connect();
        $verse = $db->table('quran_verses')->where('id', $id)->get()->getRow();
        if (!$verse) return $this->respondNotFound('Verse not found.');

        $json = $this->request->getJSON(true);
        $status = $json['status'] ?? null; // 'approved' or 'rejected'

        if (!in_array($status, ['published', 'rejected', 'approved'])) {
            return $this->respondValidationError('Status must be published, approved, or rejected.');
        }

        $db->table('quran_verses')->where('id', $id)->update([
            'status'      => $status,
            'reviewer_id' => $this->request->userId,
            'reviewed_at' => date('Y-m-d H:i:s'),
            'updated_at'  => date('Y-m-d H:i:s'),
        ]);

        return $this->respondSuccess(null, "Verse {$status}.");
    }

    // === HADITHS ===
    public function hadiths()
    {
        $db = \Config\Database::connect();
        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $status = $this->request->getGet('status') ?? null;

        $builder = $db->table('hadiths');
        if ($status) $builder->where('status', $status);

        $total = $builder->countAllResults(false);
        $hadiths = $builder->orderBy('book', 'ASC')
            ->limit($perPage, ($page - 1) * $perPage)->get()->getResult();

        return $this->respondSuccess($hadiths, 'OK', [
            'current_page' => $page, 'last_page' => ceil($total / $perPage),
            'per_page' => $perPage, 'total' => $total,
        ]);
    }

    public function createHadith()
    {
        $json = $this->request->getJSON(true);
        $translation = trim($json['translation'] ?? '');
        $book = trim($json['book'] ?? '');

        if (empty($translation) || empty($book)) {
            return $this->respondValidationError('translation and book are required.');
        }

        $db = \Config\Database::connect();
        $db->table('hadiths')->insert([
            'arabic_text' => $json['arabic_text'] ?? null,
            'translation' => $translation,
            'book'        => $book,
            'number'      => $json['number'] ?? null,
            'narrator'    => $json['narrator'] ?? null,
            'grade'       => $json['grade'] ?? null,
            'source'      => $json['source'] ?? null,
            'status'      => $json['status'] ?? 'draft',
            'created_at'  => date('Y-m-d H:i:s'),
            'updated_at'  => date('Y-m-d H:i:s'),
        ]);
        $id = $db->insertID();
        $hadith = $db->table('hadiths')->where('id', $id)->get()->getRow();
        return $this->respondCreated($hadith, 'Hadith created.');
    }

    public function updateHadith($id = null)
    {
        $db = \Config\Database::connect();
        $hadith = $db->table('hadiths')->where('id', $id)->get()->getRow();
        if (!$hadith) return $this->respondNotFound('Hadith not found.');

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];
        if (isset($json['arabic_text'])) $updateData['arabic_text'] = $json['arabic_text'];
        if (isset($json['translation'])) $updateData['translation'] = $json['translation'];
        if (isset($json['book'])) $updateData['book'] = $json['book'];
        if (isset($json['number'])) $updateData['number'] = $json['number'];
        if (isset($json['narrator'])) $updateData['narrator'] = $json['narrator'];
        if (isset($json['grade'])) $updateData['grade'] = $json['grade'];
        if (isset($json['source'])) $updateData['source'] = $json['source'];
        if (isset($json['status'])) $updateData['status'] = $json['status'];

        $db->table('hadiths')->where('id', $id)->update($updateData);
        $updated = $db->table('hadiths')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Hadith updated.');
    }

    public function deleteHadith($id = null)
    {
        $db = \Config\Database::connect();
        $hadith = $db->table('hadiths')->where('id', $id)->get()->getRow();
        if (!$hadith) return $this->respondNotFound('Hadith not found.');
        $db->table('hadiths')->where('id', $id)->delete();
        return $this->respondDeleted(null, 'Hadith deleted.');
    }

    public function reviewHadith($id = null)
    {
        $db = \Config\Database::connect();
        $hadith = $db->table('hadiths')->where('id', $id)->get()->getRow();
        if (!$hadith) return $this->respondNotFound('Hadith not found.');

        $json = $this->request->getJSON(true);
        $status = $json['status'] ?? null;

        if (!in_array($status, ['published', 'rejected', 'approved'])) {
            return $this->respondValidationError('Status must be published, approved, or rejected.');
        }

        $db->table('hadiths')->where('id', $id)->update([
            'status'      => $status,
            'reviewer_id' => $this->request->userId,
            'reviewed_at' => date('Y-m-d H:i:s'),
            'updated_at'  => date('Y-m-d H:i:s'),
        ]);

        return $this->respondSuccess(null, "Hadith {$status}.");
    }
}
