function MainMenu($Message) {
    Clear-Host
    Write-Host "=== Rock-Paper-Scissors ==="
    Write-Host "Please choose an option below:"
    Write-Host "1) Singleplayer"
    Write-Host "2) Multiplayer"
    Write-Host "3) Settings"
    Write-Host "4) Quit"
    Write-Host "`n$Message"

    # Use the switch statement to choose an option
    switch (Read-Host) {
    1 {Singleplayer}
    2 {Multiplayer} 
    3 {Settings}
    4 {Clear-Host; Break}
    #4 {exit}
    default {MainMenu("Error: You did not choose a valid option")}
    }
}

function Settings($Message) {
    Clear-Host
    Write-Host "=== Settings ==="
    Write-Host "Please choose an option below:"
    Write-Host "1) Credits"
    Write-Host "2) Change Username"
    Write-Host "3) Score Reset"
    Write-Host "4) Main Menu"
    Write-Host "`n$Message"

    # Use the switch statement to choose an option
    switch (Read-Host) {
    1 {Settings("Credits: Robin Nagy - 2025")}
    2 {Username} 
    3 {ClearScore}
    4 {MainMenu}
    default {Settings("Error: You did not choose a valid option")}
    }
}

function Username{
    $global:Player1 = Read-Host "Player1 username"
    $global:Player2 = Read-Host "Player2 username"

    Write-Host "Usernames has been set successfully!"
    Start-Sleep -Seconds 1.5
    Settings
}

function ClearScore {
    # Null scores
    $global:playerScore = 0
    $global:botScore = 0
    $global:player1Score = 0
    $global:player2Score = 0

    # User feedback
    Write-Host "Score has been resetted succesfully." 
    Start-Sleep -Seconds 1
    Settings
}


function Singleplayer {

#Score System

if (-not $global:playerScore) { $global:playerScore = 0 }
if (-not $global:botScore) { $global:botScore = 0 }

Clear-Host
Write-Host "Welcome in Rock-Paper-Scissors Singeplayer mode!"
Write-Host ""

#PlayerChoice

do {
    Write-Host "Pleease choose from the following"
    Write-Host "1 - Rock"
    Write-Host "2 - Paper"
    Write-Host "3 - Scissors"
    Write-Host ""

    $playersChoice = Read-Host "@"
    Write-Host ""
   
        switch ($playersChoice) {
            "1" { Write-Host "You choose: Rock" }
            "2" { Write-Host "You choose: Paper" }
            "3" { Write-Host "You choose: Scissors" }
            default {Write-Host "Invalid option! Please try again." -ForegroundColor Red}
        }
} until ($playersChoice -in @("1", "2", "3"))


# Bot Choice

do {
        $Botoptions = @("1", "2", "3")
        $BotChoice = $Botoptions | Get-Random
        switch ($BotChoice) {
            "1" { Write-Host "Bot choose: Rock" }
            "2" { Write-Host "Bot choose: Paper" }
            "3" { Write-Host "Bot choose: Scissors" }
        }
} until ($BotChoice -in @("1", "2", "3"))
Write-Host ""

#Author: Nagy Robin
# Decision logic
 #"1 - Rock"
 #"2 - Paper"
 #"3 - Scissors"

if ($playerschoice -eq $BotChoice) {
    Write-Host "It's a draw!"
} elseif (
        ($playerschoice -eq "1" -and $BotChoice -eq "3") -or
        ($playerschoice -eq "2" -and $BotChoice -eq "1") -or
        ($playerschoice -eq "3" -and $BotChoice -eq "2")
) {
    Write-Host "You win!"
    $global:playerScore++
} else {
    Write-Host "Bot win!"
    $global:botScore++
}
Write-Host ""
Write-Host "Score:"
Write-Host "Player: $global:playerScore"
Write-Host "Bot: $global:botScore"

#Start-Sleep -Seconds 1
Write-Host "-----------------------------------------"


do {
    Write-Host "Want to play a new game? (Y/N)"
    Write-Host ""
    $continue = Read-Host "Please choose"
    switch ($continue) {
        Y {Singleplayer}
        N {MainMenu}
        Default {Write-Host "Invalid option! Please try again." -ForegroundColor Red}
    }
} until ($continue -in @("Y", "N"))


}

function Multiplayer {

    # Score System
    
    if (-not $global:player1Score) { $global:player1Score = 0 }
    if (-not $global:player2Score) { $global:player2Score = 0 }
    
    Clear-Host
    Write-Host "Welcome in Rock-Paper-Scissors Multiplayer mode!"
    Write-Host ""
    
    # Player1 Choice
    
    do {
        Write-Host "$global:Player1 choose from the following:"
        Write-Host "1 - Rock"
        Write-Host "2 - Paper"
        Write-Host "3 - Scissors"
        $player1Choice = Read-Host "@"
        Write-Host ""
       
            switch ($player1Choice) {
                "1" { Write-Host "$global:Player1 choose: Rock" }
                "2" { Write-Host "$global:Player1 choose: Paper" }
                "3" { Write-Host "$global:Player1 choose: Scissors" }
                default {Write-Host "Invalid option! Please try again." -ForegroundColor Red}
            }
    } until ($player1Choice -in @("1", "2", "3"))
    Write-Host ""
    
    
    # Player2 Choice
    
    do {
        Write-Host "$global:Player2 choose from the following:"
        Write-Host "1 - Rock"
        Write-Host "2 - Paper"
        Write-Host "3 - Scissors"
        $player2Choice = Read-Host "@"
        Write-Host ""
       
            switch ($player2Choice) {
                "1" { Write-Host "$global:Player2 choose: Rock" }
                "2" { Write-Host "$global:Player2 choose: Paper" }
                "3" { Write-Host "$global:Player2 choose: Scissors" }
                default {Write-Host "Invalid option! Please try again." -ForegroundColor Red}
            }
    } until ($player2Choice -in @("1", "2", "3"))
    Write-Host ""
    
#Author: Nagy Robin
# Decision logic
 #"1 - Rock"
 #"2 - Paper"
 #"3 - Scissors"
    
    if ($player1choice -eq $player2choice) {
        Write-Host "It's a draw!"
    } elseif (
            ($player1choice -eq "1" -and $player2choice -eq "3") -or
            ($player1choice -eq "2" -and $player2choice -eq "1") -or
            ($player1choice -eq "3" -and $player2choice -eq "2")
    ) {
        Write-Host "$global:Player1 win!"
        $global:player1Score++
    } else {
        Write-Host "$global:Player2 win!"
        $global:player2Score++
    }
    Write-Host ""
    Write-Host "Score:"
    Write-Host $global:Player1, ":" ,$global:player1Score
    Write-Host $global:Player2, ":" ,$global:player2Score
    
    #Start-Sleep -Seconds 1
    Write-Host "-----------------------------------------"
    
    do {
        Write-Host "Want to play a new game? (Y/N)"
        Write-Host ""
        $continue = Read-Host "Please choose"
        switch ($continue) {
            Y {Multiplayer}
            N {MainMenu}
            Default {Write-Host "Invalid option! Please try again." -ForegroundColor Red}
        }
    } until ($continue -in @("Y", "N"))
    
    }

MainMenu
