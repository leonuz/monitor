# Yet Another Monitor Specfications Program whit Estheroids 
## YAMSP
 
YAMPS it's a small bash Tput monitor program.
allows to get information necessary to know a Linux system. 

![](/output.png?raw=true "Output from yamsp Monitor")

---

### About YAMPS
It is a program written in bash, with the purpose of showing how with Tput it is easy to 
manipulate the console of linux systems, interacting with the size, shape and color.

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
more infoi [here](https://linuxcommand.org/lc3_adv_tput.php) and [here](https://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html#SEC5)


`leonuz`
