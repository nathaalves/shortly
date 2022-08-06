import dbRequest from '../repository/dbRequests/dbRequest.js';
import joi from 'joi';

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

    const {id, shortUrl} = req.params;
    
    let value = null;
    if (id) value = Number(id);
    if (shortUrl) value = shortUrl;
    
    try {
        
        const urlFound = await dbRequest.findUrl(value);
        if(!urlFound) return res.sendStatus(404);
        
        res.locals.url = urlFound;
        
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
