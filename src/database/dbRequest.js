import connection from "./postgres.js";

const dbRequest = {

    insertUser: async function (name, email, pwdHash, createdAt) {
        await connection.query(`
            INSERT INTO users (id, name, email, password, "createdAt") 
            VALUES (default, $1, $2, $3, $4)`,
            [name, email, pwdHash, createdAt]
        );
    },

    isUserAlredyRegistered: async function (email) {

        const { rows: [ existingUser ] } = await connection.query(`
            SELECT * FROM users 
            WHERE email = $1
        `,[email]);
        console.log(existingUser)
        if (existingUser) return true;
        console.log(1)
        return false
    }
}

export default dbRequest;