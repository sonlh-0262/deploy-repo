Blog: https://www.culescoding.space/blog/setup-eslint-prettier-with-typescript-and-react

### Install `typescript`

```
touch tsconfig.json
yarn add --dev typescript @types/react
```

- Setup to use absolute import

```
# add this config in tsconfig.json
"compilerOptions": {
  "baseUrl": "src/"
},
"include": ["src/"]
```

### Install `eslint`
Find and fix problems in your JavaScript code

```
yarn global add eslint

eslint --init
```

### Install `prettier`
opinionated code formatter

```
yarn add --dev eslint-config-prettier prettier

# Change config eslint to use prettier
# file .eslintrc.json
# add "prettier" in extends

# Add config to file config `.prettierrc.json`
# basic config
{
  "singleQuote": true,
  "useTabs": true,
  "tabWidth": 1,
  "semi": false,
  "jsxSingleQuote": true,
  "arrowParens": "avoid"
}
```
