import connection from "../database/postgres.js";
import { compare } from "bcrypt";
import joi from "joi";

export async function checkCredentials (req, res, next) {

    const signinSchema = joi.object({
        email: joi.string().email().required(),
        password: joi.string().required()
    });

    const { error } = signinSchema.validate(req.body);
    if (error) return res.status(422).send(error.details.map( err => err.message))
    
    const { email, password } = req.body;
    
    try {
        
        const { rows: [ existingUser ] } = await connection.query(`
            SELECT * FROM users 
            WHERE email = $1`, 
            [email]
        );
        if (!existingUser) return res.sendStatus(401);

        const passwordMatch = await compare(password, existingUser.password);
        if (!passwordMatch) return res.sendStatus(401);
        
        const { id, name } = existingUser;
        res.locals.user = { id, name };
        
        next();

    } catch (error) {
        res.sendStatus(500);
    }
}

export async function validateToken (req, res, next) {

    const { authorization } = req.headers;
    if (!authorization) return res.sendStatus(401);

    const [,token] = authorization.split(' ');
    if(!token) return res.sendStatus(401);

    res.locals.token = token;
    
    next();
}