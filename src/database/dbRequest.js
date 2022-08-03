import connection from "./postgres.js";

const dbRequest = {

    insertUser: async function (name, email, pwdHash, createdAt) {
        await connection.query(`
            INSERT INTO users (id, name, email, password, "createdAt") 
            VALUES (default, $1, $2, $3, $4)`,
            [name, email, pwdHash, createdAt]
        );
    },

    findUserByEmail: async function (email) {

        const { rows: [ user ] } = await connection.query(`
            SELECT * FROM users 
            WHERE email = $1
        `,[email]);

        return user
    },

    createSession: async function (id, token, createdAt) {
        await connection.query(`
            INSERT INTO sessions (id, "userId", token, "createdAt") 
            VALUES (default, $1, $2, $3)`, 
            [id, token, createdAt]
        );
    },

    findUrl: async function (value) {
        
        if (typeof(value) === 'number') {
            
            const { rows: [ url ]} = await connection.query(`
                SELECT * FROM urls
                WHERE id = $1
            `, [value]);

            return url;
        }

        if (typeof(value) === 'string') {
            
            const { rows: [ url ]} = await connection.query(`
                SELECT * FROM urls
                WHERE "shortUrl" = $1
            `, [value]);

            return url;
        }
    }
}

export default dbRequest;