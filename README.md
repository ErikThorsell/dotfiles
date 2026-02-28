# dotfiles

Historically, I have had a dotfiles repository with a shell script which automated part of my setup configuration
files-process. It grew, and grew, and it became more and more difficult to keep track of everything. Not to mention the
issues I had maintaining one shell script which accomodated both macOS and Ubuntu systems. Because of this, I decided to
switch to using Ansible.

## Prerequisites

You need Ansible.

You can install Ansible according to [their
instructions](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), but I want to try my
very best to keep the default/system installation of Python completely separate from any Python chenanigans I might do
on my computer. [See PEP668](https://peps.python.org/pep-0668/).

Hence, the way I usually go about this is to:

1. Install [mise](https://mise.jdx.dev/getting-started.html)
2. Configure a user-global Python version (distinct from the system Python version)
3. Install [pipx](https://pipx.pypa.io/stable/installation/)
4. Install Ansible using pipx

So, something like this:

```bash
# Install mise
curl https://mise.run | sh  # add the following to your .bashrc: eval "$(mise activate bash)"

# Install the latest Python interpreter and make it the default for your user
mise use -g python

# Install pipx
python -m pip install --user --upgrade pipx
python -m pipx ensurepath
exec $SHELL -l

# Install ansible
pipx install --include-deps ansible
```

Another alternative would be to stop after you have installed `mise` and then treat this repository like any other
Python project. That is, install `uv`, `poetry`, or just rock a _venv_ using `python -m venv .venv`; and then install
Ansible in an environment dedicated to this project.

## Usage

Run your playbook of choice, e.g: `ansible-playbook playbooks/ubuntu-ws.yml`

## Copy or Symlink

If a template is used to *render* the file, the file must be created at runtime and thereafter copied to its designated
place.

If the file is used *as is*, the file can be symlinked.

Symlinking is prefered, so I only use rendering when necessary.
