import connection from "../database/postgres.js";

export async function checkUserExists (req, res, next) {

    const { id } = res.locals.user;
    
    try {
        
        const { rows: [ user ]} = await connection.query(`
            SELECT * FROM users
            WHERE id = $1
        `, [id]);
        if (!user) return res.sendStatus(404);

        next();

    } catch (error) {
        res.sendStatus(500);
    }
}