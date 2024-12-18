name: 04- Action - Build - React

on: push


jobs: 
  react-build:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: react-app
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Node
        uses: actions/setup-node@v4
        with:
          node-version: 20
      - name: Install react and set work-dir
        run: |
          npm install
      - name: Test React
        run: |
          npm run test a
      - name: Buid React
        run: |
          npm run build
