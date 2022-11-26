#!/bin/bash

if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   #... is correctly installed
  swift package tools-version --set-current
  swift test #Tests whatever is inside the Test folder
fi


