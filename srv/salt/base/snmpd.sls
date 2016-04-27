net-snmp install:
  pkg.installed:
    - name net-snmp
  file.managed:
    - source: salt://templates/snmpd/snmpd.conf
    - name: /etc/snmp/snmpd.conf
    - mode: 0600
    - user: root
    - group: root
    - watch:
      - file: /etc/snmp/snmpd.conf