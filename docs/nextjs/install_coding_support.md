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
