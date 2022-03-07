
$path = $args[0]


if (($path) -eq "") {
	""
	"No input"
} else {
	$v = get-item -force -literalPath $path
	$v1 = "$($v.LinkType)"

	"$path"

	# [d 1=] (($v1) -eq "Junction")
	if (($v1) -eq "SymbolicLink") {
		""
		"Current target: $($v.target)"
		
		""
		$v1 = read-host "New target"
		$null = New-Item -Type SymbolicLink -Path $path -Target $v1 -Force		# n [1]
	} else {
		""
		"That type of subject is not supported"
	}
}


""
read-host "Press Enter to continue.."
