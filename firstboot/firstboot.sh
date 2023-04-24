#! /bin/bash

firstboot_scripts=$(ls /etc/firstboot/scripts.d/*.sh)
run_dir=/var/cache/firstboot_run

mkdir -p "${run_dir}"
for firstboot_script in "${firstboot_scripts[@]}"; do
   run_file="${run_dir}/$(sha1sum "${firstboot_script}" | cut -d ' ' -f1)_$(basename "${firstboot_script}")"
   if [ ! -e "${run_file}" ]; then
      # shellcheck source=/dev/null
      . "${firstboot_script}" && touch "$run_file"
   fi
done
