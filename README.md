<<<<<<< HEAD
# Geo Arena - Mobile Game Tournament Platform

A full-stack platform for organizing mobile game tournaments like PUBG Mobile and Mobile Legends.

## Features

- User registration and authentication
- Tournament creation and management
- Team registration with QR code payments
- Admin dashboard for tournament control
- Payment verification system
- Modern responsive UI

## Tech Stack

- **Frontend**: Next.js 14, React, TailwindCSS
- **Backend**: Node.js, Express, JWT
- **Database**: PostgreSQL
- **Authentication**: JWT with bcrypt password hashing

## Quick Start

### Prerequisites

- Node.js 18+
- PostgreSQL 12+
- npm or yarn

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   cd backend && npm install
   cd ../frontend && npm install
   ```

3. Set up the database:
   ```bash
   # Create a PostgreSQL database
   createdb geo_arena
   
   # Import the schema
   psql geo_arena < schema.sql
   
   # Import sample data
   psql geo_arena < seed.sql
   ```

4. Configure environment variables:
   ```bash
   cp backend/env.example backend/.env
   # Edit backend/.env with your database credentials
   ```

5. Start the development servers:
   ```bash
   npm run dev
   ```

The application will be available at:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000

## Default Accounts

**Admin Account:**
- Email: admin@geoarena.com
- Password: admin123

**User Account:**
- Email: user@example.com
- Password: user123

## Project Structure

```
geo-arena/
├── frontend/          # Next.js frontend application
├── backend/           # Express.js backend API
├── schema.sql         # Database schema
├── seed.sql          # Sample data
└── README.md         # This file
```

## API Endpoints

### Authentication
- POST /api/auth/register
- POST /api/auth/login
- POST /api/auth/logout

### Tournaments
- GET /api/tournaments
- GET /api/tournaments/:id
- POST /api/tournaments (admin only)
- PUT /api/tournaments/:id (admin only)
- DELETE /api/tournaments/:id (admin only)

### Teams
- POST /api/teams/register
- GET /api/teams/my-teams
- GET /api/teams/tournament/:tournamentId

### Payments
- POST /api/payments/generate-qr
- GET /api/payments/:paymentId
- PUT /api/payments/:paymentId/verify (admin only)

## Deployment

1. Build the frontend:
   ```bash
   npm run build
   ```

2. Set production environment variables in your hosting platform

3. Deploy both frontend and backend to your hosting service

4. Import the database schema to your PostgreSQL instance
"# GeoArena" 
"# GeoArena" 
=======
# GeoArena
>>>>>>> f00d2096303aa1680f3d770cc2d5bf08937156bb
