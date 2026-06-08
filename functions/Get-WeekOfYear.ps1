Function Get-WeekOfYear {
    param(
        [DateTime]
        $Date
    )
    $culture = [System.Globalization.CultureInfo]::CurrentCulture
    $calendar = $culture.Calendar
    $weekRule = $culture.DateTimeFormat.CalendarWeekRule
    $firstDayOfWeek = $culture.DateTimeFormat.FirstDayOfWeek
    $calendar.GetWeekOfYear($Date, $weekRule, $firstDayOfWeek)
}