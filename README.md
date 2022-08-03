# Scala.IO conferences website

This repository host the code for the website: https://scala.io/.

## Getting started

To develop you will need to host the website in local.

1) You first have to install all the packages:
```bash
npm install
```

2) You then have to run the following command to start the website locally:
```bash
npm run dev
```

3) Then launch it from here : 

```bash
http://localhost:1234
```

## Tips

You can use [Elm](https://elm-lang.org/) to generate the static website : 

```bash
npm run build
```

## Deployment preprod / prod

When you push to master, it always deploy to preprod.

When you are satisfied with the website in preprod (https://preprod.scala.io/), you can run the following command to 
forward changed to prod:

```bash
make deploy
```

The changes will be forwarded to https://scala.io/.