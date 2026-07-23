$tools = @("git", "docker", "kind", "kubectl", "terraform", "aws")

foreach ($tool in $tools) {
    $cmd = Get-Command $tool -ErrorAction SilentlyContinue
    if ($cmd) {
        Write-Host "[OK]      $tool -> $($cmd.Source)"
    }
    else {
        Write-Host "[MISSING] $tool"
    }
}

Write-Host ""
Write-Host "Install tools as each session needs them; see WSL_SETUP.md or WSL_SETUP.vi.md."
