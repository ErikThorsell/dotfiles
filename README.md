# dotfiles

Historically, I have had a dotfiles repository with a shell script which automated part of my setup configuration
files-process. It grew, and grew, and it became more and more difficult to keep track of everything. Not to mention the
issues I had maintaining one shell script which accomodated both macOS and Ubuntu systems. Because of this, I decided to
switch to using Ansible.

## Usage

1. Install Ansible according to [their instructions](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
2. Run your playbook of choice, e.g: `ansible-playbook playbooks/ubuntu-ws.yml`

## Copy or Symlink

If a template is used to *render* the file, the file must be created at runtime and thereafter copied to its designated
place.

If the file is used *as is*, the file can be symlinked.

Symlinking is prefered, so I only use rendering when necessary.

