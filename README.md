# errata_info_with_hosts

The main idea of this script is to generate a errata report as in Satellite webUI, including the # of affected content hosts (applicable erratas).

```
# ./errata_info_with_hosts.sh
id,errata_id,erratum_type,title,count,issued,updated
4906,RHSA-2021:4904,security,Critical: nss security update,1,2021-12-01,2021-12-01
4915,RHBA-2021:4789,bugfix,kbd bug fix and enhancement update,2,2021-11-23,2021-11-23
4913,RHBA-2021:4794,bugfix,gettext bug fix and enhancement update,2,2021-11-23,2021-11-23
...
```

Note. By default, hammer is not adding this information.
