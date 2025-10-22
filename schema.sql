-- Geo Arena Database Schema
-- Compatible with PostgreSQL and MySQL

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL,
    role VARCHAR(20) DEFAULT 'user' CHECK (role IN ('user', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tournaments table
CREATE TABLE tournaments (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    game_name VARCHAR(100) NOT NULL,
    entry_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    max_teams INTEGER NOT NULL DEFAULT 16,
    registration_open BOOLEAN DEFAULT true,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER REFERENCES users(id)
);

-- Teams table
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    tournament_id INTEGER NOT NULL REFERENCES tournaments(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    captain_id INTEGER NOT NULL REFERENCES users(id),
    members JSONB DEFAULT '[]'::jsonb,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'winner')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(tournament_id, name)
);

-- Payments table
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
    payment_code UUID DEFAULT gen_random_uuid(),
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'verified', 'rejected')),
    qr_code_data TEXT,
    verified_at TIMESTAMP,
    verified_by INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_tournaments_registration_open ON tournaments(registration_open);
CREATE INDEX idx_tournaments_start_date ON tournaments(start_date);
CREATE INDEX idx_teams_tournament_id ON teams(tournament_id);
CREATE INDEX idx_teams_captain_id ON teams(captain_id);
CREATE INDEX idx_payments_team_id ON payments(team_id);
CREATE INDEX idx_payments_code ON payments(payment_code);

-- Add constraints
ALTER TABLE tournaments ADD CONSTRAINT check_dates CHECK (end_date > start_date);
ALTER TABLE tournaments ADD CONSTRAINT check_entry_fee CHECK (entry_fee >= 0);
ALTER TABLE tournaments ADD CONSTRAINT check_max_teams CHECK (max_teams > 0);
