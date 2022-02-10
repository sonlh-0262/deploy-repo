### Web identity federation

With web identity federation, you don't need to create custom sign-in code or manage your own user identities. Instead, users of your app can sign in using a well-known external identity provider (IdP), such as Login with Amazon, Facebook, Google, or any other OpenID Connect (OIDC)-compatible IdP. They can receive an authentication token, and then exchange that token for temporary security credentials in AWS that map to an IAM role with permissions to use the resources in your AWS account

interacts with a web IdP, such as Facebook, and then calls the AssumeRoleWithWebIdentity API to trade the authentication token you get from those IdPs for AWS temporary security credentials

use Amazon Cognito

IdP

identity provider (IdP), such as Login with Amazon, Facebook, Google, or any OpenID Connect (OIDC)-compatible IdP
