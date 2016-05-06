#!/usr/bin/env bash

install="apt-get install --force-yes --yes"

function check_md5 {
  local file="$1" md5="$2"
  [ `md5sum < "$file" | cut -c 1-32` == "$md5" ]
}

apt_updated=0

function apt_update_if_needed {
  if [ $apt_updated -eq 0 ]; then
    apt_updated=1
    apt-get update
  fi
}

function install_if_needed {
  local package="$1"
  install_status=`dpkg -s "$package" 2>/dev/null | grep ^Status:`
  expected_status="Status: install ok installed"
  if [ x"$install_status" == "x$expected_status" ]; then
    echo "Package '$package' is already installed."
  else
    apt_update_if_needed
  	$install "$package"
  fi
}

for p in emacs coq coqide proofgeneral proofgeneral-doc proofgeneral-coq; do
  install_if_needed $p
done

# Check for updated screen resolution

grubfile="/etc/default/grub"
tmpgrubfile="/tmp/grubtmp.$$"
gfxline="GRUB_GFXPAYLOAD_LINUX=1024x768x24"
fgrep -q "$gfxline" "$grubfile" || {
  sed -e "s,#GRUB_GFXMODE=.*,$gfxline," < "$grubfile" > "$tmpgrubfile"
  mv "$tmpgrubfile" "$grubfile"
  update-grub
}
