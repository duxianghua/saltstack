nginx_install:
  pkg.installed:
    - name: nginx
  file.managed:
    - source: salt://templates/nginx/nginx.conf
    - name: /etc/nginx/nginx.conf
    - require:
      - pkg: nginx
  file.managed:
    - source: salt://templates/nginx/default.conf
    - name: /etc/nginx/conf.d/default.conf
    - watch:
      - file: /etc/nginx/conf.d/default.conf
  service.runing:
    - name: nginx
    - enable: True
    - restart: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d/default.conf