# catalogoanatom_infra
catalogoanatom Infra repository

# HW 2  Solution for YANDEX.cloud:

I have add dedicate file for otus hosts:

~/.ssh$ cat otus
Host bastion
  user amartynov
  HostName 51.250.74.25

Host someinternalhost
  user amartynov
  HostName 10.128.0.8
  ProxyJump  bastion


Then I have included this file into ssh config:
~/.ssh head -n3  config
include ~/.ssh/otus
Host *
ForwardAgent yes



IT WORKS!

~/.ssh$ ssh someinternalhost
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.4.0-124-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Tue Sep 20 16:13:28 2022 from 10.128.0.22



# HW 3 Additional
bastion_IP = 51.250.74.25
someinternalhost_IP = 10.128.0.8

# HW 4
testapp_IP = 51.250.87.64
testapp_port = 9292

# HW 5
OS image creating using packer. Variables parametrization using external variables.json file.
