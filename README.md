# Scala.IO conferences website

This repository host the code for the website: https://scala.io/.

## Getting started

To develop you will need to host the website in local.

You first have to install all the packages:
```bash
npm install
```

We use [Tailwind CSS](https://tailwindcss.com/) for the CSS, so you have to run:
```bash
npx tailwindcss -i ./input.css -o ./public/style.css --watch
```

You can now use [Elm](https://elm-lang.org/) to run locally the website (`watch` mode is activated) :
```bash
npm start
```
then launch it from here : 

```bash
http://localhost:1234
```

You can use [Elm](https://elm-lang.org/) to generate the static website : 
```bash
npm build
```
