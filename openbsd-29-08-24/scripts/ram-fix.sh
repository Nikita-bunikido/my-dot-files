#!/bin/sh

mem_full=$(($(sysctl -n hw.physmem) / 1024 / 1024))

while read -r _ _ line _; do
	mem_used=${line%%M}

done <<-EOF
	$(vmstat)
EOF

mem_percentage=$(echo "$mem_used/$mem_full*100.0" | bc -l)
printf "%.0f" "$mem_percentage"
