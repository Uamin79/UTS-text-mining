-- Hapus data yang mungkin duplikat
DELETE FROM admins WHERE user_id IN (SELECT id FROM users WHERE username IN ('admin', 'guru', 'ortu'));
DELETE FROM teachers WHERE user_id IN (SELECT id FROM users WHERE username IN ('guru1', 'guru'));
DELETE FROM parents WHERE user_id IN (SELECT id FROM users WHERE username IN ('ortu1', 'ortu'));
DELETE FROM users WHERE username IN ('admin', 'guru1', 'ortu1', 'guru', 'ortu');

-- Insert user accounts with hashed passwords
INSERT INTO users (username, password, role) VALUES
('admin', '$2y$10$WNberPO4EXhEh5gA8sKlWOhdCe2s5EttNK3i6yC075g3cDxPOojHW', 'admin'),
('guru', '$2y$10$r2oSyVVRVWLRZksz0mF.vuP8QNLnTvTIuMzLG9GjLwwPhsa80Fe/S', 'guru'),
('ortu', '$2y$10$mD4WNX97f9GDL72OFCtSyebLTJIsGnoKiYhsMF9khaPuE26Jp3snS', 'orangtua');

-- Insert admin profile
INSERT INTO admins (user_id, full_name, email)
SELECT id, 'Administrator', 'admin@example.com'
FROM users WHERE username = 'admin';

-- Insert teacher profile
INSERT INTO teachers (user_id, full_name, nip, email, phone_number)
SELECT id, 'Guru Demo', '123456', 'guru@example.com', '08123456789'
FROM users WHERE username = 'guru';

-- Insert parent profile
INSERT INTO parents (user_id, full_name, email, phone_number)
SELECT id, 'Orang Tua Demo', 'ortu@example.com', '08987654321'
FROM users WHERE username = 'ortu';
