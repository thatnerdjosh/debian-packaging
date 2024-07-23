#!/bin/sh

# START Interface/Tooling
CACHE_DIR=~/.cache/sbuild
DEB_VARIANT=bullseye
MIRROR=http://mirror.infomaniak.com/debian
TOOL=debootstrap

make_container() {
	# TODO: Convert to a switch/case or similar
	if [ "$TOOL" != "debootstrap" ] && [ "$TOOL" != "mmdebstrap" ]; then
		print_message "$TOOL is currently not supported, exiting.";
		exit 1;
	fi

	mkdir -p $CACHE_DIR;
	if [ "$TOOL" = "debootstrap"]; then
		sbuild-createchroot --include=eatmydata,ccache $DEB_VARIANT $CACHE_DIR/$DEB_VARIANT $MIRROR;
	elif [ "$TOOL" = "mmdebstrap"]; then
		mmdebstrap --variant=buildd $DEB_VARIANT $CACHE_DIR/$DEB_VARIANT.tar.zst;
	fi
}

print_message() {
	(set +x; echo "$1") 2>/dev/null;
}
# END Interface/Tooling

# START Script
# Install required packages
sudo apt install $TOOL sbuild uidmap

if ! command -v $TOOL >/dev/null 2>&1; then
  print_message "$TOOL does not exist, exiting.";
  exit 1;
fi

# Check for existing cache directory
if [ ! -d $CACHE_DIR ]; then
  print_message "$CACHE_DIR does not exist, creating."
  make_container  # TODO: Ensure error handling for makeContainer
fi

# Check for existing sbuildrc file
if [ ! -f ~/.sbuildrc ]; then
  print_message "Outputting sbuildrc.conf to $HOME/.sbuildrc"
  cat sbuildrc.conf > ~/.sbuildrc
fi

print_message "You're ready to sbuild! :)"
exit 0;
# END Script
