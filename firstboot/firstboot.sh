#! /bin/bash

firstboot_scripts=$(ls /usr/libexec/fedora-autofirstboot/scripts.d/*.sh)
run_dir=/var/cache/firstboot_run

mkdir -p "${run_dir}"
for firstboot_script in ${firstboot_scripts[@]}; do
   run_file="${run_dir}/$(sha1sum ${firstboot_script})_${firstboot_script}"
   if [ ! -e ${run_file} ]; then
      . "${firstboot_script}" && touch $run_file
   fi
done
