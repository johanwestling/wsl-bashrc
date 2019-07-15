# wsl-setup-bashrc

A collection of snippets for WSL 2 ```~/.bashrc```.

The below snippets can be installed [manually](#manual) or by the [automated script](#automated).

<br id="snippets">

## Snippets

#### directory
Changes the default working directory of WSL to the Windows users home directory. [View script source code](./snippets/directory.sh)

#### docker
Autostarts the docker service when entering WSL. [View script source code](./snippets/docker.sh)


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
    bash setup.sh --directory --docker
    ```