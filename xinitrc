xsetroot -cursor_name left_ptr
setxkbmap -layout es -option ctrl:nocaps
xmodmap ~/.xmodmaprc

[ -f etc/xprofile ] && . etc/xprofile

redshift -c ~/etc/redshift.conf &
~/etc/bar.sh &
eval $(ssh-agent)

exec bspwm -c ~/etc/bspwmrc
