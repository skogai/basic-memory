---
title: Security Hardening Role
type: note
permalink: ansible/roles/security-hardening-role
---

# Security Hardening Role

## Overview

Comprehensive security hardening for Arch Linux systems with firewall configuration, user management, and system monitoring.

## Role Structure

```yaml
# ansible/roles/security/

tasks/
├── main.yml              # Security hardening orchestration
├── firewall.yml          # Firewall configuration and rules
├── ssh.yml               # SSH daemon hardening
├── users.yml             # User security and sudo configuration
├── audit.yml             # System audit and monitoring
├── encryption.yml        # Disk and file encryption setup
├── network.yml           # Network security configuration
└── services.yml          # Service security and hardening

defaults/
└── main.yml              # Security configuration defaults

handlers/
└── main.yml              # Security service handlers

templates/
├── sshd_config.j2        # Hardened SSH configuration
├── sudoers.j2            # Secure sudo configuration
├── ufw-rules.j2          # UFW firewall rules
├── fail2ban.conf.j2      # Intrusion prevention config
└── auditd.conf.j2        # System audit configuration

files/
├── security-policies/    # Security policy files
├── certificates/         # SSL/TLS certificates
└── scripts/              # Security utility scripts
    ├── security-scan.sh  # System security scanner
    └── backup-check.sh    # Backup integrity checker
```

## Task Descriptions

### main.yml

```yaml
# [orchestration] Execute security hardening in proper sequence #coordination
# [validation] Assess current security posture #security-assessment
# [setup] Configure firewall and network security #network-security
# [setup] Harden SSH daemon configuration #ssh-hardening
# [setup] Configure user security and access controls #user-security
# [setup] Setup system auditing and monitoring #monitoring
# [setup] Configure encryption and data protection #encryption
# [setup] Disable unnecessary services #service-hardening
# [validation] Verify security configuration effectiveness #security-validation
```

### firewall.yml

```yaml
# [firewall] Install and configure UFW (Uncomplicated Firewall) #ufw-setup
# [firewall] Set default firewall policies (deny incoming, allow outgoing) #default-policies
# [firewall] Configure SSH access rules #ssh-access
# [firewall] Setup application-specific firewall rules #app-rules
# [firewall] Configure port forwarding rules if needed #port-forwarding
# [firewall] Enable firewall logging for monitoring #logging
# [firewall] Alternative: Configure iptables for advanced users #iptables-option
```

### ssh.yml

```yaml
# [ssh] Backup original SSH configuration #backup-config
# [ssh] Configure SSH key-based authentication only #key-auth
# [ssh] Disable root SSH login #disable-root
# [ssh] Change default SSH port for security #port-change
# [ssh] Configure SSH connection limits and timeouts #connection-limits
# [ssh] Setup SSH banner and legal notices #banner
# [ssh] Enable SSH audit logging #audit-logging
# [validation] Test SSH configuration before applying #ssh-test
```

### users.yml

```yaml
# [user] Configure password policies and aging #password-policy
# [user] Setup secure sudo configuration #sudo-security
# [user] Configure user account lockout policies #lockout-policy
# [user] Setup user groups and permissions #group-management
# [user] Configure shell security settings #shell-security
# [user] Setup user environment security #env-security
# [validation] Verify user security configuration #user-validation
```

### audit.yml

```yaml
# [audit] Install and configure auditd system #auditd-setup
# [audit] Configure audit rules for file access monitoring #file-audit
# [audit] Setup audit rules for system call monitoring #syscall-audit
# [audit] Configure audit log rotation and retention #log-management
# [audit] Install fail2ban for intrusion prevention #fail2ban
# [audit] Setup security event alerting #alerting
# [validation] Test audit system functionality #audit-test
```

### encryption.yml

```yaml
# [encryption] Configure LUKS disk encryption support #disk-encryption
# [encryption] Setup encrypted swap partition #swap-encryption
# [encryption] Configure file-level encryption tools #file-encryption
# [encryption] Setup encrypted backup solutions #backup-encryption
# [encryption] Configure SSL/TLS certificates #ssl-setup
# [validation] Verify encryption configurations #encryption-test
```

### network.yml

```yaml
# [network] Configure secure DNS settings #dns-security
# [network] Setup network intrusion detection #intrusion-detection
# [network] Configure VPN client capabilities #vpn-setup
# [network] Disable unnecessary network services #service-disable
# [network] Configure MAC address randomization #mac-randomization
# [network] Setup network monitoring tools #network-monitoring
```

### services.yml

```yaml
# [service] Audit and disable unnecessary system services #service-audit
# [service] Configure service security settings #service-security
# [service] Setup service monitoring and alerting #service-monitoring
# [service] Configure automatic security updates #auto-updates
# [service] Setup system backup automation #backup-automation
# [validation] Verify service security configuration #service-validation
```

## Default Variables

```yaml
# Firewall configuration
firewall_type: "ufw"  # ufw, iptables
ssh_port: 2222
allowed_ssh_users: ["{{ primary_user }}"]
firewall_logging: true

# SSH security
ssh_key_only: true
ssh_root_login: false
ssh_password_auth: false
ssh_max_auth_tries: 3
ssh_client_alive_interval: 300

# User security
password_min_length: 12
password_max_age: 90
account_lockout_attempts: 5
sudo_timeout: 15

# Audit configuration
enable_auditd: true
audit_log_retention: 30  # days
enable_fail2ban: true
fail2ban_bantime: 3600

# Encryption settings
enable_disk_encryption: false  # Requires manual setup
enable_swap_encryption: true
ssl_cert_generation: true

# Network security
secure_dns_servers:
  - "1.1.1.1"      # Cloudflare
  - "8.8.8.8"      # Google
enable_mac_randomization: true
enable_vpn_support: false

# Service hardening
disable_unnecessary_services: true
enable_auto_updates: true
backup_retention_days: 30
```

## Key Features

### Network Security

- [feature] Comprehensive firewall configuration #firewall-protection
- [feature] SSH hardening with key-based authentication #ssh-security
- [feature] Network intrusion detection and prevention #intrusion-prevention
- [feature] Secure DNS configuration #dns-security

### Access Control

- [feature] Strong password policies and enforcement #password-security
- [feature] Secure sudo configuration with timeouts #sudo-security
- [feature] User account lockout protection #account-protection
- [feature] Multi-factor authentication support #mfa-support

### Monitoring and Auditing

- [feature] System call and file access auditing #system-auditing
- [feature] Failed login attempt monitoring #login-monitoring
- [feature] Security event alerting and notification #alerting
- [feature] Regular security scanning automation #security-scanning

### Data Protection

- [feature] Disk and file encryption capabilities #encryption
- [feature] Secure backup with encryption #backup-security
- [feature] SSL/TLS certificate management #certificate-management
- [feature] Data integrity verification #integrity-checking

## Handlers

```yaml
# [handler] Restart firewall service #firewall-restart
# [handler] Restart SSH daemon #ssh-restart
# [handler] Reload audit configuration #audit-reload
# [handler] Restart fail2ban service #fail2ban-restart
# [handler] Update certificate stores #cert-update
```

## Dependencies

- [dependency] Base system role for essential packages #base-system
- [requirement] Network connectivity for security updates #network
- [requirement] Administrative privileges for system changes #admin-access

## Security Compliance

### Standards Alignment

- [compliance] CIS (Center for Internet Security) benchmarks #cis-compliance
- [compliance] NIST cybersecurity framework alignment #nist-compliance
- [compliance] Common security best practices #best-practices

### Verification

- [verification] Automated security configuration testing #config-testing
- [verification] Security posture assessment scripts #posture-assessment
- [verification] Compliance reporting capabilities #compliance-reporting

## Observations

- [security] Comprehensive security hardening coverage #complete-security
- [automation] Automated security configuration deployment #automated-security
- [compliance] Industry standard security practices #standard-compliance
- [monitoring] Continuous security monitoring capabilities #continuous-monitoring

## Relations

- depends_on \[[Base System Role]\]
- hardens \[[SSH Configuration]\]
- protects \[[User Account Management]\]
- monitors \[[System Activity]\]
