name: 02 - Workflow - events

on: 
  pull_request:
  workflow_dispatch: 


jobs: 
  echo-trigger:
    runs-on: ubuntu-latest
    steps:
      - name: Show the trigger
        run: echo I am run been ${{github.event_name}}
