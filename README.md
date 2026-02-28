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

Even though I use mise and pipx, I still try to keep my dependencies in order. For instance, I use virtual environments
for my Python projects and I often have pinned Python interpreters, via mise, for each project. I only install Python
dependencies with pipx if it's really necessary.

## Usage

Run your playbook of choice, e.g: `ansible-playbook playbooks/ubuntu-ws.yml`

## Copy or Symlink

If a template is used to *render* the file, the file must be created at runtime and thereafter copied to its designated
place.

If the file is used *as is*, the file can be symlinked.

Symlinking is prefered, so I only use rendering when necessary.
