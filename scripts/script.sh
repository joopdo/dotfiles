#!/bin/bash
mount -t davfs https://dropdoos.joopdorresteijn.com/remote.php/webdav/ /mnt
export ENCFS6_CONFIG='/home/joop/syncthing/.encfs6.xml'
encfs /mnt/NextCloud2018-07/enc /home/joop/dec
