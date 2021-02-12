# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import tftpd__hpa with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

tftpd-hpa-config-file-file-managed:
  file.managed:
    - name: {{ tftpd__hpa.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='tftpd-hpa-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ tftpd__hpa.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        tftpd__hpa: {{ tftpd__hpa | json }}
