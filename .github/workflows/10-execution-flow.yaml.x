name: 10 - Controlling the Execution Flow

on:
  workflow_dispatch:
    inputs:
      pass-unit-tests:
        description: "Should unit tests pass?"
        default: true
        type: boolean


jobs:
  lint-build:
    runs-on: ubuntu-latest
    steps:
      - name: lint-build
        run: echo "Linting and building project"

  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - name: unit-tests
        run: echo "Running tests..."

      - name: unit-tests-fail
        continue-on-error: true
        if: ${{!inputs.pass-unit-tests}}
        run: |
          echo "Failing tests..."
          exit 1

  deploy-nonprod:
    name: deploy-nonprod
    runs-on: ubuntu-latest
    needs: [lint-build, unit-tests]
    steps:
      - name: Deploying to nonprod
        run: echo "Deploying to nonprod..."


  e2e-tests:
    name: e2e-tests
    runs-on: ubuntu-latest
    needs: deploy-nonprod
    steps:
      - name: Running E2E
        run: echo "Running E2E tests..."

  load-tests:
    name: load-tests
    runs-on: ubuntu-latest
    needs: deploy-nonprod
    steps:
      - name: Load tests
        run: echo "Running load tests..."

  deploy-prod:
    name: deploy-prod
    runs-on: ubuntu-22.04
    needs: [e2e-tests, load-tests]
    steps:
      - name: Build
        run: echo "Deploying to prod..."