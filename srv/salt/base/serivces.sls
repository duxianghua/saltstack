#disable not use services
{% for item in pillar[custom][disable_services] %}
{{ item }}:
  service.dead:
    - enable: False
{% endfor %}

packages install:
{% for item in pillar[custom][install_services] %}
  pkg.installed:
{% endfor %}