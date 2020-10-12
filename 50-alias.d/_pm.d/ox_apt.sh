
if which apt-fast 2> /dev/null >&2 
then
    alias P='apt-fast'
else
    alias P='apt'
fi

# P - Packages
alias syp='kr synaptic'
alias A='so P'
alias Y='A -y'
# Package installation
alias pii="sudo -H pip install"
alias I='A install' # Quickly install a package
alias Adl="A -o Debug::NoLocking=1 -d install"
# Other
alias Arepo='update-repo'
alias Au='A update'
alias Ag='A upgrade'
alias Al='dpkg -L'
alias As='dpkg -S'

alias lpk="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"

# comm -23 <(lpk) <(xargs -n 1 -a ~/log/package.list | sort -u) > /c/m/n/lish/ih/packages.list.d/xutani
