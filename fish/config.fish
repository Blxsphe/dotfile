if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source

function cat
    bat $argv
end

zoxide init fish | source



function start_ssh_agent --description 'Inicia o ssh-agent no fish'
    if not pgrep ssh-agent > /dev/null
        set -gx SSH_AUTH_SOCK (ssh-agent -c | grep SSH_AUTH_SOCK | sed 's/.*=//;s/;.*//')
        set -gx SSH_AGENT_PID (ssh-agent -c | grep SSH_AGENT_PID | sed 's/.*=//;s/;.*//')
        ssh-add ~/.ssh/id_ed25519 > /dev/null
    end
end

start_ssh_agent
