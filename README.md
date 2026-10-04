# dotfiles

Historically, I have had a dotfiles repository with a shell script which automated part of my setup configuration
files-process. It grew, and grew, and it became more and more difficult to keep track of everything. Not to mention the
issues I had maintaining one shell script which accommodated both macOS and Ubuntu systems. Because of this, I decided
to switch to using Ansible.

## Prerequisites

You need Ansible.

You can install Ansible according to [their
instructions](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), but I want to try my
very best to keep the default/system installation of Python completely separate from any Python shenanigans I might do
on my computer. [See PEP668](https://peps.python.org/pep-0668/).

Hence, the way I usually go about this is to:

1. Install [mise](https://mise.jdx.dev/getting-started.html)
2. Configure a user-global Python version (distinct from the system Python version)
3. Install a second, *pinned* Python that exists only to back pipx
4. Install [pipx](https://pipx.pypa.io/stable/installation/) against that pinned Python
5. Install Ansible using pipx

### Why the pinned Python

My user-global Python is `python = "latest"` in `~/.config/mise/config.toml`, which is what I want for day-to-day work.
But a venv records the *resolved* interpreter path in its `pyvenv.cfg`, not the fuzzy spec:

```
home = /home/erik/.local/share/mise/installs/python/3.14.3/bin
```

So when mise upgrades `latest` from 3.14.3 to 3.14.7 it removes the 3.14.3 install directory, and every pipx venv built
against it is left pointing at an interpreter that no longer exists. The symptom is deeply unhelpful — the shim is still
on `$PATH`, so you get this rather than a clean "command not found":

```
$ ansible-playbook --version
bash: /home/erik/.local/bin/ansible-playbook: cannot execute: required file not found
```

pipx itself is exposed the same way, since `pip install --user` puts it in a version-specific
`~/.local/lib/python3.X/site-packages`.

The fix is to give pipx an **exact** version of its own. mise never moves an exact version, only fuzzy specs like
`latest`, so the install directory stays put no matter how often `latest` churns. I deliberately pick a different *minor*
release from the one `latest` tracks, so the two can never collide.

### Bootstrap

```bash
# Install mise and reload shell
curl https://mise.run | sh  # add the following to your .bashrc: eval "$(mise activate bash)"
exec $SHELL -l

# Install the latest Python interpreter and make it the default for your user
mise use -g python

# Install the pinned Python that backs pipx. Note the exact version, and note
# that this is `mise install`, not `mise use` -- it must NOT become the global
# default, it just needs to exist at a stable path.
mise install python@3.13.15

# Point pipx at it, for this shell and for every future one
cat > ~/.sources.d/40-pipx.sh <<'EOF'
_pipx_python="$HOME/.local/share/mise/installs/python/3.13.15/bin/python3"
if [ -x "$_pipx_python" ]; then
  export PIPX_DEFAULT_PYTHON="$_pipx_python"
fi
unset _pipx_python
EOF
source ~/.sources.d/40-pipx.sh

# Install pipx *with the pinned interpreter* and reload shell
"$PIPX_DEFAULT_PYTHON" -m pip install --user --upgrade pipx
"$PIPX_DEFAULT_PYTHON" -m pipx ensurepath
exec $SHELL -l

# Install ansible with lint support
pipx install --include-deps ansible
pipx inject --include-apps ansible ansible-lint
```

`~/.sources.d` is the per-tool sourcing directory that `bashrc_sources` loops over, so the export survives a rerun of the
`bash` role.

Another alternative would be to stop after you have installed `mise` and then treat this repository like any other
Python project. That is, install `uv`, `poetry`, or just rock a _venv_ using `python -m venv .venv`; and then install
Ansible in an environment dedicated to this project.

## Keeping Python and pipx up to date

The two Pythons are upgraded on completely different schedules, and that is the point.

**The user-global Python** floats. Upgrade it whenever, it cannot break pipx any more:

```bash
mise upgrade python
```

**Ansible and friends** are upgraded through pipx, and stay on the pinned interpreter:

```bash
pipx upgrade-all
```

**The pinned Python** is the one piece of manual maintenance. Bump it roughly once a year, or when its release goes
end-of-life. Install the new version first, rebuild everything onto it, and only then remove the old one:

```bash
mise install python@3.14.12                                   # 1. new pin, still exact
$EDITOR ~/.sources.d/40-pipx.sh                               # 2. update the version in the export
exec $SHELL -l                                                # 3. pick up the new PIPX_DEFAULT_PYTHON
"$PIPX_DEFAULT_PYTHON" -m pip install --user --upgrade pipx   # 4. move pipx itself
pipx reinstall-all --python "$PIPX_DEFAULT_PYTHON"            # 5. rebuild every venv
mise uninstall python@3.13.15                                 # 6. only once the above is verified
```

Remember to update the version in this README too, so the bootstrap block stays honest.

Two things to watch out for:

- `mise prune` removes installed versions that no config file references. The pinned Python is installed but *not*
  listed in `~/.config/mise/config.toml`, so prune will happily delete it. If you use prune, add
  `python = ["latest", "3.13.15"]` to the `[tools]` block to declare it instead.
- If Ansible ever does go missing with the `cannot execute: required file not found` error above, the recovery is
  `pipx reinstall-all --python "$PIPX_DEFAULT_PYTHON"`.

## Usage

The same playbook configures both macOS and Ubuntu; roles pick `brew` or `apt` based on the OS:

```bash
ansible-playbook -K playbooks/workstation.yml
```

`-K` asks for the sudo password, which both platforms need. Bash is the shell on both: on macOS the `bash` role installs
Homebrew's bash 5 (the system one is 3.2) and makes it the login shell. Log out and back in after the first run: macOS
sets `SHELL` for GUI apps at login, and Ghostty uses `SHELL` before the account's shell, so new terminals keep opening
zsh until then.

## Copy or Symlink

If a template is used to *render* the file, the file must be created at runtime and thereafter copied to its designated
place.

If the file is used *as is*, the file can be symlinked.

Symlinking is preferred, so I only use rendering when necessary.
