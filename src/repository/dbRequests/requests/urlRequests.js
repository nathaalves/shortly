import connection from "../../../database/postgres.js";

const urlRequests = {

    createUrl: async function (url, shortUrl, userId) {

        await connection.query(`
            INSERT INTO urls (id, url, "shortUrl", "userId", "createdAt") 
            VALUES (default, $1, $2, $3, default)
        `, [url, shortUrl, userId]);
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

    updateCount: async function (urlId) {

        await connection.query(`
            UPDATE urls 
            SET "visitCount" = "visitCount" + 1 
            WHERE id = $1
        `,[urlId]);
    },

    deleteUrl: async function (urlId) {

        await connection.query(`
            DELETE FROM urls WHERE id = $1
        `, [urlId]);
    }
};

export default urlRequests;