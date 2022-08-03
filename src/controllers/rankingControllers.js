import connection from '../database/postgres.js'

export async function getRanking (req, res) {

    try {
        
        const { rows: ranking } = await connection.query(`
            SELECT 
                users.id AS id, 
                users.name AS name, 
                COUNT(urls)::INTEGER AS "linksCount", 
                SUM("visitCount")::INTEGER AS "visitCount"
            FROM users
            JOIN urls
            ON users.id = urls."userId"
            GROUP BY users.id
            ORDER BY "visitCount" DESC
            LIMIT 10
        `);

        res.status(200).send(ranking);

    } catch (error) {
        res.sendStatus(500);
    }
}
