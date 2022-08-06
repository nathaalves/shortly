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

// await connection.query('DROP TABLE sessions')
// await connection.query('DROP TABLE urls')
// await connection.query('DROP TABLE users')

await connection.query(`
    CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        "createdAt" DATE NOT NULL DEFAULT NOW()
    )
`)

await connection.query(`
    CREATE TABLE IF NOT EXISTS sessions (
        id SERIAL PRIMARY KEY,
        "userId" INTEGER NOT NULL REFERENCES users(id),
        token TEXT NOT NULL,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
    )
`)

await connection.query(`
    CREATE TABLE IF NOT EXISTS urls (
        id SERIAL PRIMARY KEY,
        url TEXT NOT NULL,
        "shortUrl" VARCHAR(21) NOT NULL,
        "userId" INTEGER NOT NULL REFERENCES users(id),
        "visitCount" INTEGER NOT NULL DEFAULT 0,
        "createdAt" DATE NOT NULL DEFAULT NOW()
    )
`)

export default connection;
