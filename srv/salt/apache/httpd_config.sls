httpd_conf_file_managed:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://templates/apache/httpd.conf
    - user: root
    - group: root
    - mode: 0644
  service.running:
    - name: httpd
    - reload: True
    - watch:
      - file: /etc/httpd/conf/httpd.conf 