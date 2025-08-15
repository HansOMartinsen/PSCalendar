---
external help file: PSCalendar-help.xml
Module Name: PSCalendar
online version: https://jdhitsolutions.com/yourls/9fcd90
schema: 2.0.0
---

# Get-PSCalendar

## SYNOPSIS

Displays a visual representation of a calendar.

## SYNTAX

### month (Default)

```yaml
Get-PSCalendar [[-Month] <String>] [[-Year] <Int32>] [-HighLightDate <Object>] [-FirstDay <DayOfWeek>] [-NoANSI] [-NoWeekEnd] [-MonthOnly] [<CommonParameters>]
```

### quarter

```yaml
Get-PSCalendar -Quarter <Int32> [[-Year] <Int32>] [-HighLightDate <Object>] [-FirstDay <DayOfWeek>] [-NoANSI] [-NoWeekEnd] [-MonthOnly] [<CommonParameters>]
```

### span

```yaml
Get-PSCalendar -Start <String> -End <String> [-HighLightDate <Object>] [-FirstDay <DayOfWeek>] [-NoANSI] [-NoWeekEnd] [-MonthOnly] [<CommonParameters>]
```

### calyear

```yaml
Get-PSCalendar [-HighLightDate <Object>] [-FirstDay <DayOfWeek>] [-NoANSI] [-NoWeekEnd] [-MonthOnly]
 -CalendarYear <Int32> [<CommonParameters>]
```

## DESCRIPTION

This command displays a visual representation of a calendar. It supports multiple months, as well as the ability to highlight a specific date or dates. The default display uses ANSI escape sequences. You can adjust the color scheme using Set-PSCalendarConfiguration.

To specify highlighted dates you can pass an array of date strings or a hashtable. The hashtable key will be the date and the value will be the color style to use for that date. See examples.

When you enter Highlight, Start, or End dates, be sure to use the format that is culturally appropriate. It should match the pattern you get from running this command:

  (Get-Culture).DateTimeFormat.ShortDatePattern

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSCalendar

                March 2025

 Sun   Mon   Tue   Wed   Thu   Fri   Sat
  23    24    25    26    27    28     1
   2     3     4     5     6     7     8
   9    10    11    12    13    14    15
  16    17    18    19    20    21    22
  23    24    25    26    27    28    29
  30    31     1     2     3     4     5
```

Show the current month. The current day will be formatted in color.

### Example 2

```powershell
PS C:\> Get-PSCalendar -start "3/1/2025" -end "5/1/2025"
```

Display monthly calendars from March to May, 2025.

### Example 3

```powershell
PS C:\> Get-PSCalendar December -HighLightDate 12/4/2025,12/25/2025,12/24/2025,12/31/2025

               December 2025

 Sun   Mon   Tue   Wed   Thu   Fri   Sat
  30     1     2     3     4     5     6
   7     8     9    10    11    12    13
  14    15    16    17    18    19    20
  21    22    23    24    25    26    27
  28    29    30    31     1     2     3
```

Display a month and highlight specific dates in color.

### Example 4

```powershell
PS C:\>  Get-PSCalendar August -FirstDay Monday  -NoANSI

                August 2025

 Mon   Tue   Wed   Thu   Fri   Sat   Sun
  28    29    30    31     1     2     3
   4     5     6     7     8     9    10
  11    12    13    14    15    16    17
  18    19    20    21    22    23    24
  25    26    27    28    29    30    31
   1     2     3     4     5     6     7
```

In Windows PowerShell, all of the commands appear to respect culture settings. However, when running in PowerShell 7 there appears to be a bug in .NET Core and how it returns culture information for some cultures, specifically the first day of the week. If you run Get-PSCalendar or Show-Calendar and the week begins on the wrong day, use the FirstDay parameter to override the detected .NET values with the correct one. If you are running under the en-AU culture in PowerShell 7, you most likely will need to use the FirstDay parameter.

### Example 5

```powershell
PS C:\> Get-PSCalendar -NoANSI -Start 7/1/2025 -end 9/1/2025  | Out-File c:\work\Q3.txt
```

Get the calendars for a month of ranges with no ANSI formatting and save the output to a text file.

### Example 6

```powershell
PS C:\> Get-PSCalendar -Month January -Year 2025 -NoANSI -MonthOnly

              January 2025

 Sun   Mon   Tue   Wed   Thu   Fri   Sat
                     1     2     3     4
   5     6     7     8     9    10    11
  12    13    14    15    16    17    18
  19    20    21    22    23    24    25
  26    27    28    29    30    31
```

Suppress leading and trailing days from other months with the MonthOnly parameter.

### Example 7

```powershell
PS C:\> Get-PSCalendar -CalendarYear 2025 -NoANSI | Out-File c:\work\2025.txt
```

Create a yearly calendar for 2025 and save the output to a text file.

### Example 8

```powershell
PS C:\> Get-PSCalendar -Quarter 2
```

Display the months for the second quarter of the current year. The months will be displayed in a single column.

### Example 9

```powershell
PS C:\> $h = @{
  "8/1/2025"  = "`e[1;3;38;5;213m"
  "8/13/2025" = $PSStyle.Foreground.BrightYellow
  "8/18/2025" = $PSStyle.Foreground.BrightYellow
  "8/9/2025"  = $PSStyle.Foreground.BrightMagenta
  "8/29/2025" = $PSStyle.Foreground.BrightRed
}
PS C:\> Get-PSCalendar August -FirstDay Monday -HighLightDate $h

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
Position: 0
Default value: current month
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
Position: 1
Default value: Current year
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start

The first month to display. You must format the dates to match your culture. It should match the pattern you get from running this command:

(Get-Culture).DateTimeFormat.ShortDatePattern

```yaml
Type: String
Parameter Sets: span
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -End

The last month to display. You must format the dates to match your culture. It should match the pattern you get from running this command:

(Get-Culture).DateTimeFormat.ShortDatePattern

```yaml
Type: String
Parameter Sets: span
Aliases:

Required: True
Position: Named
Default value: None
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

### -NoANSI

Do not use any ANSI formatting. The output will be plain-text. This also means that the current day and highlight dates will not be reflected in the output. This parameter has no affect when running the command in the PowerShell ISE. There is no color formatting when using this host.

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

### -MonthOnly

Do not show any leading or trailing days from other months.

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

### -NoWeekEnd

Do not highlight weekends. If you use the NoAnsi parameter you will get the same result.

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

## OUTPUTS

### System.String

## NOTES

This command should have an alias of cal. This function was originally inspired from work by Lee Holmes at http://www.leeholmes.com/blog/2008/12/03/showing-calendars-in-your-oof-messages/.

Learn more about PowerShell: https://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Get-Date](Get-Date.md)

[Set-PSCalendarConfiguration](Set-PSCalendarConfiguration.md)

[Show-PSCalendar](Show-PSCalendar.md)

[Show-GuiCalendar](Show-GuiCalendar.md)

[Get-NCalendar](Get-NCalendar.md)
