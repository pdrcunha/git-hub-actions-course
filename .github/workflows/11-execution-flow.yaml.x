name: 11 - Working with Inputs

on:
  workflow_dispatch:
    inputs:
      dry-run:
        description: "Skip deployment and only print build output"
        required: false
        type: boolean
        default: false
      target:
        description: "Which environment the workflow will target"
        required: true
        type: choice
        options:
          - development
          - staging
          - production
      tag:
        description: "Release from which to build and deploy"
        required: false
        type: choice
        options:
          - v1
          - v2
          - v3
        default: v3

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - name: Build
        run: echo "Building from tag ${{ github.event.inputs.tag }}"

  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    needs: build
    if: ${{ github.event.inputs.dry-run == 'false' }}
    steps:
      - name: Deploy
        env:
          TARGET_ENV: ${{ github.event.inputs.target }}
        run: echo "Deploying to $TARGET_ENV"
