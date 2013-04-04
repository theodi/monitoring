# Monitoring server configuration

This repository contains a Vagrantfile and associated chef recipes for installation of icinga.

## Running it all

For now, see the Vagrant instructions in member-directory to sort any prerequisites, then run ```vagrant up``` to make the magic happen.

## Current Status

Currently, it sets up a ```monitor``` server which auto-configures itself to ping all production 
machines known to chef. This is rather nice.

It also sets up a server called ```test-icinga-client``` which is intended to support testing of
icinga client recipe.

## Next steps

* Need to customise client-side checks. Currently these are hardwired in the icinga recipe, so we may need to fork and extend the icinga cookbook to allow us to add our own checks.
* There is some half-working code for detecting the provider and allowing switching of general config, but it won't work for things like ```vagrant ssh```.
* Rackspace support is half-written but commented and parked for now as too slow to develop with.