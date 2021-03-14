# Tput monitor 
a small bash program 

![](/output.png?raw=true "Output from Tput Monitor")

### Some Important Definitions about TPUT
The tput command allows shell scripts to do things like clear the screen, underline text, 
and center text no matter how wide the screen is. To do these things, it translates the 
terminal-independent name of a terminal capability into its actual value for the terminal 
type being used.

#### tput Color Capabilities:
- tput setab [1-7] – Set a background color using ANSI escape
- tput setb [1-7] – Set a background color
- tput setaf [1-7] – Set a foreground color using ANSI escape
- tput setf [1-7] – Set a foreground color

#### tput Text Mode Capabilities:
- tput bold – Set bold mode
- tput dim – turn on half-bright mode
- tput smul – begin underline mode
- tput rmul – exit underline mode
- tput rev – Turn on reverse mode
- tput smso – Enter standout mode (bold on rxvt)
- tput rmso – Exit standout mode
- tput sgr0 – Turn off all attributes

#### Color code for tput:
0. Black
1. Red
2. Green
3. Yellow
4. Blue
5. Magenta
6. Cyan
7. White


`leonuz`
