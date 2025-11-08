-- Koreksi relasi tabel siswa, nilai, absensi, guru
-- Menambahkan kolom class_id ke tabel attendances dan grades untuk memastikan integritas data

-- 1. Tambahkan kolom class_id ke tabel attendances
ALTER TABLE `attendances` ADD COLUMN `class_id` int(11) NOT NULL AFTER `subject_id`;

-- 2. Tambahkan kolom class_id ke tabel grades
ALTER TABLE `grades` ADD COLUMN `class_id` int(11) NOT NULL AFTER `subject_id`;

-- 3. Update data existing dengan class_id dari students
UPDATE `attendances` SET `class_id` = (SELECT `class_id` FROM `students` WHERE `students`.`id` = `attendances`.`student_id`);

-- 4. Update data existing dengan class_id dari students
UPDATE `grades` SET `class_id` = (SELECT `class_id` FROM `students` WHERE `students`.`id` = `grades`.`student_id`);

-- 5. Tambahkan foreign key untuk class_id di tabel attendances
ALTER TABLE `attendances` ADD CONSTRAINT `fk_attendances_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 6. Tambahkan foreign key untuk class_id di tabel grades
ALTER TABLE `grades` ADD CONSTRAINT `fk_grades_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 7. Tambahkan unique constraint untuk mencegah duplikasi attendance per student/subject/class/date
ALTER TABLE `attendances` ADD CONSTRAINT `unique_attendance` UNIQUE (`student_id`, `subject_id`, `class_id`, `date`);

-- 8. Tambahkan unique constraint untuk mencegah duplikasi grade per student/subject/class/assessment/date
ALTER TABLE `grades` ADD CONSTRAINT `unique_grade` UNIQUE (`student_id`, `subject_id`, `class_id`, `assessment_type`, `grade_date`);
