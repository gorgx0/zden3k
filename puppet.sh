#!/#!/usr/bin/env bash

puppet module install ntp
puppet module install puppetlabs-accounts
puppet apply /vagrant/site.pp
