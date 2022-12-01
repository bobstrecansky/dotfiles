#!/bin/bash
#
# Sets DNS search on GlobalProtect
# usage: ./setSearch.sh rsglab.com
usage() {
  cat <<EOF

Usage: $(basename "${BASH_SOURCE[0]}") search_domain [search_domain2...]

Sets the GlobalProtect DNS search domain(s). Separate by a space.

$(basename "${BASH_SOURCE[0]}") rsglab.com

EOF
  exit
}

scutil_set()
{
	echo
	echo "This script requires sudo. You could be prompted for your password"
	sudo scutil<<EOT
	open
	get State:/Network/Service/gpd.pan/DNS
	d.add SearchDomains * $@
	set State:/Network/Service/gpd.pan/DNS
	get State:/Network/Service/gpd.pan/DNS
	d.show
	close
EOT
}

[[ -z "$@" ]] && usage
scutil_set "$@"
