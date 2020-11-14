# Import timesheets
$times = import-csv .\rarespawns-na.csv
$bagtimes = import-csv .\rarespawns-na-bag.csv
$mounttimes = import-csv .\rarespawns-na-mount.csv
$cettimes = import-csv .\rarespawns-eu.csv
$cetbagtimes = import-csv .\rarespawns-eu-bag.csv
$cetmounttimes = import-csv .\rarespawns-eu-mount.csv
$asiatimes = import-csv .\rarespawns-asia.csv
$asiabagtimes = import-csv .\rarespawns-asia-bag.csv
$asiamounttimes = import-csv .\rarespawns-asia-mount.csv

### NA - EST ###
$est = (get-date).AddHours(2)
$next = $est.AddMinutes(-$est.Minute % 20).AddMinutes(20).AddSeconds(-$est.Second)
$nextbm = $est.AddMinutes(-$est.Minute % 20).AddSeconds(-$est.Second)
$day = $next.DayOfWeek
$nextDay = $next.AddDays(1).DayOfWeek
$nextdate = $est.AddDays(1)
$nextString = $next.ToString("T")
$diff = ($next - $est).Minutes

$startTime = $next.ToString("HHmm")
$startDate = ($next.Year).ToString() + "-" + ($next.month).ToString() + "-" + ($next.Day).ToString()
$startDatetmrw = ($nextdate.Year).ToString() + "-" + ($nextdate.month).ToString() + "-" + ($nextdate.Day).ToString()

### EU - CET ###
$cet = (get-date).AddHours(8)
$cetnext = $cet.AddMinutes(-$cet.Minute % 20).AddMinutes(20).AddSeconds(-$cet.Second)
$cetnextbm = $cet.AddMinutes(-$cet.Minute % 20).AddSeconds(-$cet.Second)
$cetday = $cetnext.DayOfWeek
$cetnextDay = $cetnext.AddDays(1).DayOfWeek
$cetnextdate = $cet.AddDays(1)
$cetnextString = $cetnext.ToString("T")
$cetdiff = ($cetnext - $cet).Minutes

$cetstartTime = $cetnext.ToString("HHmm")
$cetstartDate = ($cetnext.Year).ToString() + "-" + ($cetnext.month).ToString() + "-" + ($cetnext.Day).ToString()
$cetstartDatetmrw = ($cetnextdate.Year).ToString() + "-" + ($cetnextdate.month).ToString() + "-" + ($cetnextdate.Day).ToString()

### ASIA - CST ###
$asia = (get-date).AddHours(15)
$asianext = $asia.AddMinutes(-$asia.Minute % 20).AddMinutes(20).AddSeconds(-$asia.Second)
$asianextbm = $asia.AddMinutes(-$asia.Minute % 20).AddSeconds(-$asia.Second)
$asiaday = $asianext.DayOfWeek
$asianextDay = $asianext.AddDays(1).DayOfWeek
$asianextdate = $asia.AddDays(1)
$asianextString = $asianext.ToString("T")
$asiadiff = ($asianext - $asia).Minutes

$asiastartTime = $asianext.ToString("HHmm")
$asiastartDate = ($asianext.Year).ToString() + "-" + ($asianext.month).ToString() + "-" + ($asianext.Day).ToString()
$asiastartDatetmrw = ($asianextdate.Year).ToString() + "-" + ($asianextdate.month).ToString() + "-" + ($asianextdate.Day).ToString()

##############
### NA bag ###
foreach ($time in $bagtimes.$day) {
    
    try {
        $24h = "{0:HH:mm}" -f [datetime]"$time"
        $bagdate = get-date "$startDate $24h"
        if ($nextbm -le $bagdate){
            # use this one
            $nextBagDate = $bagdate
            $nextBagTime = $bagdate.ToString("T")
            $nextBagTime24h = $24h -replace ':',''
            $nextBagStartDate = ($nextBagDate.Year).ToString() + "-" + ($nextBagDate.month).ToString() + "-" + ($nextBagDate.Day).ToString()
            $nextBagDiffData = ($nextBagDate - $est)
            if ($nextBagDiffData.Hours -le 0) {
                $nextBagDiff = "$($nextBagDiffData.Minutes) minutes"
            }
            else {
                $nextBagDiff = "$($nextBagDiffData.Hours)h $($nextBagDiffData.Minutes)m"
            }
            break
        }
        else {
            # no bueno, loop again
        }
    }
    Catch {
        # continue with loop
    }
}

if (!($nextBagDate)) {

    foreach ($time in $bagtimes.$nextDay) {
    
        try {
            $24h = "{0:HH:mm}" -f [datetime]"$time"
            $bagdate = get-date "$startDatetmrw $24h"
            if ($nextbm -le $bagdate){
                # use this one
                $nextBagDate = $bagdate
                $nextBagTime = $bagdate.ToString("T")
                $nextBagTime24h = $24h -replace ':',''
                $nextBagStartDate = ($nextBagDate.Year).ToString() + "-" + ($nextBagDate.month).ToString() + "-" + ($nextBagDate.Day).ToString()
                $nextBagDiffData = ($nextBagDate - $est)
                if ($nextBagDiffData.Hours -le 0) {
                    $nextBagDiff = "$($nextBagDiffData.Minutes) minutes"
                }
                else {
                    $nextBagDiff = "$($nextBagDiffData.Hours)h $($nextBagDiffData.Minutes)m"
                }
                break
            }
            else {
                # no bueno, loop again
            }
        }
        Catch {
            # continue with loop
        }

    }
}

################
### NA MOUNT ###
foreach ($time in $mounttimes.$day) {
    
    try {
        $24h = "{0:HH:mm}" -f [datetime]"$time"
        $mountdate = get-date "$startDate $24h"
        if ($nextbm -le $mountdate){
            # use this one
            $nextMountDate = $mountdate
            $nextMountTime = $mountdate.ToString("T")
            $nextMountTime24h = $24h -replace ':',''
            $nextMountStartDate = ($nextMountDate.Year).ToString() + "-" + ($nextMountDate.month).ToString() + "-" + ($nextMountDate.Day).ToString()
            $nextMountDiffData = ($nextMountDate - $est)
            if ($nextMountDiffData.Hours -le 0) {
                $nextMountDiff = "$($nextMountDiffData.Minutes) minutes"
            }
            else {
                $nextMountDiff = "$($nextMountDiffData.Hours)h $($nextMountDiffData.Minutes)m"
            }
            break
        }
        else {
            # no bueno, loop again
        }
    }
    Catch {
        # continue with loop
    }
}

if (!($nextMountDate)) {

    foreach ($time in $mounttimes.$nextDay) {
    
        try {
            $24h = "{0:HH:mm}" -f [datetime]"$time"
            $mountdate = get-date "$startDatetmrw $24h"
            if ($nextbm -le $mountdate){
                # use this one
                $nextMountDate = $mountdate
                $nextMountTime = $mountdate.ToString("T")
                $nextMountTime24h = $24h -replace ':',''
                $nextMountStartDate = ($nextMountDate.Year).ToString() + "-" + ($nextMountDate.month).ToString() + "-" + ($nextMountDate.Day).ToString()
                $nextMountDiffData = ($nextMountDate - $est)
                if ($nextMountDiffData.Hours -le 0) {
                    $nextMountDiff = "$($nextMountDiffData.Minutes) minutes"
                }
                else {
                    $nextMountDiff = "$($nextMountDiffData.Hours)h $($nextMountDiffData.Minutes)m"
                }
                break
             }
            else {
                # no bueno, loop again
            }
        }
        Catch {
            # continue with loop
        }
    }
}


#########################
#      EU
#########################

##############
### EU bag ###
foreach ($time in $cetbagtimes.$cetday) {
    
    try {
        $24h = "{0:HH:mm}" -f [datetime]"$time"
        $cetbagdate = get-date "$cetstartDate $24h"
        if ($cetnextbm -le $cetbagdate){
            # use this one
            $cetnextBagDate = $cetbagdate
            $cetnextBagTime = $cetbagdate.ToString("T")
            $cetnextBagTime24h = $24h -replace ':',''
            $cetnextBagStartDate = ($cetnextBagDate.Year).ToString() + "-" + ($cetnextBagDate.month).ToString() + "-" + ($cetnextBagDate.Day).ToString()
            $cetnextBagDiffData = ($cetnextBagDate - $cet)
            if ($cetnextBagDiffData.Hours -le 0) {
                $cetnextBagDiff = "$($cetnextBagDiffData.Minutes) minutes"
            }
            else {
                $cetnextBagDiff = "$($cetnextBagDiffData.Hours)h $($cetnextBagDiffData.Minutes)m"
            }
            break
        }
        else {
            # no bueno, loop again
        }
    }
    Catch {
        # continue with loop
    }
}

if (!($cetnextBagDate)) {

    foreach ($time in $cetbagtimes.$cetnextDay) {
    
        try {
            $24h = "{0:HH:mm}" -f [datetime]"$time"
            $cetbagdate = get-date "$cetstartDatetmrw $24h"
            if ($cetnextbm -le $cetbagdate){
                # use this one
                $cetnextBagDate = $cetbagdate
                $cetnextBagTime = $cetbagdate.ToString("T")
                $cetnextBagTime24h = $24h -replace ':',''
                $cetnextBagStartDate = ($cetnextBagDate.Year).ToString() + "-" + ($cetnextBagDate.month).ToString() + "-" + ($cetnextBagDate.Day).ToString()
                $cetnextBagDiffData = ($cetnextBagDate - $cet)
                if ($cetnextBagDiffData.Hours -le 0) {
                    $cetnextBagDiff = "$($cetnextBagDiffData.Minutes) minutes"
                }
                else {
                    $cetnextBagDiff = "$($cetnextBagDiffData.Hours)h $($cetnextBagDiffData.Minutes)m"
                }
                break
            }
            else {
                 # no bueno, loop again
            }
        }
        Catch {
            # continue with loop
        }

    }
}

################
### EU MOUNT ###
foreach ($time in $cetmounttimes.$cetday) {
    
    try {
        $24h = "{0:HH:mm}" -f [datetime]"$time"
        $cetmountdate = get-date "$cetstartDate $24h"
        if ($cetnextbm -le $cetmountdate){
            # use this one
            $cetnextMountDate = $cetmountdate
            $cetnextMountTime = $cetmountdate.ToString("T")
            $cetnextMountTime24h = $24h -replace ':',''
            $cetnextMountStartDate = ($cetnextMountDate.Year).ToString() + "-" + ($cetnextMountDate.month).ToString() + "-" + ($cetnextMountDate.Day).ToString()
            $cetnextMountDiffData = ($cetnextMountDate - $cet)
            if ($cetnextMountDiffData.Hours -le 0) {
                $cetnextMountDiff = "$($cetnextMountDiffData.Minutes) minutes"
            }
            else {
                $cetnextMountDiff = "$($cetnextMountDiffData.Hours)h $($cetnextMountDiffData.Minutes)m"
            }
            break
        }
        else {
            # no bueno, loop again
        }
    }
    Catch {
        # continue with loop
    }
}

if (!($cetnextMountDate)) {

    foreach ($time in $cetmounttimes.$cetnextDay) {
    
        try {
            $24h = "{0:HH:mm}" -f [datetime]"$time"
            $cetmountdate = get-date "$cetstartDatetmrw $24h"
            if ($cetnextbm -le $cetmountdate){
                # use this one
                $cetnextMountDate = $cetmountdate
                $cetnextMountTime = $cetmountdate.ToString("T")
                $cetnextMountTime24h = $24h -replace ':',''
                $cetnextMountStartDate = ($cetnextMountDate.Year).ToString() + "-" + ($cetnextMountDate.month).ToString() + "-" + ($cetnextMountDate.Day).ToString()
                $cetnextMountDiffData = ($cetnextMountDate - $cet)
                if ($cetnextMountDiffData.Hours -le 0) {
                    $cetnextMountDiff = "$($cetnextMountDiffData.Minutes) minutes"
                }
                else {
                    $cetnextMountDiff = "$($cetnextMountDiffData.Hours)h $($cetnextMountDiffData.Minutes)m"
                }
                break
             }
            else {
                # no bueno, loop again
            }
        }
        Catch {
            # continue with loop
        }
    }
}


#########################
#      ASIA
#########################

##############
### ASIA bag ###
foreach ($time in $asiabagtimes.$asiaday) {
    
    try {
        $24h = "{0:HH:mm}" -f [datetime]"$time"
        $asiabagdate = get-date "$asiastartDate $24h"
        if ($asianextbm -le $asiabagdate){
            # use this one
            $asianextBagDate = $asiabagdate
            $asianextBagTime = $asiabagdate.ToString("T")
            $asianextBagTime24h = $24h -replace ':',''
            $asianextBagStartDate = ($asianextBagDate.Year).ToString() + "-" + ($asianextBagDate.month).ToString() + "-" + ($asianextBagDate.Day).ToString()
            $asianextBagDiffData = ($asianextBagDate - $asia)
            if ($asianextBagDiffData.Hours -le 0) {
                $asianextBagDiff = "$($asianextBagDiffData.Minutes) minutes"
            }
            else {
                $asianextBagDiff = "$($asianextBagDiffData.Hours)h $($asianextBagDiffData.Minutes)m"
            }
            break
        }
        else {
            # no bueno, loop again
        }
    }
    Catch {
        # continue with loop
    }
}

if (!($asianextBagDate)) {

    foreach ($time in $asiabagtimes.$asianextDay) {
    
        try {
            $24h = "{0:HH:mm}" -f [datetime]"$time"
            $asiabagdate = get-date "$asiastartDatetmrw $24h"
            if ($asianextbm -le $asiabagdate){
                # use this one
                $asianextBagDate = $asiabagdate
                $asianextBagTime = $asiabagdate.ToString("T")
                $asianextBagTime24h = $24h -replace ':',''
                $asianextBagStartDate = ($asianextBagDate.Year).ToString() + "-" + ($asianextBagDate.month).ToString() + "-" + ($asianextBagDate.Day).ToString()
                $asianextBagDiffData = ($asianextBagDate - $asia)
                if ($asianextBagDiffData.Hours -le 0) {
                    $asianextBagDiff = "$($asianextBagDiffData.Minutes) minutes"
                }
                else {
                    $asianextBagDiff = "$($asianextBagDiffData.Hours)h $($asianextBagDiffData.Minutes)m"
                }
                break
            }
            else {
                 # no bueno, loop again
            }
        }
        Catch {
            # continue with loop
        }

    }
}

################
### ASIA MOUNT ###
foreach ($time in $asiamounttimes.$asiaday) {
    
    try {
        $24h = "{0:HH:mm}" -f [datetime]"$time"
        $asiamountdate = get-date "$asiastartDate $24h"
        if ($asianextbm -le $asiamountdate){
            # use this one
            $asianextMountDate = $asiamountdate
            $asianextMountTime = $asiamountdate.ToString("T")
            $asianextMountTime24h = $24h -replace ':',''
            $asianextMountStartDate = ($asianextMountDate.Year).ToString() + "-" + ($asianextMountDate.month).ToString() + "-" + ($asianextMountDate.Day).ToString()
            $asianextMountDiffData = ($asianextMountDate - $asia)
            if ($asianextMountDiffData.Hours -le 0) {
                $asianextMountDiff = "$($asianextMountDiffData.Minutes) minutes"
            }
            else {
                $asianextMountDiff = "$($asianextMountDiffData.Hours)h $($asianextMountDiffData.Minutes)m"
            }
            break
        }
        else {
            # no bueno, loop again
        }
    }
    Catch {
        # continue with loop
    }
}

if (!($asianextMountDate)) {

    foreach ($time in $asiamounttimes.$asianextDay) {
    
        try {
            $24h = "{0:HH:mm}" -f [datetime]"$time"
            $asiamountdate = get-date "$asiastartDatetmrw $24h"
            if ($asianextbm -le $asiamountdate){
                # use this one
                $asianextMountDate = $asiamountdate
                $asianextMountTime = $asiamountdate.ToString("T")
                $asianextMountTime24h = $24h -replace ':',''
                $asianextMountStartDate = ($asianextMountDate.Year).ToString() + "-" + ($asianextMountDate.month).ToString() + "-" + ($asianextMountDate.Day).ToString()
                $asianextMountDiffData = ($asianextMountDate - $asia)
                if ($asianextMountDiffData.Hours -le 0) {
                    $asianextMountDiff = "$($asianextMountDiffData.Minutes) minutes"
                }
                else {
                    $asianextMountDiff = "$($asianextMountDiffData.Hours)h $($asianextMountDiffData.Minutes)m"
                }
                break
             }
            else {
                # no bueno, loop again
            }
        }
        Catch {
            # continue with loop
        }
    }
}

$currentRare = $times | ? {$_.$day -eq $nextString}
$cetcurrentRare = $cettimes | ? {$_.$cetday -eq $cetnextString}
$asiacurrentRare = $asiatimes | ? {$_.$asiaday -eq $asianextString}

$rareData = [psCustomObject]@{

    'way'  = $currentRare.way
    'boss' = $currentRare.Boss
    'time' = $currentRare.$day
    'diff' = $diff
    'bag'  = $nextBagTime
    'bagDiff' = $nextBagDiff
    'bagStartTime' = $nextBagTime24h
    'bagStartDate' = $nextBagStartDate
    'mount' = $nextMountTime
    'mountDiff' = $nextMountDiff
    'mountStartTime' = $nextMountTime24h
    'mountStartDate' = $nextMountStartDate
    'startDate' = $startDate
    'startTime' = $startTime
    'cetway'  = $cetcurrentRare.way
    'cetboss' = $cetcurrentRare.Boss
    'cettime' = $cetcurrentRare.$cetday
    'cetdiff' = $cetdiff
    'cetbag'  = $cetnextBagTime
    'cetbagDiff' = $cetnextBagDiff
    'cetbagStartTime' = $cetnextBagTime24h
    'cetbagStartDate' = $cetnextBagStartDate
    'cetmount'= $cetnextMountTime
    'cetmountDiff' = $cetnextMountDiff
    'cetmountStartTime' = $cetnextMountTime24h
    'cetmountStartDate' = $cetnextMountStartDate
    'cetstartDate' = $cetstartDate
    'cetstartTime' = $cetstartTime
    'asiaway'  = $asiacurrentRare.way
    'asiaboss' = $asiacurrentRare.Boss
    'asiatime' = $asiacurrentRare.$asiaday
    'asiadiff' = $asiadiff
    'asiabag'  = $asianextBagTime
    'asiabagDiff' = $asianextBagDiff
    'asiabagStartTime' = $asianextBagTime24h
    'asiabagStartDate' = $asianextBagStartDate
    'asiamount'= $asianextMountTime
    'asiamountDiff' = $asianextMountDiff
    'asiamountStartTime' = $asianextMountTime24h
    'asiamountStartDate' = $asianextMountStartDate
    'asiastartDate' = $asiastartDate
    'asiastartTime' = $asiastartTime
}
$rareData | ConvertTo-Json -Compress
