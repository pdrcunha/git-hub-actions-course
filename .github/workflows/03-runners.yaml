name: 03- Runners

on: push


jobs: 
  echo-linux:
    runs-on: ubuntu-latest
    steps:
      - name: Show runner
        run: echo runner":" ${{runner.os}}

  echo-win:
    runs-on: windows-latest
    steps:
      - name: Show runner
        run: echo runner":" ${{runner.os}}
