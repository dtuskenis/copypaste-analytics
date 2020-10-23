#!/bin/sh

# $1 - path to xml file that is output of pmd-cpd

echo $(xmllint --xpath "count(//duplication)" $1)
