#! /bin/sh

# This script only works with Arch/Artix Linux systems.
# Note for Artix: This is only for the runit version.

# TODO: Create a script for other init systems?
# TODO: Provide scripts as well for different types of printers.

# Make sure we're using the right init system.
linksys=$(ls -l /sbin/init)
initsys="${linksys##*> }"
case $sysinit in
	systemd)
		sudo pacman -S --noconfirm cups
		sudo systemctl enable --now cups
		;;
	*)
		sudo pacman -S --noconfirm cups cups-runit
		sudo ln -s /etc/runit/sv/cupsd /run/runit/service
		;;
esac

# Add $USER to the `lp` group.
sudo usermod -aG lp $USER
# Get user input to determine the specific driver.
while true; do
	printf "Here is a list of the printers recognized by this script.\n\t"
	printf "%s\n\t" "[1] HP"
	printf "%s\n\t" "[2] Canon"
	printf "%s\n" "[3] Others"
	printf "What is your printer model? "
	read model
	case $model in
		[1-3]) break ;;
		*) printf "Please follow the instructions. Enter a number.\n" ;;
	esac
done
# Prepare the necessary drivers depending on your choice.
case $model in
	1) printer="hplip" ;;
	2) printer="foomatic-db-ppds" ;;
esac

# Download and install the printer gui and its corresponding driver.
sudo pacman -S --noconfirm system-config-printer $printer

# Closing message upon successfull install.
printf "CONGRATULATIONS! You now have a working printer system.\n"
[ -z $printer ] && printf "Please visit this link to find your specific printer's driver:\n\t\033[32mhttps://wiki.archlinux.org/title/CUPS/Printer-specific_problems\033[0m\n"
