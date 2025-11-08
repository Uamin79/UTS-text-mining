-- Demo data untuk menguji fitur guru
-- Jalankan setelah fix_login_data.sql

-- Tambahkan kelas demo
INSERT INTO classes (class_name, homeroom_teacher_id) VALUES
('Kelas 10A', (SELECT id FROM teachers WHERE nip = '123456')),
('Kelas 10B', NULL),
('Kelas 11A', NULL);

-- Tambahkan mata pelajaran demo
INSERT INTO subjects (subject_name, description) VALUES
('Matematika', 'Pelajaran matematika dasar'),
('Bahasa Indonesia', 'Pelajaran bahasa Indonesia'),
('Bahasa Inggris', 'Pelajaran bahasa Inggris'),
('Fisika', 'Pelajaran fisika'),
('Kimia', 'Pelajaran kimia');

-- Tambahkan siswa demo untuk Kelas 10A
INSERT INTO students (class_id, nis, full_name, gender, birth_date, address) VALUES
(1, '2021001', 'Ahmad Rahman', 'L', '2005-01-15', 'Jl. Sudirman No. 1'),
(1, '2021002', 'Siti Aminah', 'P', '2005-03-20', 'Jl. Thamrin No. 2'),
(1, '2021003', 'Budi Santoso', 'L', '2005-05-10', 'Jl. Gajah Mada No. 3'),
(1, '2021004', 'Maya Sari', 'P', '2005-07-25', 'Jl. Malioboro No. 4'),
(1, '2021005', 'Dedi Kurniawan', 'L', '2005-09-30', 'Jl. Malioboro No. 5');

-- Tambahkan siswa demo untuk Kelas 10B
INSERT INTO students (class_id, nis, full_name, gender, birth_date, address) VALUES
(2, '2021006', 'Rina Wijaya', 'P', '2005-02-14', 'Jl. Sudirman No. 6'),
(2, '2021007', 'Eko Prasetyo', 'L', '2005-04-18', 'Jl. Thamrin No. 7'),
(2, '2021008', 'Lina Marlina', 'P', '2005-06-22', 'Jl. Gajah Mada No. 8');

-- Tambahkan relasi guru mengajar mata pelajaran di kelas
INSERT INTO teacher_subjects (teacher_id, subject_id, class_id) VALUES
-- Guru Demo mengajar Matematika di Kelas 10A
((SELECT id FROM teachers WHERE nip = '123456'), 1, 1),
-- Guru Demo mengajar Bahasa Indonesia di Kelas 10A
((SELECT id FROM teachers WHERE nip = '123456'), 2, 1),
-- Guru Demo mengajar Fisika di Kelas 10B
((SELECT id FROM teachers WHERE nip = '123456'), 4, 2);

-- Tambahkan data absensi demo
INSERT INTO attendances (student_id, subject_id, date, status, notes) VALUES
-- Matematika Kelas 10A - 2024-01-15
(1, 1, '2024-01-15', 'hadir', NULL),
(2, 1, '2024-01-15', 'hadir', NULL),
(3, 1, '2024-01-15', 'sakit', 'Demam'),
(4, 1, '2024-01-15', 'hadir', NULL),
(5, 1, '2024-01-15', 'izin', 'Acara keluarga'),

-- Bahasa Indonesia Kelas 10A - 2024-01-15
(1, 2, '2024-01-15', 'hadir', NULL),
(2, 2, '2024-01-15', 'hadir', NULL),
(3, 2, '2024-01-15', 'hadir', NULL),
(4, 2, '2024-01-15', 'alpa', 'Tidak ada keterangan'),
(5, 2, '2024-01-15', 'hadir', NULL),

-- Fisika Kelas 10B - 2024-01-16
(6, 4, '2024-01-16', 'hadir', NULL),
(7, 4, '2024-01-16', 'hadir', NULL),
(8, 4, '2024-01-16', 'izin', 'Sakit gigi'),

-- Matematika Kelas 10A - 2024-01-16
(1, 1, '2024-01-16', 'hadir', NULL),
(2, 1, '2024-01-16', 'hadir', NULL),
(3, 1, '2024-01-16', 'hadir', NULL),
(4, 1, '2024-01-16', 'hadir', NULL),
(5, 1, '2024-01-16', 'sakit', 'Flu');

-- Tambahkan data nilai demo
INSERT INTO grades (student_id, subject_id, assessment_type, score, grade_date) VALUES
-- Matematika Kelas 10A - Tugas
(1, 1, 'tugas', 85.50, '2024-01-10'),
(2, 1, 'tugas', 92.00, '2024-01-10'),
(3, 1, 'tugas', 78.25, '2024-01-10'),
(4, 1, 'tugas', 88.75, '2024-01-10'),
(5, 1, 'tugas', 95.00, '2024-01-10'),

-- Matematika Kelas 10A - UTS
(1, 1, 'uts', 82.00, '2024-01-20'),
(2, 1, 'uts', 89.50, '2024-01-20'),
(3, 1, 'uts', 76.00, '2024-01-20'),
(4, 1, 'uts', 91.25, '2024-01-20'),
(5, 1, 'uts', 87.75, '2024-01-20'),

-- Bahasa Indonesia Kelas 10A - Tugas
(1, 2, 'tugas', 88.00, '2024-01-12'),
(2, 2, 'tugas', 94.50, '2024-01-12'),
(3, 2, 'tugas', 81.75, '2024-01-12'),
(4, 2, 'tugas', 86.25, '2024-01-12'),
(5, 2, 'tugas', 92.50, '2024-01-12');

-- Tambahkan data rapor demo
INSERT INTO report_cards (student_id, semester, academic_year, homeroom_teacher_notes) VALUES
(1, 1, '2023/2024', 'Siswa yang rajin dan disiplin. Perlu ditingkatkan kemampuan matematika.'),
(2, 1, '2023/2024', 'Siswa berprestasi dengan nilai yang konsisten baik.'),
(3, 1, '2023/2024', 'Perlu perhatian khusus pada beberapa mata pelajaran.'),
(4, 1, '2023/2024', 'Siswa aktif dalam kegiatan sekolah.'),
(5, 1, '2023/2024', 'Berpotensi besar, perlu dorongan lebih lanjut.');
