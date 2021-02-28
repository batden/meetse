#!/bin/bash

# MEETSE.SH

# This Bash script will help you cleanly uninstall Enlightenment and related applications.

# See README.md for instructions on how to use this script.

# MEETSE.SH is written and maintained by batden@sfr.fr and carlasensa@sfr.fr,
# feel free to use this script as you see fit.

ITA="\e[3m"
BDR="\e[1;31m"
OFF="\e[0m"

SCRFLR=$HOME/.esteem
LWEB=libwebp-1.2.0
LAVF=0.8.4

PROG_MN="efl terminology enlightenment ephoto evisum rage express"
PROG_AT="enventor"

remov_eprog_at() {
  for I in $PROG_AT; do
    sudo make uninstall &>/dev/null
    make maintainer-clean &>/dev/null
  done
}

remov_eprog_mn() {
  for I in $PROG_MN; do
    sudo ninja -C build uninstall &>/dev/null
    rm -rf build &>/dev/null
  done
}

remov_preq() {
  if [ -d $ESRC/rlottie ]; then
    echo
    read -t 12 -p "Remove rlottie, libavif, aom and libwebp? [Y/n] " answer
    case $answer in
    [yY])
      echo
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie
      echo

      cd $ESRC/libavif-$LAVF/build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf libavif-$LAVF

      cd $ESRC/aom/aom-build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf aom

      cd $ESRC/$LWEB
      sudo make uninstall &>/dev/null
      make maintainer-clean &>/dev/null
      cd .. && rm -rf $ESRC/$LWEB
      sudo rm -rf /usr/local/bin/cwebp
      sudo rm -rf /usr/local/bin/dwebp
      echo
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not remove prerequisites... OK)"
      ;;
    *)
      echo
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie
      echo

      cd $ESRC/libavif-$LAVF/build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf libavif-$LAVF

      cd $ESRC/aom/aom-build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf aom

      cd $ESRC/$LWEB
      sudo make uninstall &>/dev/null
      make maintainer-clean &>/dev/null
      cd .. && rm -rf $ESRC/$LWEB
      sudo rm -rf /usr/local/bin/cwebp
      sudo rm -rf /usr/local/bin/dwebp
      echo
      ;;
    esac
  fi
}

uninstall_e25() {
  ESRC=$(cat $HOME/.cache/ebuilds/storepath)

  clear
  printf "\n\n$BDR%s $OFF%s\n\n" "* UNINSTALLING ENLIGHTENMENT DESKTOP *"

  cd $HOME

  for I in $PROG_AT; do
    cd $ESRC/e25/$I && remov_eprog_at
  done

  for I in $PROG_MN; do
    cd $ESRC/e25/$I && remov_eprog_mn
  done

  cd /etc
  sudo rm -rf enlightenment

  cd /etc/xdg/menus
  sudo rm -rf e-applications.menu

  cd /usr/local
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf efl*
  sudo rm -rf eio*
  sudo rm -rf eldbus*
  sudo rm -rf elementary*
  sudo rm -rf eo*
  sudo rm -rf evas*

  cd /usr/local/bin
  sudo rm -rf eina*
  sudo rm -rf efl*
  sudo rm -rf elua*
  sudo rm -rf enventor*
  sudo rm -rf eolian*
  sudo rm -rf emotion*
  sudo rm -rf evas*
  sudo rm -rf terminology*
  sudo rm -rf ty*

  cd /usr/local/etc
  sudo rm -rf enlightenment

  cd /usr/local/include
  sudo rm -rf -- *-1
  sudo rm -rf aom
  sudo rm -rf avif
  sudo rm -rf enlightenment
  sudo rm -rf express*
  sudo rm -rf webp*

  cd /usr/local/lib
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf elementary*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf enventor*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf libecore*
  sudo rm -rf libector*
  sudo rm -rf libedje*
  sudo rm -rf libeet*
  sudo rm -rf libeeze*
  sudo rm -rf libefl*
  sudo rm -rf libefreet*
  sudo rm -rf libeina*
  sudo rm -rf libeio*
  sudo rm -rf libeldbus*
  sudo rm -rf libelementary*
  sudo rm -rf libelocation*
  sudo rm -rf libelput*
  sudo rm -rf libelua*
  sudo rm -rf libembryo*
  sudo rm -rf libemile*
  sudo rm -rf libemotion*
  sudo rm -rf libeo*
  sudo rm -rf libeolian*
  sudo rm -rf libephysics*
  sudo rm -rf libethumb*
  sudo rm -rf libevas*

  cd /usr/local/lib/x86_64-linux-gnu
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf elementary*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf libecore*
  sudo rm -rf libector*
  sudo rm -rf libedje*
  sudo rm -rf libeet*
  sudo rm -rf libeeze*
  sudo rm -rf libefl*
  sudo rm -rf libefreet*
  sudo rm -rf libeina*
  sudo rm -rf libeio*
  sudo rm -rf libeldbus*
  sudo rm -rf libelementary*
  sudo rm -rf libelocation*
  sudo rm -rf libelput*
  sudo rm -rf libelua*
  sudo rm -rf libembryo*
  sudo rm -rf libemile*
  sudo rm -rf libemotion*
  sudo rm -rf libeo*
  sudo rm -rf libeolian*
  sudo rm -rf libethumb*
  sudo rm -rf libevas*
  sudo rm -rf libexactness*
  sudo rm -rf librlottie*
  sudo rm -rf rage*

  cd /usr/local/lib/x86_64-linux-gnu/cmake
  sudo rm -rf Ecore*
  sudo rm -rf Edje*
  sudo rm -rf Eet*
  sudo rm -rf Eeze*
  sudo rm -rf Efl*
  sudo rm -rf Efreet
  sudo rm -rf Eina*
  sudo rm -rf Eio*
  sudo rm -rf Eldbus*
  sudo rm -rf Elementary*
  sudo rm -rf Elua*
  sudo rm -rf Emile*
  sudo rm -rf Emotion*
  sudo rm -rf Eo*
  sudo rm -rf Eolian*
  sudo rm -rf Emile*
  sudo rm -rf Ethumb*
  sudo rm -rf Evas*

  cd /usr/local/lib/x86_64-linux-gnu/pkgconfig
  sudo rm -rf ecore*
  sudo rm -rf ector*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf eina*
  sudo rm -rf eio*
  sudo rm -rf eldbus*
  sudo rm -rf elementary*
  sudo rm -rf elocation*
  sudo rm -rf elua*
  sudo rm -rf embryo*
  sudo rm -rf emile*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf enventor*
  sudo rm -rf evisum*
  sudo rm -rf eo*
  sudo rm -rf eolian*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf everything*
  sudo rm -rf exactness*
  sudo rm -rf rage*
  sudo rm -rf rlottie*
  sudo rm -rf terminology*

  cd /usr/local/man/man1
  sudo rm -rf terminology*
  sudo rm -rf ty*

  cd /usr/local/share
  sudo rm -rf dbus*
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf elementary*
  sudo rm -rf elua*
  sudo rm -rf embryo*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf enventor*
  sudo rm -rf evisum*
  sudo rm -rf eo*
  sudo rm -rf eolian*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf exactness*
  sudo rm -rf express*
  sudo rm -rf rage*
  sudo rm -rf terminology*
  sudo rm -rf wayland-sessions*

  cd /usr/local/share/applications
  sudo sed -i '/enlightenment_filemanager/d' mimeinfo.cache
  sudo sed -i '/ephoto/d' mimeinfo.cache
  sudo sed -i '/rage/d' mimeinfo.cache
  sudo rm -rf terminology.desktop

  cd /usr/local/share/icons
  sudo rm -rf Enlightenment*
  sudo rm -rf elementary*
  sudo rm -rf terminology*

  cd /usr/local/share/icons/hicolor/128x128/apps
  sudo rm -rf evisum.png
  sudo rm -rf terminology.png

  cd /usr/share/dbus-1/services
  sudo rm -rf org.enlightenment.Ethumb.service

  cd /usr/share/wayland-sessions &>/dev/null
  sudo rm -rf enlightenment.desktop

  cd /usr/share/xsessions
  sudo rm -rf enlightenment.desktop

  cd $HOME
  rm -rf $ESRC/e25
  rm -rf $SCRFLR
  rm -rf .e
  rm -rf .elementary
  rm -rf .cache/ebuilds
  rm -rf .cache/efreet
  rm -rf .cache/ephoto
  rm -rf .cache/evas_gl_common_caches
  rm -rf .cache/rage
  rm -rf .config/enventor
  rm -rf .config/ephoto
  rm -rf .config/evisum
  rm -rf .config/express
  rm -rf .config/rage
  rm -rf .config/terminology

  remov_preq

  if [ -d $HOME/.ccache ]; then
    echo
    read -t 12 -p "Remove the ccache folder? [y/N] " answer
    case $answer in
    [yY])
      ccache -C
      rm -rf $HOME/.ccache
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      ;;
    *)
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      ;;
    esac
  fi

  if [ -f $HOME/.bash_aliases ]; then
    echo
    read -t 12 -p "Remove the bash_aliases file? [Y/n] " answer
    case $answer in
    [yY])
      rm -rf $HOME/.bash_aliases && source $HOME/.bashrc
      sleep 1
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete bash_aliases... OK)"
      sleep 1
      ;;
    *)
      echo
      rm -rf $HOME/.bash_aliases && source $HOME/.bashrc
      sleep 1
      ;;
    esac
  fi

  find /usr/local/share/locale/*/LC_MESSAGES 2>/dev/null | while read -r I; do
    echo "$I" |
      xargs sudo rm -rf \
        $(grep -E 'efl|enlightenment|enventor|ephoto|evisum|terminology')
  done

  sudo rm -rf /usr/lib/libintl.so
  sudo ldconfig
  sudo updatedb
  echo
}

printf "\n$BDR%s $OFF%s\n\n" "Wait 3 seconds or hit Ctrl+C to quit..."
sleep 3
uninstall_e25
# Candidates for deletion: Search for 'meetse' in your home folder.
