#!/bin/bash

qemu-system-x86_64 -smp cpus=2,sockets=2 \
 -drive file=output_solaris11/solaris,if=virtio,cache=writeback,discard=ignore,format=qcow2 \
 -machine type=pc,accel=kvm -name solaris -m 3072M -boot once=d -vnc 127.0.0.1:0 \
 -netdev user,id=user.0,hostfwd=tcp::4172-:22 -device virtio-net,netdev=user.0
