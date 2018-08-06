# ansible-role-go-dev [![Build Status][img-build-status]][build-status]

Installs and configures a Go development environment.

Available on Ansible Galaxy at [`naftulikay.go-dev`][galaxy].

## Requirements

Supporting (under test) Ubuntu 14.04, 16.04, CentOS, and OSX. Only amd64 architecture is supported for now. Other
Unix-like environments may work but are not under test.

## Role Variables

Please tour `vars/main.yml` and `defaults/main.yml` for a view into other variables, if any.

<dl>
  <dt><code>go_version</code></dt>
  <dd>The version string of Go to install. Example: <code>1.8.3</code>.</dd>
  <dt><code>go_user</code></dt>
  <dd>The user for which to install <code>govendor</code> and other tools.</dd>
</dl>

## Dependencies

None.

## Example Playbook

Here are some example playbooks to get started with.

### Install a Given Version of Go

Installs Go 1.7.4 with default configuration:

```yaml
---
- name: install
  hosts: all
  become: true
  roles:
    - { role: go-dev, go_version: 1.7.4 }
```


### Use an Alternate User `GOPATH`

Installs the latest Go version hardcoded in `main/vars.yml`, providing a shared Go directory of `$HOME/go` rather than
`$HOME/.go` as is the default:

```yaml
---
- name: install
  hosts: all
  become: true
  roles:
    - { role: go-dev, go_user_path: "$HOME/go" }
```

## License

MIT

 [build-status]: https://travis-ci.org/naftulikay/ansible-role-go-dev
 [img-build-status]: https://travis-ci.org/naftulikay/ansible-role-go-dev.svg?branch=master
 [galaxy]: https://galaxy.ansible.com/naftulikay/go-dev/
