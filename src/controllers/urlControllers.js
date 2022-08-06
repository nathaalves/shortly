import { nanoid } from "nanoid";
import dbRequest from "../repository/dbRequests/dbRequest.js";

export async function handleUrl (req, res) {
    
    const { user } = res.locals;
    const { url } = req.body;
    const shortUrl = nanoid();
    
    try {

        await dbRequest.createUrl(url, shortUrl, user.id);

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
        
        await dbRequest.updateCount(id);
        
        res.redirect(200, url);

    } catch (error) {
        res.sendStatus(500);
    }
}

export async function deleteUrl (req, res) {

    const { id } = res.locals.url;
    
    try {
        
        await dbRequest.deleteUrl(id);

        res.sendStatus(204);

    } catch (error) {
        res.sendStatus(500);
    }
}
