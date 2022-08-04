import dbRequest from '../database/dbRequest.js'
import pkg from "jsonwebtoken";

export async function signIn (req, res) {
    
    const { id, name } = res.locals.user;
    const { sign } = pkg;
    
    try {
        
        const token = sign(
            { id, name },
            process.env.JWT_SECRET, 
            {
                subject: `${id}`,
                expiresIn: process.env.JWT_EXPIRES_IN
            }
        );

        await dbRequest.createSession(id, token);
        
        res.status(200).send({ token })

    } catch (error) {
        res.sendStatus(500)
    }
}
