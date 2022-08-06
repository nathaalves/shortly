import dbRequest from '../repository/dbRequests/dbRequest.js';
import joi from 'joi';

export async function validateUrl (req, res, next) {

    const urlSchema = joi.object({
        url: joi.string().regex(/^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,}))\.?)(?::\d{2,5})?(?:[/?#]\S*)?$/i).required()
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
    if (!isNaN(Number(id))) value = Number(id);
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
