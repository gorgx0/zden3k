node default {

  include ntp

  accounts::user { 'gorg':
    groups => ['sudo'],
    sshkeys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdmlkC+0AeXoj4htUrPz3N/82rpJT19QC+HHm7MUhcJbKuh78nGdtQ4Sw2uIAf53IrB0FnjxDwSAQJrgvV5Fa9km1zC8SSquDjubayM+Xyn/V39sptyYFF+mOJzRDEytSB1MZqRd4FJ1xJ460gGFOxfCKbTYY6xPY0U9H31xllLbTvr2xq6ejI6vTV7Z8m/1J5mqCnawioYE/dFPIhFy8zr8huN0v5ft/ZHKv0x3d4v3qiSXRvqCy9bJUW4x8IRMMJjrw+94Jsyz/RvSejLkqwVr8UW/CDNUq6A9YS8FUvKdVeZN+vUSmf+p2pg5KIVYOEXtWZTmLCKQp7dlZyvjPT gorg@ubuntu',
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsvkMMBR14os5EhMBjeuVxTmvFNW5zqTwRXQT+193kosxWOylSf0J3NOx3g1j7uVE8u0vwFh6G09M7pW5nsazb2S4YlITOhCzkO7wALIOoHH9ISRLiSy0CN/2JiW37wChYY9KLnJ2bDt2yBcAJR9a8++Q5btY4W8lD72A/ZTJx3q/GcBArbEPTnjOnXHP2qur/Ta80y8eYON6VpZkZyLC6JygQDae/SXJltiKuyZdp1Pjm2d2haDfrJz5zaYrid4oA1qUVAmKklZp9fXxL4mEqzbE2Gfw7AY7L/4jLx/2v+vKUsB61X2R/gr5rAmTbgxe6x/TWmmsFTL+xFQ90l7/P krasowsm@CL04414'
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

  file_line{'mariadb_network_access':
    ensure            => present,
    path              => '/etc/mysql/mariadb.conf.d/50-server.cnf',
    line              => 'bind-address            = 0.0.0.0',
    match             => '^bind-address\s+=\s+127\.0\.0\.1',
    match_for_absence => true,
    notify            => Service['mariadb'],
  }

  service{'mariadb':
    ensure => 'running',
  }
}
