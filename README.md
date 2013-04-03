# Monitoring server configuration

This repository contains a Vagrantfile and associated chef recipes for installation of icinga.

## Current Status

Currently, it sets up a ```monitor``` server which auto-configures itself to ping all production 
machines known to chef. This is rather nice.

It also sets up a server called ```test-icinga-client``` which is intended to support testing of
icinga client recipe. Currently this doesn't work (see below).

## Next steps

* Virtualboxes using public networking have two network interfaces, and are storing the IP for the wrong one in chef. This IP is also the same on all boxes. This means that the server is pinging *itself* when it's trying to ping the client, and the client will only allow connections from this incorrect IP.
* Once this is resolved, we can start adding client-side checks. Currently these are hardwired in the icinga recipe, so we may need to fork and extend the icinga cookbook to allow us to add our own checks.