node default {

  include ntp
  accounts::user { 'gorg':

    groups => ['sudo'],
    sshkeys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdmlkC+0AeXoj4htUrPz3N/82rpJT19QC+HHm7MUhcJbKuh78nGdtQ4Sw2uIAf53IrB0FnjxDwSAQJrgvV5Fa9km1zC8SSquDjubayM+Xyn/V39sptyYFF+mOJzRDEytSB1MZqRd4FJ1xJ460gGFOxfCKbTYY6xPY0U9H31xllLbTvr2xq6ejI6vTV7Z8m/1J5mqCnawioYE/dFPIhFy8zr8huN0v5ft/ZHKv0x3d4v3qiSXRvqCy9bJUW4x8IRMMJjrw+94Jsyz/RvSejLkqwVr8UW/CDNUq6A9YS8FUvKdVeZN+vUSmf+p2pg5KIVYOEXtWZTmLCKQp7dlZyvjPT gorg@ubuntu'
    ]
  }
  accounts::user { 'zdenek':
    groups => ['sudo'],
    sshkeys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC60oA//7cVbjQcYjOpoLjA2YXRNJe29tSL/zHz/zpdyspOZ+d8h4FrJ1+y6g2Rg5PbSJvdJRqhaqsihslk4z8TbNrCOm8EnffFQcdLMCPDDuU50c7dEkWRq0iviI/cL9QI6gC6VNrZ5gBhUaRPXVyM5zcdZjdXQRHnE/XBqd5t/sXQWUAHRFwT4EaCivAqlvWlaHm1p+JTkLoczjPf7dVpe/wGUSXQtQS78cKgbntoSC5w9ln+m/vgYCzAwkLlMLogKJur2LK5AjQY6L0jeX6qgn4b3eSVQYUwyC6B3C564KwkzHNZ1RWvky6DELOZFH++xsmU5qqQEe3uoIZEhytskJdfJhsrc4tzDBvNfSfmVOosA5ICfXk89ybu6sgmsydXPzbIF34ap6L7dAjd0driIoqYXmTMJGLzPzsUX5YbHPTMX3N0KI1cqL2puUB3JFf8kmiEBnsVPHfa5tdD1B6aq8lf5oPy3YWK08HWpCxecTstCmctvZ7VSHmilw0diwKXCn6UVOZEqyk1JUNUF1mfelb9VOoS1CHqoYHnJnAvjnvDl6PjIxlClCuZ9aGDVMjE5zcZJSMfuk3Ge7G8la1cE6PN0Th5O3mZOWvAZHu5zyHbpgNw+oAO8EGxd1ZZdGBBaOV/NljgJRuXgvuRujJotqil4mbEsEo0MGzPHusUMQ== zdenek@o2.pl'
    ]
  }

  file_line { 'sudo_rule_nopw':
    ensure => 'present',
    path => '/etc/sudoers',
    line => '%sudo ALL=(ALL) NOPASSWD: ALL',
  }
}
