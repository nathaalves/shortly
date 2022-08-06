import connection from "../../../database/postgres.js";

const userRequests = {

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
            `, [value]);

            return user;
        }
    },

    userInformations: async function (userId) {

        const { rows: shortenedUrls } = await connection.query(`
            SELECT id, "shortUrl", url, "visitCount"
            FROM urls
            WHERE "userId" = $1
        `, [userId]);

        const { rows: [{ id, name, visitCount }]} = await connection.query(`
            SELECT 
                users.id, 
                users.name, 
                SUM(urls."visitCount")::INTEGER AS "visitCount"
            FROM users
            JOIN urls
            ON users.id = urls."userId"
            WHERE "userId" = $1
            GROUP BY users.id
        `, [userId]);

        return {
            id,
            name,
            visitCount,
            shortenedUrls
        };
    }
};

export default userRequests;
