name: 01 - Build - Blocks

on: push

jobs: 
  echo-hello:
    runs-on: ubuntu-latest
    steps:
      - name: Say Hello
        run: echo "hello world"

  succes-code:
    runs-on: ubuntu-latest
    steps:
      - name: Success
        run: |
          echo Success
          exit 0
      - name: Say Goodbye
        run: echo "Goodbye"
