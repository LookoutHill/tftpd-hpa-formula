# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import tftpd__hpa with context %}

tftpd-hpa-service-clean-service-dead:
  service.dead:
    - name: {{ tftpd__hpa.service.name }}
    - enable: False
