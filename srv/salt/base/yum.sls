install_EPEL_repo:
  file.managed:
    - source: salt://templates/repo/epel_6.repo
    - name: /etc/yum.repos.d/EPEL_6.repo
    - user: root
    - group: root
    - mode: 0644
install_EPEL_KEY:
  file.managed:
    - source: salt://templates/repo/RPM-GPG-KEY-EPEL-6
    - name: /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
    - user: root
    - group: root
    - mode: 0644

install_IUS_repo:
  file.managed:
    - source: salt://templates/repo/IUS_6.repo
    - name: /etc/yum.repos.d/IUS_6.repo
    - user: root
    - group: root
    - mode: 0644
install_IUS_KEY:
  file.managed:
    - source: salt://templates/repo/IUS-COMMUNITY-GPG-KEY
    - name: /etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY
    - user: root
    - group: root
    - mode: 0644