name: 13 - Using Caching

on:
  workflow_dispatch:

jobs:
  pre-flow:
    name: Pre Flow
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: react-app

    steps:
      - name: Checkouts
        uses: actions/checkout@v3

      - name: Cache npm
        uses: actions/cache@v3
        with:
          path: ~/.npm
          key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}

      - name: Install npm dependencies
        run: npm install

      - name: test
        run: npm run test a

      - name: Build
        run: npm run build