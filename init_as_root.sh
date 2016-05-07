#!/usr/bin/env bash

install="apt-get install --force-yes --yes"

vagrantuser="vagrant"

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

for p in emacs coq coqide proofgeneral proofgeneral-doc proofgeneral-coq nodm xserver-xorg xinit openbox xterm mupdf zathura; do
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

# Setup the nodm config to login the user automatically

nodmfile="/etc/default/nodm"
tmpnodmfile="/tmp/nodmtmp.$$"
sed -e " s,NODM_ENABLED=.*,NODM_ENABLED=true,; s,NODM_USER=.*,NODM_USER=$vagrantuser,; " < "$nodmfile" > "$tmpnodmfile"
mv "$tmpnodmfile" "$nodmfile"

# Setup the openbox menu to run Proof General

obfile="/etc/xdg/openbox/menu.xml"
tmpobfile="/tmp/obmenutmp.$$"
sed -e ' s,\(<menu id=./Debian. />\).*,\1 <item label="Proof General" icon="/usr/share/pixmaps/proofgeneral.xpm"><action name="Execute"><execute>proofgeneral</execute></action></item>, ' < "$obfile" > "$tmpobfile"
mv "$tmpobfile" "$obfile"

# Need to restart for login changes to take effect
reboot
# This will cause an error in Vagrant. Ignore that.
