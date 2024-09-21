import { adminGetUser } from './aws.js';
import { config } from './config.js';

export const getUser = async (cpf) => {
    try {
        const user = await adminGetUser({
            userPoolId: config.USER_POOL_ID, 
            username: cpf
        })
        return user;
    } catch (error) {
        return null;
    }
};
