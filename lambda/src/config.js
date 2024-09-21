import { env } from 'node:process';

export const config = {
    CLIENT_ID: env['CLIENT_ID'],
    USER_POOL_ID: env['USER_POOL_ID'],
};
