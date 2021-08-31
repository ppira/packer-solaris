# packer-solaris
This packer receipe sort of tries to emulate an auto install server.

## prereqs
Download the autoinstall Solaris 11.4 media from Oracle and place it in $HOME/packer-solaris/. Adapt http/default.xml to suit your environment. Packer will serve this file to the autoinstall image.

## todo
Next stage should be to deploy the sc_profile.xml to the install image. I do not know how to do this without an AI server currently. Meanwhile I'm using the not so optimal machanism of waiting for the setup dialogs and entering configuration with vnc keystrokes.
