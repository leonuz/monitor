# Yet Another Monitor Specifications Program 
## YAMSP
 
YAMPS it's a small bash Tput monitor program.  
Allows to get necessary information to know the status of a Linux system. 

![](/output.png?raw=true "Output from yamsp Monitor")

---

### About YAMPS
It is a program written in bash, with the purpose of showing how it's easy to 
manipulate the console of linux systems using Tput, interacting with the size, shape and color.

Among the information that YAMPS is able to give, you can find: 
- Kernel and Linux version
- Iinternal and external IP address
- Filesystem information
- Temperature and Voltaje (Motherboard and HDD)

To obtain the temp and voltage, it's necessary this additional packages:  
[lm_sensor](https://github.com/lm-sensors/lm-sensors)  
[hddtemp](https://github.com/guzu/hddtemp)

### About TPUT
The tput command allows shell scripts to do things like clear the screen, underline text, 
and center text no matter how wide the screen is. To do these things, it translates the 
terminal-independent name of a terminal capability into its actual value for the terminal 
type being used.  
more info [here](https://linuxcommand.org/lc3_adv_tput.php) and [here](https://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html#SEC5)


`leonuz`  


[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)
