import connection from "../database/postgres.js";
import pkg from "jsonwebtoken";
import dayjs from "dayjs";

export async function signIn (req, res) {
    
    const { id, name } = res.locals.user;
    const createdAt = dayjs().format('YYYY-MM-DD');
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

        await connection.query(`
            INSERT INTO sessions (id, "userId", token, "createdAt") 
            VALUES (default, $1, $2, $3)`, 
            [id, token, createdAt]
        );
        
        res.status(200).send({ token })

    } catch (error) {
        res.sendStatus(500)
    }
}
