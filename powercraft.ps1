Write-Host Launcher output log
Add-Type -AssemblyName System.Windows.Forms
$menuform = New-Object System.Windows.Forms.Form -Property @{
    Text = "PowerCraft"
    FormBorderStyle = 0
    Size = New-Object System.Drawing.Size -ArgumentList (640, 480)
}
$menusingleplayer = New-Object System.Windows.Forms.Button -Property @{
    Text = "Singleplayer"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
}
$menucreateserver = New-Object System.Windows.Forms.Button -Property @{
    Text = "Connect to server"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
    Top = 120
}
$menuconnectserver = New-Object System.Windows.Forms.Button -Property @{
    Text = "Create server"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
    Top = 240
}
$menuplayback = New-Object System.Windows.Forms.Button -Property @{
    Text = "Back"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
    Top = 360
}
$menuplay = New-Object System.Windows.Forms.Button -Property @{
    Text = "Play"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
}
$menuexit = New-Object System.Windows.Forms.Button -Property @{
    Text = "Exit"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
    Top = 360
}
$menuplay.add_Click({
    $menuform.Controls.Clear()
    $menuform.Controls.Add($menuplayback)
    $menuform.Controls.Add($menusingleplayer)
    $menuform.Controls.Add($menucreateserver)
    $menuform.Controls.Add($menuconnectserver)
})
$menuexit.add_Click({
    $menuform.Close()
})
$menuplayback.add_Click({
    $menuform.Controls.Clear()
    $menuform.Controls.Add($menuplay)
    $menuform.Controls.Add($menusettings)
    $menuform.Controls.Add($menuupdate)
    $menuform.Controls.Add($menuexit)
})
$menusingleplayer.add_Click({
    $menuform.Hide()
    $gameprocess = New-Object System.Diagnostics.Process -Property @{
        StartInfo = New-Object System.Diagnostics.ProcessStartInfo -Property @{
            FileName = "powershell"
            Arguments = $PSScriptRoot + "\powercraft_singleplayer.ps1"
        }
    }
    $gameprocess.Start()
    $gameprocess.WaitForExit()
    $menuform.Show()
})
$menuupdate = New-Object System.Windows.Forms.Button -Property @{
    Text = "Check for updates"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
    Top = 240
}
$menuupdate.add_Click({
    $menuform.Close()
    $updaterprocess = New-Object System.Diagnostics.Process -Property @{
        StartInfo = New-Object System.Diagnostics.ProcessStartInfo -Property @{
            FileName = "powershell"
            Arguments = $PSScriptRoot + "\powercraft_updater.ps1"
        }
    }
    $updaterprocess.Start()
    exit
})
$menusettings = New-Object System.Windows.Forms.Button -Property @{
    Text = "Settings"
    Size = New-Object System.Drawing.Size -ArgumentList (640, 120)
    Top = 120
}
$menusettings.add_Click({
    [System.Windows.Forms.MessageBox]::Show("wip")
})
$menuform.Controls.Add($menuplay)
$menuform.Controls.Add($menusettings)
$menuform.Controls.Add($menuupdate)
$menuform.Controls.Add($menuexit)
$menuform.ShowDialog() | Out-Null