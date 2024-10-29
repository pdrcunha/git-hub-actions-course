name: 08 - Using Variables

on:
  workflow_dispatch:

env:
  WORKFLOW_VAR: 'I am a workflow environment variable'
  OVERWRITTEN: 'I will be overwritten'

jobs:
  echo:
    runs-on: ubuntu-latest
    env:
      JOB_VAR: 'I am a job environment variable'
      OVERWRITTEN: 'I was overwritten at the job level'

    steps:
      - name: Print Env Variables
        env:
          STEP_VAR: 'I am a step env var'
          step_var2: 'I am another  step var'
        run: |
          echo "Step env var: ${{env.STEP_VAR}}"
          echo "Step env var 2: ${{env.step_var2}}"
          echo "Job env var: ${{env.JOB_VAR}}"
          echo "Workflow env var: ${{env.WORKFLOW_VAR}}"
          echo "Overwritten: ${{env.OVERWRITTEN}}"

      - name: Overwrite Job Variable
        env:
          OVERWRITTEN: 'I was overwritten at the step level'
        run: |
          echo "Step env var: ${{env.OVERWRITTEN}}"
