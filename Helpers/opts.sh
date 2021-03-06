#!/bin/bash

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
	-e|--extension)
	EXTENSION="$2"
	shift # past argument
	;;
	-s|--searchpath)
	SEARCHPATH="$2"
	shift # past argument
	;;
	--default)
	DEFAULT=YES
	;;
	*)
		# unknown option
	;;
esac
shift # past argument of value
done
echo FILE EXTENSION	= "${EXTENSION}"
echo SEARCH PATH	= "${SEARCHPATH}"
echo LIBRARY PATH	= "${LIBPATH}"
echo "Number of files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
if [[ -n $1 ]]; then
	echo "Last line of file specified as non-opt/last argument:"
	tail -1 $1
fi