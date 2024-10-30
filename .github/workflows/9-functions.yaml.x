name: 09 - Functions

on:
  pull_request:
  workflow_dispatch:


jobs:
  echoOne:
    runs-on: ubuntu-latest
    steps:
      - name: Sleep for 10 seconds
        run: |
          sleep 10
          
      - name: Print PR title
        if: ${{ github.event_name == 'pull_request' }}
        run: |
          echo "PR Title: ${{ github.event.pull_request.title }}"

      - name: Print PR labels
        if: ${{ github.event_name == 'pull_request' }}
        run: |
          echo "PR Labels:"
          echo "${{ github.event.pull_request.labels[*].name }}"

      - name: Bug step
        if: ${{ failure() || contains(github.event.pull_request.title, 'fix') }}
        run: echo "I am a bug fix"

      - name: Failing
        run: |
          exit 1
      
      - name: I will be skipped
        if: ${{ success() }}
        run: echo "Print if success if last steps running and ok"

      - name: If Fail
        if: ${{failure()}}
        run: echo "Print if fail if last steps"

      - name: Always print
        if: ${{always()}}
        run: |
          echo "Always"

      - name: IF Canceled
        if: ${{cancelled()}}
        run: |
            echo "Print if Canceled job"      