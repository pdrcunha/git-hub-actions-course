name: 12 - Working with Outputs

on:
  workflow_dispatch:
    inputs:
      build-status:
        description: "Build status to simulate success or failure"
        required: true
        type: choice
        options:
          - success
          - failure
        default: success

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - name: Print GITHUB_OUTPUT path
        run: |
          echo "GITHUB_OUTPUT path is: $GITHUB_OUTPUT"

      - name: Set build status
        id: build
        run: |
          echo "status=${{ github.event.inputs['build-status'] }}" >> $GITHUB_OUTPUT

    outputs:
      build-status: ${{ steps.build.outputs.status }}

  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    needs: build
    if: ${{ needs.build.outputs.build-status == 'success' }}
    steps:
      - name: Deploy
        run: echo "Deploying"
