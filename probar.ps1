# Comprueba el paquete: cada elemento tiene su archivo con el formato y el id, los efectos solo usan rodaje.reframe360 y los
# preajustes son equirectangulares 2:1.
$ErrorActionPreference = 'Stop'
$raiz = $PSScriptRoot
$manifiesto = [System.IO.File]::ReadAllText((Join-Path $raiz 'paquete.json')) | ConvertFrom-Json
$fallos = 0
function Falla($texto) { Write-Host "  $texto" -ForegroundColor Red; $script:fallos++ }
foreach ($e in $manifiesto.items) {
    $ruta = Join-Path $raiz $e.file
    if (-not (Test-Path -LiteralPath $ruta)) { Falla "$($e.id): falta $($e.file)"; continue }
    $p = [System.IO.File]::ReadAllText($ruta) | ConvertFrom-Json
    if ($p.id -ne $e.id -or $p.version -ne 1 -or -not $p.name) { Falla "$($e.id): id, versión o nombre" }
    switch ($e.kind) {
        'effect' {
            if ($p.format -ne 'rodaje.effect') { Falla "$($e.id): formato $($p.format)" }
            foreach ($ef in $p.effects) { if ($ef.type -ne 'rodaje.reframe360') { Falla "$($e.id): efecto $($ef.type)" } }
            foreach ($c in $p.curves) { if ($c.effect -ne 'rodaje.reframe360') { Falla "$($e.id): curva de $($c.effect)" } }
        }
        'export-preset' {
            if ($p.format -ne 'rodaje.exportpreset') { Falla "$($e.id): formato $($p.format)" }
            if ($p.video.projection -ne 'equirectangular' -or $p.video.width -ne 2 * $p.video.height -or $p.container -ne 'mp4') { Falla "$($e.id): no es 360 2:1 en MP4" }
        }
        default { Falla "$($e.id): tipo $($e.kind)" }
    }
}
if ($fallos -gt 0) { Write-Host "  $fallos fallos" -ForegroundColor Red; exit 1 }
Write-Host "  $($manifiesto.items.Count) elementos: todo bien." -ForegroundColor Green
exit 0
