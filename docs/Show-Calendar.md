---
external help file: PSCalendar-help.xml
Module Name: PSCalendar
online version: https://jdhitsolutions.com/yourls/ed712d
schema: 2.0.0
---

# Show-Calendar

## SYNOPSIS

Display a colorized calendar month in the console.

## SYNTAX

### month

```yaml
Show-Calendar [[-Month] <String>] [[-Year] <Int32>] [-HighLightDate <Object>] [-FirstDay <DayOfWeek>] [-Position <Coordinates>] [-MonthOnly] [<CommonParameters>]
```

### quarter

```yaml
Show-Calendar -Quarter <Int32> [[-Year] <Int32>] [-HighLightDate <Object>] [-FirstDay <DayOfWeek>] [-MonthOnly] [<CommonParameters>]
```

### calyear

```yaml
Show-Calendar [-HighLightDate <Object>] [-FirstDay <DayOfWeek>] [-MonthOnly] -CalendarYear <Int32>
 [<CommonParameters>]
```

## DESCRIPTION

This command is a wrapper for Get-Calendar that essentially shows the same result. The only difference is that you can use Show-Calendar to display the calendar at a specific position in your PowerShell session. This function is also retained for backward compatibility.

To specify highlighted dates you can pass an array of date strings or a hashtable. The hashtable key will be the date and the value will be the color style to use for that date. See examples.

## EXAMPLES

### Example 1

```powershell
PS C:\> Show-Calendar
```

Display a colorized version of the current month.

### Example 2

```powershell
PS C:\> Show-Calendar -Month February -Year 2025 -HighLightDate 2/22/21
```

Display February 2025 and highlight the 22nd using the default highlight color.

### Example 3

```powershell
PS C:\> Show-Calendar  -Position ([system.management.automation.host.coordinates]::new(75,1))
```

Display the calendar at a specified X,Y position in the console. This parameter will not work in the PowerShell ISE.

### Example 4

```powershell
PS C:\> Show-Calendar -Month January -Year 2025 -MonthOnly

               January 2025

 Sun   Mon   Tue   Wed   Thu   Fri   Sat
                     1     2     3     4
   5     6     7     8     9    10    11
  12    13    14    15    16    17    18
  19    20    21    22    23    24    25
  26    27    28    29    30    31
```

Suppress leading and trailing days from other months with the MonthOnly parameter.

### Example 5

```powershell
PS C:\> Show-Calendar -Quarter 2
```

Display the months for the second quarter of the current year. The months will be displayed in a single column.

### Example 6

```powershell
PS C:\> $h = @{
  "8/1/2025"  = "`e[1;3;38;5;213m"
  "8/13/2025" = $PSStyle.Foreground.BrightYellow
  "8/18/2025" = $PSStyle.Foreground.BrightYellow
  "8/9/2025"  = $PSStyle.Foreground.BrightMagenta
  "8/29/2025" = $PSStyle.Foreground.BrightRed
}
PS C:\> Show-Calendar August -FirstDay Monday -HighLightDate $h

                August 2025

 Mon   Tue   Wed   Thu   Fri   Sat   Sun
  28    29    30    31     1     2     3
   4     5     6     7     8     9    10
  11    12    13    14    15    16    17
  18    19    20    21    22    23    24
  25    26    27    28    29    30    31
   1     2     3     4     5     6     7
```

Highlight dates using a hashtable. The key is the date and the value is the color style to use for that date. You can use an ANSI escape sequence or a predefined color from $PSStyle. The dates will be formatted accordingly.

## PARAMETERS

### -Month

Select a month to display. The command will default to the current year unless otherwise specified.

```yaml
Type: String
Parameter Sets: month
Aliases:

Required: False
Position: 1
Default value: Current month
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quarter

Specify a calendar year quarter to display.

```yaml
Type: Int32
Parameter Sets: quarter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CalendarYear

Enter a year between 1000 and 3000 to display in calendar view.

```yaml
Type: Int32
Parameter Sets: calyear
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Year

Select a year for the specified month.

```yaml
Type: Int32
Parameter Sets: month, quarter
Aliases:

Required: False
Position: 2
Default value: current year
Accept pipeline input: False
Accept wildcard characters: False
```

### -HighLightDate

Specific days (named) to highlight. These dates are color formatted using ANSI escape sequences. You must format the dates to match your culture. It should match the pattern you get from running this command:

(Get-Culture).DateTimeFormat.ShortDatePattern

You can specify an array of strings or use a hashtable. See examples.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Position

Enter a System.Management.Automation.Host.Coordinates object to specify a location for the calendar. This may not work properly in all hosts or PowerShell versions and you might need some trial and error to figure out a position that works for you.

```yaml
Type: Coordinates
Parameter Sets: month
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstDay

Specify the first day of the week. There is a potential bug in .NET Core where the detected first day of the week is incorrect. If that is true for your culture, use this parameter to manually specify the correct first day of the week.

```yaml
Type: DayOfWeek
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: ([System.Globalization.CultureInfo]::CurrentCulture).DateTimeFormat.FirstDayOfWeek
Accept pipeline input: False
Accept wildcard characters: False
```

### -MonthOnly

Do not show any leading or trailing days.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.String

## NOTES

This command should have an alias of scal.

Learn more about PowerShell: https://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Get-Calendar](Get-Calendar.md)

[Show-GuiCalendar](Show-GuiCalendar.md)
