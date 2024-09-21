import { signUp } from './aws.js';
import { randomUUID } from 'node:crypto';
import { config } from './config.js';

export const signUpUser = async ({ cpf, email, name }) => {
    try {
        await signUp({
            clientId: config.CLIENT_ID,
            username: cpf,
            email,
            name,
            password: randomUUID(),
        });
    } catch (error) {
        console.error(error.message);
    }
};
