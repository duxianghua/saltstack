#disable not use services
{% for item in pillar[disable_services] %}
{{ item }}:
  service.dead:
    - enable: False
{% endfor %}

packages install:
  pkg.installed:
    - pkgs:
      - sysstat
      - man
      - wget
      - screen
      - gcc-c++