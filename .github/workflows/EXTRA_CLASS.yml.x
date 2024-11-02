name: Extra class

on:
  workflow_dispatch:

jobs:
  docker-build-and-deploy:
    env: 
      IMAGE_NAME: teste.latest
      IMAGE_TAG: latest
      HOST: localhost
      USER: root
      PORT: 2222      

    runs-on: ubuntu-latest

    steps:
      - name: Check out repository
        uses: actions/checkout@v2

      - name: Lint and build project
        run: echo "Linting and building project"

      - name: Build Docker image
        run: |
            cd extra
            docker build -t $IMAGE_NAME:$IMAGE_TAG .

      - name: Save Docker image to tar file
        run: docker save -o ${IMAGE_NAME}_${IMAGE_TAG}.tar $IMAGE_NAME:$IMAGE_TAG

      - name: Save SSH Key
        run: |
          echo "-----BEGIN OPENSSH PRIVATE KEY-----" > ~/.ssh/id_rsa
          echo "AAAB3NzaC1yc2EAAAADAQABAAACAQDfP+0XjMzSXtvZATCEIEhk6F2gZdNska8oCfFMpTE+iAwbTaYeGrmlff6zafWe9ELo+9Ic/F2T6EbmmeR63a/4ncU+Pa57LA37a7h/4Hvea+rPLDCIcKnj7F2r8+ht2qLErZHp3NABXwXrZPJGgbqPM9AHzPk87SZFD1QuAOwRUqmN4cC5udgZX1TemdHxudkEjQIeio8gskPj5agpjSviwUgLt1KxrHSKUazvCL95ZZQnVYqO6D7SNG4LtwZbJ7fqTcjby+he0g7QUgHpbEPYyjMkYxXKhrY4K1s7FVmq6Gd+E0EGF+/8TOe86V3KW2KazgCy0UUpP2ifGzBceXWDmQsrFujLrXZkwDq5vV0mXjzQViYnDgkHzcbeMJuaWqy8go6x19uzdg5MqHR+BJn/9eqENXKKpE/mq2M4i42WC3RU094PF8MikPu/REbahGyn8qqoAum/Xwm9Q3jyfyBe/7hMe49kWJ0rWlJHtPO3CjAgZT2hbl727XMuINv7juH7pYPm4Z/gO0N3IVYmMR3Zu5XklhuOdiigZN68RMjjnoo7knLVNxZpNvmo41DRPIavJlw82TSzjkCCaMXG0AQWOmExDLuzrIavXBw4Msu73M0Pt4EIkARNeDja9uIdUGQl3rtJAA1dDdwAmKMfyqM5MWj4KcWL7MnorZfHGGpLlw==" >> ~/.ssh/id_rsa
          echo "-----END OPENSSH PRIVATE KEY-----" >> ~/.ssh/id_rsa
          chmod 600 ~/.ssh/id_rsa

      - name: Test SSH Connection
        run: |
          ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa -p 2222 root@localhost echo "MERDA"



          
