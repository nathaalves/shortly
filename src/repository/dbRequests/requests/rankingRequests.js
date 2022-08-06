import connection from "../../../database/postgres.js";

const rankingRequests = {

    getRanking: async function () {

        const { rows: ranking } = await connection.query(`
            SELECT 
                users.id AS id, 
                users.name AS name, 
                COALEsCE(COUNT(urls)::INTEGER,0) AS "linksCount", 
                COALEsCE(SUM("visitCount")::INTEGER,0) AS "visitCount"
            FROM users
            LEFT JOIN urls
            ON users.id = urls."userId"
            GROUP BY users.id
            ORDER BY "visitCount" DESC
            LIMIT 10
        `);
        
        return ranking;
    }
};

export default rankingRequests;
