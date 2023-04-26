dos2unix *.vhd

vasy -I vhd -a -p -o divider_data divider_data
vasy -I vhd -a -p -o divider_control divider_control
vasy -I vhd -a -p -o divider divider

boog divider_data divider_data
boog divider_control divider_control
asimut -zd divider divider r1
xpat -l r1
ocp -ring divider divider
graal -l divider
nero -V divider divider
graal -l divider
genlib -v divider_top divider_top
ring divider_top divider_top
graal -l divider_top
s2r -r divider_top divider_top
dreal -l divider_top



