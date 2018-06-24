#!/#!/usr/bin/env bash

puppet module install puppetlabs-ntp
puppet module install puppetlabs-accounts
puppet apply /vagrant/site.pp
