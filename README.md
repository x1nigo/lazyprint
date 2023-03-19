# Applied laziness to printer support
Script to automatically install printers/drivers to arch/artix linux distributions.

I've always found myself annoyed that I would have to manually install printer support every single time I reinstall my arch/artix linux systems.
Hence, I've decided to just put it all in a script to save me trouble.

## Requirements
- an `arch/artix` linux system
- for `artix`, this script is only compatible with the `runit` version.

Clone the repository with the following command:
```
git clone https://github.com/x1nigo/lazyprint.git
cd lazyprint
sh lazyprint.sh
```
## Note
After the installation, your printers should be working from the get go. If not, it may be because you still need to install the proper driver for your specific printer. You can find those [here](https://wiki.archlinux.org/title/CUPS/Printer-specific_problems).
