Function Get-PSCalendarConfiguration {
    [cmdletbinding()]
    [OutputType("PSCalendarConfiguration")]
    Param()

    Write-Verbose "Starting: $($MyInvocation.MyCommand) [v$modVer]"
    if ($MyInvocation.CommandOrigin -eq 'Runspace') {
        #Hide this metadata when the command is called from another command
        Write-Verbose "Using PowerShell version: $($PSVersionTable.PSVersion)"
        Write-Verbose "Running in PowerShell host: $($host.name)"
    }

    #define an version appropriate escape string
    if ($IsCoreCLR) {
        $e = '`e'
    }
    else {
        $e = '$([Char]27)'
    }

    [PSCustomObject]@{
        PSTypeName = "PSCalendarConfiguration"
        Title      = "$($pscalendarConfiguration.title){0}{1}$esc[0m" -f $e, $(($PSCalendarConfiguration.Title.ToCharArray() | Select-Object -Skip 1 ) -join "")
        DayOfWeek  = "$($pscalendarConfiguration.DayOfWeek){0}{1}$esc[0m" -f $e, $(($PSCalendarConfiguration.DayOfWeek.ToCharArray() | Select-Object -Skip 1 ) -join "")
        Today      = "$($pscalendarConfiguration.Today){0}{1}$esc[0m" -f $e, $(($PSCalendarConfiguration.Today.ToCharArray() | Select-Object -Skip 1 ) -join "")
        Highlight  = "$($pscalendarConfiguration.highlight){0}{1}$esc[0m" -f $e, $(($PSCalendarConfiguration.Highlight.ToCharArray() | Select-Object -Skip 1 ) -join "")
        Weekend    = "$($pscalendarConfiguration.Weekend){0}{1}$esc[0m" -f $e, $(($PSCalendarConfiguration.Weekend.ToCharArray() | Select-Object -Skip 1 ) -join "")

    }
    Write-Verbose "Ending: $($MyInvocation.MyCommand)"
}
