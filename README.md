# abcd

Simple init system in bash for critical operations that must run before the actual init system.

## Usage

1. Clone the repository
2. Rename the `abcd` file to `/usr/sbin/init` or wherever your init file is located
    and make it executable.
3. Create a file `/usr/share/abcd/abcd.nextInit.conf` with the following content:

    ```
    /lib/systemd/systemd
    ```

    in case of systemd, or update the path to your init system of choice.
4. Create the directory `/usr/share/abcd/abc.d` and put your hooks in there. 
    They will be executed in alphabetical order, so it is better to prefix them
    with numbers, e.g. `000-prepare.sh`, `100-mount.sh`, `200-network.sh`, etc.
    Remember to set them as executable and to include the shebang line, for
    example:

    ```bash
    #!/bin/bash
    echo "Mounting filesystems"
    ```
5. Reboot

## Debug

All the messages are logged to dmesg, so you can check them with `dmesg | grep abcd`
from a chroot environment.

## Use of Generative AI

Maintainers may use generative AI tools as assistants while working on abcd. Non-trivial assisted commits disclose the tool, model, and scope of the work.

AI tools may assist with code comments, documentation, repetitive code, and issue triage. Maintainers make project decisions and review every assisted change before it is merged.

Use these trailers for non-trivial assisted commits:

```plain
Assisted-by: <tool>:<model-version>
AI-Scope: <what the tool generated and the prompt or a short prompt summary>
```

Single-line completions, renames, and formatting changes do not need trailers.

Coding agents must also follow [AGENTS.md](AGENTS.md) before changing files,
creating commits, or opening pull requests.
