#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCOINNICKELD=${BITCOINNICKELD:-$BINDIR/bitcoinnickeld}
BITCOINNICKELCLI=${BITCOINNICKELCLI:-$BINDIR/bitcoinnickel-cli}
BITCOINNICKELTX=${BITCOINNICKELTX:-$BINDIR/bitcoinnickel-tx}
BITCOINNICKELQT=${BITCOINNICKELQT:-$BINDIR/qt/bitcoinnickel-qt}

[ ! -x $BITCOINNICKELD ] && echo "$BITCOINNICKELD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BCONVER=($($BITCOINNICKELCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoinnickeld if --version-string is not set,
# but has different outcomes for bitcoinnickel-qt and bitcoinnickel-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCOINNICKELD --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCOINNICKELD $BITCOINNICKELCLI $BITCOINNICKELTX $BITCOINNICKELQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BCONVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BCONVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
