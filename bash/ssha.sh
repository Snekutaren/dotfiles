SSH_ENV="($HOME/.ssh/agent_env)"
function start_agent {
    echo "Starting ssh-agent..."
    ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo "Agent environment saved to ${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
}
# Source SSH agent environment if file exists
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    # Check if agent is running
    ps -p $SSH_AGENT_PID > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi