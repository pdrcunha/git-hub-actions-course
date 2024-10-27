name: 05 - 02 - Filter Activity

on: 
  pull_request:
    branches: [main]
    types: [opened]

jobs: 
  echo-only:
    runs-on: ubuntu-latest
    steps:
      - name: Echo-oly
        run: echo Running whenever a PR is closed base branch is main    