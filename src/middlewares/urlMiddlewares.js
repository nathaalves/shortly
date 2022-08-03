import joi from 'joi';
import connection from '../database/postgres.js';

export async function validateUrl (req, res, next) {

    const urlSchema = joi.object({
        url: joi.string().uri().required()
    });

    const { error } = urlSchema.validate(req.body);
    if (error) {
        const message = error.details.map( err => err.message);
        return res.status(422).send(message);
    }

    next();
}

export async function verifyIfUrlExists (req, res, next) {

    const urlId = req.params.id;
    const shortUrl = req.params.shortUrl;
    
    let url = null;

    try {
        
        if (urlId) {

            const { rows: [ data ]} = await connection.query(`
                SELECT * FROM urls
                WHERE id = $1
            `, [urlId]);

            url = data;
        }

        if (shortUrl) {
            
            const { rows: [ data ]} = await connection.query(`
                SELECT * FROM urls
                WHERE "shortUrl" = $1
            `, [shortUrl]);
            
            url = data;
        }
        
        if(!url) return res.sendStatus(404);
    
        res.locals.url = url;
        
        next();

    } catch (error) {
        res.sendStatus(500);
    }
}

export async function checkUrlBelongsUser (req, res, next) {

    const { user, url } = res.locals;
    
    if (user.id !== url.userId) return res.sendStatus(401);

    next();
}
