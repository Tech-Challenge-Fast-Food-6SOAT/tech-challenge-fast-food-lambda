import { getUser } from './src/getUser.js';
import { signUpUser } from './src/signUpUser.js';

export const handler = async (event) => {
  const authResponse = {
    "principalId": "lanchonete",
    "policyDocument":
    {
      "Version": "2012-10-17",
      "Statement":
        [
          {
            "Action": "execute-api:Invoke",
            "Resource": event["methodArn"],
            "Effect": "Allow"
          }
        ]
    },
  }

  console.info('event', event)

  const { authentication, cpf: rawcpf, email, name } = event.headers;
  console.info('AUTHENTICATION', authentication)
  console.info("NAME:", name)
  console.info("EMAIL:", email)
  console.info("CPF:", rawcpf)

  const hasAuthentication = authentication === "true"

  if (!hasAuthentication || !rawcpf ) return authResponse;

  const cpf = rawcpf.replace(/\D/g, '');
  if (cpf.length !== 11) return authResponse;

  const user = await getUser(cpf);
  console.info("USER:", user);
  
  if (!user) await signUpUser({ cpf, email, name });

  return authResponse;
};
