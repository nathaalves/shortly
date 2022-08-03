import { nanoid } from "nanoid";
import connection from "../database/postgres.js";
import dayjs from "dayjs";

export async function handleUrl (req, res) {
    
    const token = res.locals.token;
    const { url } = req.body;
    const shortUrl = nanoid();
    const createdAt = dayjs().format('YYYY-MM-DD');

    try {
        
        const { rows: [{ userId }]} = await connection.query(`
            SELECT "userId" 
            FROM sessions 
            WHERE token = $1
        `, [token]);

        await connection.query(`
            INSERT INTO urls (id, url, "shortUrl", "userId", "createdAt") 
            VALUES (default, $1, $2, $3, $4)
        `, [url, shortUrl, userId, createdAt]);

        res.sendStatus(201);

    } catch (error) {
        res.sendStatus(500);
    }
}

export async function getUrl (req, res) {

    const url = res.locals.url;
    delete url.userId;

    res.status(200).send(url);
}

export async function openUrl (req, res) {

    const { id, url } = res.locals.url;
    
    try {
        await connection.query(`
            UPDATE urls 
            SET "visitCount" = "visitCount" + 1 
            WHERE id = $1
        `,[id]);
        
        res.redirect(200, url);

    } catch (error) {
        res.sendStatus(500);
    }
}