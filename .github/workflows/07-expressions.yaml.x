name: 07 - Expression

on: 
  push:
  workflow_dispatch:
    inputs:
      debug:
        type: boolean
        default: false
        description: Debug entry  

jobs: 
  All_Jobs:
    runs-on: ubuntu-latest
    steps:
      - name: Debug on true
        if: ${{ inputs.debug }}
        run: |
          echo "Debug mode is enabled"
          echo autor: ${{github.actor}}
      - name: Debug on true AND DISPATH
        if: ${{ inputs.debug && github.event_name == 'workflow_dispatch'}}
        run: |
          echo "Debug mode is enabled"
          echo "Running in ${{github.event_name}}"
      - name: Debug on false
        if: ${{ !inputs.debug }}
        run: echo false debug
      - name: Build
        run: echo build.