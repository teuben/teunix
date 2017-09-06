#! /bin/csh -f
#    find source code in the local tree and below
#
if ($#argv == 0) then
  echo "Usage: $0 arg1 [arg2  ...]"
  echo 'Search for files *arg1* from your current working directory down'
  exit 1
endif

foreach a ($*)
  find . -name \*$a\* -print
end
