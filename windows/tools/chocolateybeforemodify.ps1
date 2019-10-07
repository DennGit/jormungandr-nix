﻿$CLI="jcli"
$NODE="jormungandr"

function Stop-Jormungandr {
	[CmdletBinding(SupportsShouldProcess)]
	param ($NAME)

	[System.Diagnostics.Process[]]$PROCESSLIST = Get-Process -Name $NAME -ErrorAction SilentlyContinue
	if ($PROCESSLIST) {
		Write-Output "Found $NAME running.  Shutting down $NAME..."
		ForEach ($Process in $PROCESSLIST) {
			$Process | Stop-Process -Force -Confirm:$false
		}
	}
}

Write-Output "Stopping any running jormungandr processes before upgrading or uninstalling..."
Stop-Jormungandr $CLI
Stop-Jormungandr $NODE
