#!/bin/bash

#
# Date ......: 12/04/2021
# Developer .: Waldirio <waldirio@gmail.com>|<waldirio@redhat.com>
#              Jaskaran Narula <janarula@redhat.com>
# Purpose ...: Add the # of content hosts affected by the errata
# License ...: GPL3
#

erratum_list=$(hammer --csv --no-headers erratum list --errata-restrict-applicable true --errata-restrict-installable false)

echo "id,errata_id,erratum_type,title,count,issued,updated"

echo "$erratum_list" |  while read b
do
  id=$(echo $b | cut -d, -f1)
  errata_id=$(echo $b | cut -d, -f2)
  erratum_type=$(echo $b | cut -d, -f3)
  title=$(echo $b | cut -d, -f4)
  issued=$(echo $b | cut -d, -f5)
  updated=$(echo $b | cut -d, -f6)

  count=0
  for y in $(hammer --csv --no-headers host list --thin 1 --search 'name !~ virt-who' --fields name)
  do
    command=$(hammer --csv --no-headers erratum list --errata-restrict-applicable true --errata-restrict-installable false --host $y | grep "$errata_id" | wc -l)
    if [ $command -ne 0 ]; then
      (( count = count + 1 ))
    fi
  done

  echo "$id,$errata_id,$erratum_type,$title,$count,$issued,$updated"
done
