import joi from 'joi';
import dbRequest from '../repository/dbRequests/dbRequest.js';

export default async function validateInformations (req, res, next) {

    const signupSchema = joi.object({
        name: joi.string().required(),
        email: joi.string().email().required(),
        password: joi.string().required(),
        confirmPassword: joi.string().required()
    });
    
    const { error } = signupSchema.validate(req.body, {abortEarly: false});
    if (error) {
        const messages = error.details.map( err => err.message);
        return res.status(422).send(messages);
    }
    
    const { email, password, confirmPassword } = req.body;

    if (password !== confirmPassword) return res.status(422).send("Password does not match");

    try {

        const isRegistered = await dbRequest.findUser(email);
        if (isRegistered) return res.sendStatus(409);
    
        next();
        
    } catch (error) {
        res.sendStatus(500);
    }
}
