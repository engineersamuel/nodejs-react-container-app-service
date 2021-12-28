# Introduction

In this document we'll focus on running only the backend part of the solution.

- [Introduction](#introduction)
  - [Getting Started](#getting-started)
    - [`npm run test`](#npm-run-test)
  - [Running in Production](#running-in-production)
  - [Deploy to Azure](#deploy-to-azure)
  - [Running locally](#running-locally)

## Getting Started

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

Use node v16, install dependencies, and start node.js.

```text
nvm install v16.13.1
nvm use v16.13.1
npm i
npm run dev
```

Ensure there are no errors when starting the backend.

### `npm run test`

Executes unit tests against the backend.

## Running in Production

- Optionally set the env var `PORT`, ex. `PORT="3000"`, this is unecessary locally and in Azure App Service.

## Deploy to Azure

This is handled by CI/CD and deployed docker images, TBD.

## Running locally

If you are deploying locally against a local filesystem, then remember this is just a node app that's hosting a static site (the frontend).

```bash
mkdir backend/public
cd frontend
npm run build
cp -R build/* ../backend/public/
npm run build
npm run start
```
