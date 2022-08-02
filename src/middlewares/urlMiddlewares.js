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