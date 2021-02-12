# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import tftpd__hpa with context %}

tftpd-hpa-package-install-pkg-installed:
  pkg.installed:
    - name: {{ tftpd__hpa.pkg.name }}
