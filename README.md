# Splunk-Installation-For-EC2-
A script that installs the latest version of Splunk for a single or group of EC2 instances

This script can be uploaded in the cloud formation template section. It performs the following tasks:
 - Install .tgz file 
 - Create a user and assign a password
 - Accept license without reading the entire content
 - Enable boot start
 - Changes ulimit in limits.conf
 - Assigns values for max file size and number

