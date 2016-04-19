#disable not use services
{% for item in pillar[custom][disable_services] %}
{{ item }}:
  service.dead:
    - enable: False
{% endfor %}

packages install:
  pkg.installed:
    - pkgs:
       {{ pillar['custom']['install_services'] }}