import { CognitoIdentityProviderClient, AdminGetUserCommand, SignUpCommand } from "@aws-sdk/client-cognito-identity-provider";
const client = new CognitoIdentityProviderClient({ region: 'us-east-1' });

export const adminGetUser = ({ userPoolId, username }) => {
  const command = new AdminGetUserCommand({
    UserPoolId: userPoolId,
    Username: username,
  });

  return client.send(command);
};

export const signUp = ({ clientId, username, password, name, email }) => {
  const UserAttributes = [];
  if (name) { UserAttributes.push({ Name: "name", Value: name }) }
  if (email) { UserAttributes.push({ Name: "email", Value: email }) }

  const command = new SignUpCommand({
    ClientId: clientId,
    Username: username,
    Password: password,
    UserAttributes,
  });

  return client.send(command);
};
