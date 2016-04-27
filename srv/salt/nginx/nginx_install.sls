nginx_install:
  pkg.installed:
    - name: nginx
  file.managed:
    - source: salt://templates/nginx/nginx.conf
    - name: /etc/nginx/nginx.conf
    - template: jinja
    - require:
      - pkg: nginx
  service.running:
    - name: nginx
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/nginx.conf
nginx_configure:
  file.managed:
    - source: salt://templates/nginx/default.conf
    - name: /etc/nginx/conf.d/default.conf
    - require:
      - pkg: nginx
  service.running:
    - name: nginx
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/conf.d/default.conf