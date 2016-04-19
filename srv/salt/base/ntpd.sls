set timezone:
  ntp:
    pkg:
      - installed
  timezone.system:
    - name: Asia/Kuala_Lumpur
    - utc: True
  cmd.run:
    - name: /usr/sbin/ntpdate 0.centos.pool.ntp.org
    - watch:
      - pkg: ntp

set timezone:
  ntp:
    pkg:
      - installed
  timezone.system:
    - name: Asia/Kuala_Lumpur
    - utc: True
  cmd.run:
    - name: /usr/sbin/ntpdate 0.centos.pool.ntp.org
    - watch:
      - pkg: ntp