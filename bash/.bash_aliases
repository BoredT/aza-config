#android
###############################################################################
if [ -f ~/android/sdk/platform-tools/adb ]; then
    alias adb='~/android/sdk/platform-tools/adb'
	alias adb-restart='~/android/sdk/platform-tools/adb kill-server && sudo ~/android/sdk/platform-tools/adb devices'
fi

if [ -f ~/android/ndk/ndk-build ]; then
	alias ndkb='~/android/ndk/ndk-build'
fi


adbm() {
	for SERIAL in $(adb devices | tail -n +2 | cut -sf 1);
		do 
			adb -s $SERIAL $@
		done
}

#mutiple device install
alias adbmi='adbm install -r'

#multiple device uninstall
alias adbmu='adbm uninstall'

#multiple device exec su command
adbms() {
	adbm shell su -c "$@"
}


#change device serial
adbcs() {
	adb shell su -c "echo $1 > /sys/class/android_usb/android0/iSerial"
}
###############################################################################





#common commands
###############################################################################
alias g="grep -r"
alias f="find -name"
alias hig="history | grep"
alias r='reset'
###############################################################################





#git commands
###############################################################################
alias gf="git fetch"
alias gp="git pull"
alias gpom="git pull origin master"
alias gc="git checkout"
alias gcb="git checkout -b"
alias grh="git reset --hard"
alias gl="git log"
alias gb="git branch"
alias gbd="git branch -D"
###############################################################################




#custom commands, not under VCS
###############################################################################
if [ -f ~/bash-config/.bash_aliases_custom ]; then
    . ~/bash-config/.bash_aliases_custom
fi
###############################################################################




#auto-completion for all aliases
###############################################################################

if [ -f ~/bash-config/.alias_completion ]; then
    . ~/bash-config/.alias_completion
    alias_completion
fi
###############################################################################
