import connection from "../database/postgres.js";


export async function getUserInformations (req, res) {

    const { id, name } = res.locals.user;

    try {
        
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

        res.status(200).send({
            id,
            name,
            visitCount,
            shortenedUrls
        });

    } catch (error) {
        res.sendStatus(500);
    }
}