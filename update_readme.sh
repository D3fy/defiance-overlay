#!/bin/bash

sed -i -e '/##\ List of Ebuilds/,$d' README.md

echo -e "## List of Ebuilds\n" >> README.md

VERSIONS=()
for p in $(find -maxdepth 2 -mindepth 2 -type d -not -path ./.git/\* -not -path ./metadata/\* |sort|uniq) ; do
	if [[ $p =~ "dev-perl" ]] ; then
		continue
	fi
	CATEGORY=${p#.\/}
	CATEGORY=${CATEGORY%%\/*}

	if [ "${PREVIOUS_CATEGORY}" != "${CATEGORY}" ] ; then
		echo "  - [$CATEGORY](https://packages.gentoo.org/categories/${CATEGORY})" >> README.md
	fi
	for e in $(find $p -name \*.ebuild|sort) ; do
		NAME=${e##*\/}
		NAME=${NAME%.ebuild}
		VERSION=${NAME##*-}
		NAME=${NAME%-*}
		VERSIONS+=($VERSION)
		site=$(grep HOMEPAGE $e|sed -e 's/^HOMEPAGE=//' -e 's/"//g')
		desc=$(grep DESCRIPTION $e|sed -e 's/^DESCRIPTION=//' -e 's/"//g')
	done
	echo -en "    - [${NAME}]($site) - " >> README.md
	for v in ${VERSIONS[@]} ; do
		echo -en " [${v}](/${CATEGORY}/${NAME}/${NAME}-${v}.ebuild)" >> README.md
	done
	echo " -" >> README.md
	echo "      ${desc}" >> README.md

	VERSIONS=()
	PREVIOUS_CATEGORY=$CATEGORY
done
