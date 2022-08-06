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
        };
    }
};

export default userRequests;
