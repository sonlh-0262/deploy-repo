### Add permanently environment variables

Condition:
1. Login/Non-login shell
2. Interactive/Non-interactive shell

#### bash
- Bash as login shell will load `/etc/profile`, `~/.bash_profile`, `~/.bash_login`, `~/.profile` in the order
- Bash as non-login interactive shell will load `~/.bashrc`
- Bash as non-login non-interactive shell will load the configuration specified in environment variable `$BASH_ENV`
