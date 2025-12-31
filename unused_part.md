#### Fail2Ban
**Fail2Ban** scans log files like `/var/log/auth.log` and bans IP addresses conducting too many failed login attempt. It does this by updating system firewall rules to reject new connections from those IP addresses, for a configurable amount of time. This helps protect services such as SSH from brute force and other automated attacks.

Install Fail2Ban:

    sudo apt install fail2ban
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban
    sudo systemctl status fail2ban

Create a local configuration file by copying the default configuration file (overwritten in updates):

    sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

In the configuration file, the [DEFAULT] section defines the defaults for Fail2Ban policy. These options can be overridden in each individual service's configuration section. Edit the local configuration file as follows:

Set `ignoreip` to localhost `127.0.0.1/8` so it does not ban itself.

For SSH specific configurations, go to the [sshd] section:

    enabled = true
    maxretry = 3
    findtime = 10m # how often does fan2ban check the log files
    bantime = 1d
    port = 4242
    logpath = %(sshd_log)s
    backend = %(sshd_backend)s

Restart Fail2Ban to apply changes:

    sudo systemctl restart fail2ban

Check failed connection attempts and banned IP addresses:

    sudo fail2ban-client status
    sudo fail2ban-client status sshd
    sudo tail -f /var/log/fail2ban.log

Test by setting a low value `bantime` and try to connect multiple times via SSH with the wrong password to get banned (getting the message "Connection refused").

Source:
- [Fail2Ban official website](https://github.com/fail2ban/fail2ban)
- [Linux security: Protect your systems with fail2ban](https://www.redhat.com/en/blog/protect-systems-fail2ban)
- [How Fail2ban Works to Protect Services on a Linux Server](https://www.digitalocean.com/community/tutorials/how-fail2ban-works-to-protect-services-on-a-linux-server)
