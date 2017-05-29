# ansible-role-go-dev [![Build Status][img-build-status]][build-status]

Installs and configures a Go development environment on the target machine, installing a given version of Go, modifying
the `GOPATH`; the `GOROOT`; and the `PATH` to accommodate a Go development environment.

Available on Ansible Galaxy at [`naftulikay.go-dev`][galaxy].

## Requirements

Currently only Linux and the amd64 architecture are supported, contributions welcome.

## Role Variables

Please tour `vars/main.yml` and `defaults/main.yml` for a view into other variables, if any.

<dl>
  <dt><code>go_version</code></dt>
  <dd>The version string of Go to install. Example: <code>1.7.4</code>.</dd>
  <dt><code>go_user_path</code></dt>
  <dd>The user directory to host local Go libraries in. Environment variables will be evaluated by the user's shell. Optionally a colon delimited string. These will be added to <code>GOPATH</code>.</dd>
  <dt><code>go_goroot_dir</code></dt>
  <dd>Path to where <code>GOROOT</code> should live.</dd>
  <dt><code>go_install_base</code></dt>
  <dd>The directory in which to install <em>versions</em> of Go which are then symlinked to <code>GOROOT</code>.</dd>
  <dt><code>go_install_dir</code></dt>
  <dd>The directory in which to install the given version of Go. Defaults to: <pre>{{ go_install-base}}/go-{{ go_version }}</pre></dd>
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
