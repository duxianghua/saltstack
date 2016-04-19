set timezone:
  ntp:
    pkg:
      - installed
  timezone.system:
    - name: {{ pillar[custom][time_zone] }}
    - utc: True
  cmd.run:
    - name: /usr/sbin/ntpdate {{ pillar[custom][ntp_server] }}
    - watch:
      - pkg: ntp