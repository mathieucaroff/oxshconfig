
# sp() { # Sudo-execute a script from /etc/ox/p directory
#     sudo "$P/$@"
# }

# lnsm() { # Make (symbolic) links.
#     while [ "$2" ] ; do # For each pairs
#         ln -sT $2 $1 # Create a file "$1" targetting "$2".
#         shift; shift # Switch to the next pair.
#     done
# }
# Useless

# Copy to and from a remote 
# scpfpi() {
#     # Will misbehave if there is more than one file to copy.
#     echo scp pi@192.168.1.20:"$@"
# }

# scptpi() {
#     len=$((${#}-1))
#     echo scp "${@:1:$len}" pi@192.168.1.20:"${@:$#}"
#     scp "${@:1:$len}" pi@192.168.1.20:"${@:$#}"
# }