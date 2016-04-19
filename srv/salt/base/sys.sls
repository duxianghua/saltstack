/etc/sysctl.conf:
  file.append:
    - text:
      - fs.file-max = 999999
      - vm.swappiness = 0
      - net.core.somaxconn = 1024
      - net.ipv4.tcp_tw_recycle = 1
      - net.ipv4.tcp_tw_reuse = 1
      - net.core.rmem_max = 8388608
      - net.core.wmem_max = 8388608
      - net.ipv4.tcp_max_syn_backlog = 4096
      - net.ipv4.ip_local_port_range = 1024 65535
  cmd.run:
    - name: sysctl -p
    - watch:
      - file: /etc/sysctl.conf

/etc/security/limits.conf:
  file.append:
    - text:
      - "*         soft     nofile    999999"
      - "*         hard     nofile    999999"