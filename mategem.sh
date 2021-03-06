#!/bin/sh
gemname=$1
gempath=''
bundleshow() {
  gempath=`bundle show $gemname`
  rc=$?

  if [[ $rc -ne 0 ]] ; then
    echo $gempath
    return 1
  fi
  
  return 0
}

gemwhich() {
  gemlib=`gem which $gemname`
  rc=$?
  if [[ $rc -ne 0 ]] ; then
    echo $gemlib
    return 1
  fi
  
  gempath=`echo $gemlib | sed 's/\/lib\/.*//'`
  return 0
}



bundleshow
rc=$?
if [[ $rc -eq 0 ]] ; then
  mate $gempath
  echo $gempath
  exit 0
fi

gemwhich
rc=$?
if [[ $rc -eq 0 ]] ; then
  mate $gempath
  echo $gempath
  exit 0
fi

echo "Can't find $gemname"