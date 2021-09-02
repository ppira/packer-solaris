# packer-solaris
This packer receipe uses some of the autoinstall features of Solaris 11.

## prereqs
Download the autoinstall Solaris 11.4 media from Oracle and place it in $HOME/packer-solaris/. Adapt http/default.xml to suit your environment. Packer will serve this file to the autoinstall image.

The publicly available Solaris 11.4 media does not support any virtio devices. Use e1000 and ide for net_device and disk_interface. As of 11.4SRU33 virtio drivers are available.

## todo
Next stage should be to deploy the sc_profile.xml to the install image. I do not know how to do this without an AI server currently. Meanwhile I'm using the not so optimal mechanism of waiting for the setup dialogs and entering configuration with vnc keystrokes.
