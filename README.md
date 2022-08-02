# Scala.IO conferences website

This repository host the code for the website: https://scala.io/.

## Getting started

To develop you will need to host the website in local.

You first have to install all the packages:
```bash
npm install
```

You then have to run the following command to start the website locally:
```bash
npm run dev
```

Then launch it from here : 

```bash
http://localhost:1234
```

## Tips

You can use [Elm](https://elm-lang.org/) to generate the static website : 
```bash
npm build
```

## Deployment preprod / prod

To deploy scalaio's website on clever, following steps below front root folder: 

1) be sure that last version of css file has been built by tailwinCss. 
       (to achive that use the following command :
```bash
npx tailwindcss -i ./input.css -o ./public/style.css
```
2) build the static website : 

```bash
npm build
```

3) Go into dist directory where website has been generated

_Here you have to init a git repository, and add both remotes below_

```bash
git remote add prod git+ssh://git@push-n2-par-clevercloud-customers.services.clever-cloud.com/app_aa7ba172-221d-4258-b424-56ff674d6b75.git
git remote add preprod git+ssh://git@push-n2-par-clevercloud-customers.services.clever-cloud.com/app_ac41bb13-ae16-4344-927b-4de9aaa53a69.git
```

4) Now your environment is ready to deploy.

    4.1) Add all file to index and commit them 
    4.2) Do a push force on preprod : 

```bash
git push -f preprod master
```

5) Check if all is ok on preprod here : https://preprod.scala.io
6) If all is ok, go prod! :

```bash
git push -f prod master
```

