-- Geo Arena Sample Data
-- Insert sample data for testing

-- Insert admin user (password: admin123)
-- This is a bcrypt hash for 'admin123' with salt rounds 12
INSERT INTO users (email, password_hash, username, role) VALUES 
('admin@geoarena.com', '$2a$12$002X2XdmqmDNEazvicv3KuRhPKsZY61K3p5ACCGUqaiszZ5zljkNq', 'admin', 'admin');

-- Insert regular user (password: user123)
-- This is a bcrypt hash for 'user123' with salt rounds 12
INSERT INTO users (email, password_hash, username, role) VALUES 
('user@example.com', '$2a$12$tkSRrcXZh4BL80Zdd7jgW.LZopEsMe1mILiQpJDeYZnZbLRxqJeSm', 'player1', 'user');

-- Insert sample tournament
INSERT INTO tournaments (title, description, game_name, entry_fee, max_teams, registration_open, start_date, end_date, created_by) VALUES 
('PUBG Mobile Championship 2024', 'The ultimate PUBG Mobile tournament with amazing prizes!', 'PUBG Mobile', 25.00, 32, true, '2024-03-15 18:00:00', '2024-03-15 22:00:00', 1),
('Mobile Legends Spring Cup', 'Join the Spring Cup and prove your skills!', 'Mobile Legends', 15.00, 16, true, '2024-03-20 19:00:00', '2024-03-20 23:00:00', 1);

-- Insert sample teams
INSERT INTO teams (tournament_id, name, captain_id, members, status) VALUES 
(1, 'Team Alpha', 2, '["player1", "player2", "player3", "player4"]', 'approved'),
(1, 'Team Beta', 2, '["player5", "player6", "player7", "player8"]', 'pending');

-- Insert sample payments
INSERT INTO payments (team_id, amount, status, qr_code_data) VALUES 
(1, 25.00, 'verified', 'payment_qr_data_1'),
(2, 25.00, 'pending', 'payment_qr_data_2');
