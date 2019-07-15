# wsl-setup-bashrc

A collection of snippets for WSL 2 ```~/.bashrc```.

The below snippets can be installed [manually](#manual) or by the [automated script](#automated).

<br id="snippets">

## Snippets

#### directory
Changes to default working directory of current Windows user when opening a new session. [View script source code](./snippets/directory.sh)

#### ip
Outputs the current ip address of the WSL instance when opening a new session. [View script source code](./snippets/ip.sh)

#### docker
Autostarts the docker service (if needed) when opening a new session. [View script source code](./snippets/docker.sh)


<br id="manual">

### Manual

1. Open .bashrc for editing:
    ```bash
    nano ~/.bashrc
    ```
1. Copy & paste the desired script to the end of the file.
1. Hit **CTRL + X**.
1. Confirm/discard your changes with **Y** or **N** key. 
1. Hit **ENTER**.

<br id="automated">

### Automated

1.  Run setup script with desired flags [(see snippets)](#snippets):
    ```bash
    # Single script:
    bash setup.sh --directory
    
    # Multiple scripts:
    bash setup.sh --directory --ip --docker
    ```