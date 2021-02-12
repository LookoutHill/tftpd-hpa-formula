# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import tftpd__hpa with context %}

include:
  - {{ sls_config_clean }}

tftpd-hpa-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ tftpd__hpa.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
