iptables:
  file.managed:
    - source: salt://templates/iptables/iptables.j2
    - name: /etc/sysconfig/iptables
    - mode: 0600
    - user: root
    - group: root
    - template: jinja
  services.running:
    - name: iptables
    - restart: True
    - watch:
      - file: /etc/sysconfig/iptables