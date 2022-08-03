import connection from "./postgres.js";

const dbRequest = {

    createUser: async function (name, email, pwdHash, createdAt) {
        await connection.query(`
            INSERT INTO users (id, name, email, password, "createdAt") 
            VALUES (default, $1, $2, $3, $4)`,
            [name, email, pwdHash, createdAt]
        );
    },

    findUser: async function (value) {

        
        if (typeof(value) === 'number') {
            
            const { rows: [ user ]} = await connection.query(`
                SELECT * FROM users
                WHERE id = $1
            `, [value]);

            return user;
        }

        if (typeof(value) === 'string') {
            
            const { rows: [ user ] } = await connection.query(`
            SELECT * FROM users 
            WHERE email = $1
            `,[value]);

            return user
        }
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
    },

    userInformations: async function (id) {

        const { rows: shortenedUrls } = await connection.query(`
        SELECT id, "shortUrl", url, "visitCount"
        FROM urls
        WHERE "userId" = $1
        `, [id]);

        const { rows: [{ sum: visitCount }]} = await connection.query(`
            SELECT SUM("visitCount")::INTEGER
            FROM urls
            WHERE "userId" = $1
        `, [id]);

        return {
            shortenedUrls,
            visitCount
        }

    }
    
}

export default dbRequest;