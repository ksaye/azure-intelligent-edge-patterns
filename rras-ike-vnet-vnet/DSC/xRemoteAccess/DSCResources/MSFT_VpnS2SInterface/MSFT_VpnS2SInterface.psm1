function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[System.String]
		$Ensure
	)
    
    $S2SInterface = Get-VPNS2SInterface -Name $Name -ErrorAction SilentlyContinue

	$returnValue = @{
        AdminStatus = [System.Boolean]$S2SInterface.AdminStatus
		AuthenticationMethod = [System.String]$S2SInterface.AuthenticationMethod
		Certificate = [System.String]$S2SInterface.Certificate
        ConnectionState = [System.String]$S2SInterface.ConnectionState
		Destination = [System.String]$S2SInterface.Destination
		EapMethod = [System.String]$S2SInterface.EapMethod
        EnableQOS = [System.String]$S2SInterface.EnableQOS		
        EncryptionType = [System.String]$S2SInterface.EncryptionType
		Ensure = [System.String]$Ensure
		IdleDisconnectSeconds = [System.UInt32]$S2SInterface.IdleDisconnect
		InitiateConfigPayload = [System.Boolean]$S2SInterface.InitiateConfigPayload
        InterfaceType = [System.String]$S2SInterface.InterfaceType
		InternalIPv4 = [System.Boolean]$S2SInterface.InternalIPv4
        InternalIPv6 = [System.Boolean]$S2SInterface.InternalIPv6
        IPv4Subnet = [System.String]$S2SInterface.IPv4Subnet
		IPv4TriggerFilter = [System.String[]]$S2SInterface.IPv4TriggerFilter
		IPv4TriggerFilterAction = [System.String]$S2SInterface.IPv4TriggerFilterAction
        IPv6Subnet = [System.String[]]$S2SInterface.IPv6Subnet		
		IPv6TriggerFilter = [System.String[]]$S2SInterface.IPv6TriggerFilter
        IPv6TriggerFilterAction = [System.String]$S2SInterface.IPv6TriggerFilterAction
        Name = [System.String]$S2SInterface.Name
		NetworkOutageTimeSeconds = [System.UInt32]$S2SInterface.NetworkOutageTime
		NumberOfTries = [System.UInt32]$S2SInterface.NumberOfTries
		Persistent = [System.Boolean]$S2SInterface.Persistent
		PostConnectionIPv4Subnet = [System.String[]]$S2SInterface.PostConnectionIPv4Subnet
		PostConnectionIPv6Subnet = [System.String[]]$S2SInterface.PostConnectionIPv6Subnet
		PromoteAlternate = [System.Boolean]$S2SInterface.PromoteAlternate
		Protocol = [System.String]$S2SInterface.Protocol
	    PSComputerName = [System.String]$S2SInterface.PSComputerName
        ResponderAuthenticationMethod = [System.String]$S2SInterface.ResponderAuthenticationMethod
		RetryIntervalSeconds = [System.UInt32]$S2SInterface.RetryInterval
		RxBandwidthKbps = [System.UInt64]$S2SInterface.RxBandwidthKbps
		SADataSizeForRenegotiationKilobytes = [System.UInt32]$S2SInterface.SADataSizeForRenegotiation
		SALifeTimeSeconds = [System.UInt32]$S2SInterface.SALifeTime
		SourceIpAddress = [System.String]$S2SInterface.SourceIpAddress
		TxBandwidthKbps = [System.UInt64]$S2SInterface.TxBandwidthKbps
		UnReachabilityReasons = [System.String]$S2SInterface.UnReachabilityReasons
        User = [System.String]$S2SInterface.UserName
	}

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[System.Boolean]
		$AdminStatus,

		[System.String]
		$AuthenticationMethod,

		[ValidateSet("SHA256128","MD596","SHA196","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$Certificate,

		[ValidateSet("DES","DES3","AES128","AES192","AES256","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$Destination,

		[System.String]
		$EapMethod,

		[System.Boolean]
		$EnableQoS,

		[System.String]
		$EncryptionMethod,

		[System.String]
		$EncryptionType,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.Boolean]
		$InitiateConfigPayload,

		[System.String]
		$IPv4Subnet,

		[System.String[]]
		$IPv4TriggerFilter,

		[System.String]
		$IPv4TriggerFilterAction,

		[System.String[]]
		$IPv6Subnet,

		[System.String[]]
		$IPv6TriggerFilter,

		[System.String]
		$IPv6TriggerFilterAction,

		[System.String]
		$IntegrityCheckMethod,

		[System.Boolean]
		$InternalIPv4,

		[System.Boolean]
		$InternalIPv6,

		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[System.UInt32]
		$NetworkOutageTimeSeconds,

		[System.UInt32]
		$NumberOfTries,

		[System.Boolean]
		$Persistent,

		[System.String]
		$PfsGroup,

		[System.String[]]
		$PostConnectionIPv4Subnet,

		[System.String[]]
		$PostConnectionIPv6Subnet,

		[System.Boolean]
		$PromoteAlternate,

		[System.String]
		$Protocol,

		[System.String]
		$RadiusAttributeClass,

		[System.String]
		$ResponderAuthenticationMethod,

		[System.UInt32]
		$RetryIntervalSeconds,

		[System.String]
		$RoutingDomain,

		[System.UInt64]
		$RxBandwidthKbps,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds,

		[System.String]
		$SharedSecret,

		[System.String]
		$SourceIpAddress,

		[System.UInt32]
		$ThrottleLimit,

		[System.UInt64]
		$TxBandwidthKbps,

		[System.Management.Automation.PSCredential]
		$User
	)
   
    $Params = $PSBoundParameters
    $output = $Params.Remove('Ensure')
    $output = $Params.Remove('Debug')
    $output = $Params.Remove('Verbose')
    $output = $Params.Remove('DependsOn')

    if ($Ensure -eq 'Present') {
        Add-VpnS2SInterface @Params
        #Set-VpnS2SInterface @Params
    }
    if ($Ensure -eq 'Absent') {
        Remove-VpnS2SInterface
    }
}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[System.Boolean]
		$AdminStatus,

		[System.String]
		$AuthenticationMethod,

		[ValidateSet("SHA256128","MD596","SHA196","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$Certificate,

		[ValidateSet("DES","DES3","AES128","AES192","AES256","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$Destination,

		[System.String]
		$EapMethod,

		[System.Boolean]
		$EnableQoS,

		[System.String]
		$EncryptionMethod,

		[System.String]
		$EncryptionType,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.Boolean]
		$InitiateConfigPayload,

		[System.String]
		$IPv4Subnet,

		[System.String[]]
		$IPv4TriggerFilter,

		[System.String]
		$IPv4TriggerFilterAction,

		[System.String[]]
		$IPv6Subnet,

		[System.String[]]
		$IPv6TriggerFilter,

		[System.String]
		$IPv6TriggerFilterAction,

		[System.String]
		$IntegrityCheckMethod,

		[System.Boolean]
		$InternalIPv4,

		[System.Boolean]
		$InternalIPv6,

		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[System.UInt32]
		$NetworkOutageTimeSeconds,

		[System.UInt32]
		$NumberOfTries,

		[System.Boolean]
		$Persistent,

		[System.String]
		$PfsGroup,

		[System.String[]]
		$PostConnectionIPv4Subnet,

		[System.String[]]
		$PostConnectionIPv6Subnet,

		[System.Boolean]
		$PromoteAlternate,

		[System.String]
		$Protocol,

		[System.String]
		$RadiusAttributeClass,

		[System.String]
		$ResponderAuthenticationMethod,

		[System.UInt32]
		$RetryIntervalSeconds,

		[System.String]
		$RoutingDomain,

		[System.UInt64]
		$RxBandwidthKbps,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds,

		[System.String]
		$SharedSecret,

		[System.String]
		$SourceIpAddress,

		[System.UInt32]
		$ThrottleLimit,

		[System.UInt64]
		$TxBandwidthKbps,

		[System.Management.Automation.PSCredential]
		$User
	)

    $result = [System.Boolean]$false
    $VpnS2SInterface = Get-VpnS2SInterface

    # To validate configuration rather than deployment, this should test all properties

    # Should see if the name is in a list of names, if more than 1

	if ($Ensure -eq 'Present' -and $VpnS2SInterface.Name -eq $Name) {
        $result = [System.Boolean]$true
    }
    if ($Ensure -eq 'Absent' -and $VpnS2SInterface.Name -eq $Name) {
        $result = [System.Boolean]$true
    }
	
	$result
}


Export-ModuleMember -Function *-TargetResource

