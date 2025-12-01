#
# ~/.bash_profile
# sourced on login
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "/home/kr9sis/bin/" ]; then
    PATH="/home/kr9sis/bin:$PATH"
fi
