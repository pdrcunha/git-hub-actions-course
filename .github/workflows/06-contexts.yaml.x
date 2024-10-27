name: 06 - Context

on: push
env:
  POTATO: potato


jobs: 
  echo-data:
    runs-on: ubuntu-latest
    steps:
      - name: Echo
        run: |
          echo Event: ${{github.event_name}} 
          echo ref: ${{github.ref}}
          echo SHA: ${{github.sha}}
          echo actor: ${{github.actor}}
      - name: Retrieve VAR
        run: |
          echo myvar: ${{vars.MY_VAR}}
      - name: Echo initial env
        run: |
          echo ${{env.POTATO}}
      - name: Change var
        run: |
          echo "POTATO=tomato" >> $GITHUB_ENV
      - name: echo changed var
        run: |
          echo ${{env.POTATO}}