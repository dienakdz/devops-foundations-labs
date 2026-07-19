$tools = @("git", "docker", "kubectl", "terraform", "aws")

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
Write-Host "Neu thieu tool, cai theo thu tu: Git -> Docker Desktop -> kubectl -> Terraform -> AWS CLI."

