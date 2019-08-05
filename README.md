# Splunk-Installation-For-EC2-
A script that installs the latest version of Splunk for a single or group of EC2 instances

This script can be uploaded in the cloud formation template section. It performs the following tasks:
 - Install .tgz file 
 - Create a user and assign a password
 - Accept license without reading the entire content
 - Enable boot start
 - Changes ulimit in limits.conf
 - Assigns values for max file size and number

PORT SETTINGS FOR EC2 INSTANCES 
 - 22 -> SSH
 - 8000 -> Universal access (web)
 - 8089 -> Management and Monitoring
 - 8080 -> Webport
 - 8191 -> KV Store
