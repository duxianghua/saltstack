nodejs-install:
  cmd.run:
    - name: curl -sL https://rpm.nodesource.com/setup_5.x | bash -
  pkg.installed:
    - name: nodejs
  npm.installed:
    - pkgs:
      - inherits
      - underscore
      - mysql
      - async
      - iconv-lite
      - redis
      - ain2
      #- unix-dgram
