import connection from "../../../database/postgres.js";

const authRequests = {

    createUser: async function (name, email, pwdHash) {

        await connection.query(`
            INSERT INTO users (id, name, email, password, "createdAt") 
            VALUES (default, $1, $2, $3, default)
        `, [name, email, pwdHash]);
    },

    createSession: async function (id, token) {

        await connection.query(`
            INSERT INTO sessions (id, "userId", token, "createdAt") 
            VALUES (default, $1, $2, default)`, 
            [id, token]
        );
    }
};

export default authRequests;
