#! /bin/bash

firstboot_scripts=$(ls /usr/libexec/fedora-autofirstboot/scripts.d/*.sh)
	
for firstboot_script in ${firstboot_scripts[@]}
do
   . "${firstboot_script}"
done