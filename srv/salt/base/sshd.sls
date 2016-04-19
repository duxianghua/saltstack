sshd config:
  file.managed:
    - source: salt://templates/ssh/sshd_config
    - name: /etc/ssh/sshd_conf
    - user: root
    - group: root
    - mode: 0644
  service.running:
    - enable: True
    - restart: True
    - watch: 
      - file: /etc/ssh/sshd_config