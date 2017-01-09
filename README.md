ansible-role-godev [![Build Status][img-build-status]][build-status]
=========

A brief description of the role goes here.

Requirements
------------

This module should be compatible on just about any Unix-compatible system supported by Go, with minimal configuration.

Role Variables
--------------

<dl>
  <dt><code>version</code></dt>
  <dd>The version string of Go to install. Example: <code>1.7.4</code>.</dd>
  <dt><code>global</code></dt>
  <dd>Boolean. Whether to install Go to a system directory, requiring root access (<code>true</code>), or only to a user directory (<code>false</code>).
  <dt><code>link_go_root</code></dt>
  <dd>Boolean. Whether to create a symlink at <code>/usr/local/go</code> to the installed Go version.</dd>
  <dt><code>gopath</code></dt>
  <dd>Value to set for the <code>GOPATH</code> environment variable.</dd>
  <dt><code>user_environment_file</code></dt>
  <dd>For user installs, which file to append environment variable exports to.</dd>
  <dt><code>user_install_base</code></dt>
  <dd>For user installs, the root directory to host Go installations.</dd>
</dl>

Dependencies
------------

None.

Example Playbook
----------------

Install system Go with a symlink to `/usr/local/go`:

```
 - hosts: servers
   roles:
     - role: godev
```

Install a specific version of Go:

```
 - hosts: servers
   roles:
     - { role: godev, version: "1.8beta2" }
```

Install a user-only Go:

```
 - hosts: servers
   roles:
    - { role: godev, global: false, link_go_root: false }
```

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

 [build-status]: https://travis-ci.org/naftulikay/ansible-role-godev
 [img-build-status]: https://travis-ci.org/naftulikay/ansible-role-godev.svg?branch=master
