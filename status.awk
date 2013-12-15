#!/usr/bin/awk -f

{
	{if ($0 ~ /^Row/) {print}}
	{if ($0 ~ /\*/) {print}}
}

