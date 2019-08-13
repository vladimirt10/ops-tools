_ssh_known_hosts() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="$(egrep '^[a-zA-Z1-9]' ~/.ssh/known_hosts | awk '{print $1}' | sed 's/,/ /')"

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _ssh_known_hosts ssh
complete -F _ssh_known_hosts scp
