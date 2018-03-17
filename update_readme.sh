#!/bin/bash

sed -i -e '/##\ List of Ebuilds/,$d' README.md

echo -e "## List of Ebuilds\n" >> README.md

for i in $(find  -name \*ebuild|sort|sed -e 's/\-[0-9\.r\-]\+\.ebuild//'|uniq|sed -e 's/^\.\/\S\+-\S\+\///'|sort) ; do
	ebuild=$(find -name \*$i\*ebuild|tail -n1)
	if [[ $ebuild =~ "dev-perl" ]] ; then
		continue
	fi
	site=$(grep HOMEPAGE $ebuild|sed -e 's/^HOMEPAGE=//' -e 's/"//g')
	desc=$(grep DESCRIPTION $ebuild|sed -e 's/^DESCRIPTION=//' -e 's/"//g')
	echo -e "  - [${i}](${site})\n    ${desc}" >> README.md
done
