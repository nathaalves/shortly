import dotenv from 'dotenv';
import pkg from 'pg';

dotenv.config();

const { Pool } = pkg;

const connection = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false
    }
});

await connection.query(`
    CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        "createdAt" DATE NOT NULL
    )
`)

await connection.query(`
    CREATE TABLE IF NOT EXISTS sessions (
        id SERIAL PRIMARY KEY,
        "userId" INTEGER NOT NULL REFERENCES users(id),
        token TEXT NOT NULL,
        "createdAt" DATE NOT NULL
    )
`)

// await connection.query('DROP TABLE users')
// await connection.query('DROP TABLE sessions')

export default connection;