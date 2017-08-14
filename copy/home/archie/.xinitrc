xrdb -merge ~/.Xresources

case $wm in
openbox)
    exec openbox-session
    ;;

i3)
    exec i3
    ;;
*)
    exec i3
    ;;
esac
