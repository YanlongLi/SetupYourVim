#!/bin/bash

vimrc_backup_path='vimrc'
vimrc_path="$HOME/.vimrc"
if [ -e $vimrc_path ]
then
	rsync -v $vimrc_path $vimrc_backup_path
fi

xelatex_winfonts_backup_path='ctex-xecjk-winfonts.def'
xelatex_winfonts_path='/usr/share/texmf-dist/tex/latex/ctex/fontset/ctex-xecjk-winfonts.def'
if [ -e $xelatex_winfonts_path ]
then
	rsync -v $xelatex_winfonts_path $xelatex_winfonts_backup_path
fi

gvfs_mtp_backup_path='51-android.rules'
gvfs_mtp_path='/usr/lib/udev/rules.d/51-android.rules'
if [ -e $gvfs_mtp_path ]
then
	rsync -v $gvfs_mtp_path $gvfs_mtp_backup_path
fi

tomcat_roles_backup_path='tomcat-users.xml'
tomcat_roles_path='/etc/tomcat/tomcat-users.xml'
if [ -e $tomcat_roles_path ]
then
	rsync -v $tomcat_roles_path
fi

acpi_handler_backup_path='hander.sh'
acpi_handler_path='/etc/acpi/handler.sh'
if [ -e acpi_handler_path ]
then
	rsync -v $acpi_handler_path $acpi_handler_backup_path
fi
