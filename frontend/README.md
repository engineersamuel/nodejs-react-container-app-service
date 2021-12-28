# Introduction

In this document we'll focus on running only the frontend part of the solution.

- [Introduction](#introduction)
  - [Getting Started](#getting-started)
  - [Troubleshooting](#troubleshooting)

## Getting Started

Use node v16, if using [nvm](https://github.com/nvm-sh/nvm) then:

```text
nvm install v16.13.1
nvm use v16.13.1
```

Then install dependencies and start the frontend:

```text
npm i
npm run start
```

## Troubleshooting

- When running in production, if there are styling issues, ensure that you are running styled-components 5.2.3.  There are currently known issues with 5.3.  You can see the version being used by running `npm ls styled-components`.
