# Kitchen Layout PDF Build Script
# Requires: Pandoc with xelatex or other PDF engine

$ErrorActionPreference = "Stop"

# Navigate to repository root
Set-Location $PSScriptRoot\..

# Check if pandoc is installed
if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "Pandoc is not installed. Install from: https://pandoc.org/installing.html"
    exit 1
}

Write-Host "Building Kitchen Layout PDFs (English & Spanish)..." -ForegroundColor Cyan
Write-Host ""

# Build English PDF
Write-Host "Building English PDF..." -ForegroundColor Yellow
$outputFileEN = "kitchen-layout-en.pdf"

pandoc `
    --metadata title="Kitchen Layout Specification" `
    --metadata author="Martin Hinshelwood" `
    --metadata date="January 14, 2026" `
    sections/01-tall-cabinetry-wall.md `
    sections/02-continuous-base-cabinetry.md `
    sections/03-island.md `
    specifications/materials.md `
    specifications/electrical.md `
    specifications/plumbing.md `
    specifications/appliances-list.md `
    -o $outputFileEN `
    --toc `
    --toc-depth=3 `
    --pdf-engine=xelatex `
    --variable geometry:margin=1in `
    --variable fontsize=11pt `
    --variable mainfont="Calibri" `
    --variable monofont="Consolas" `
    --syntax-definition=tango `
    2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ English PDF generated successfully: $outputFileEN" -ForegroundColor Green
}
else {
    Write-Error "Failed to generate English PDF. Check pandoc output above."
    exit 1
}

Write-Host ""

# Build Spanish PDF
Write-Host "Building Spanish PDF..." -ForegroundColor Yellow
$outputFileES = "kitchen-layout-es.pdf"

pandoc `
    --metadata title="Especificación de Diseño de Cocina" `
    --metadata author="Martin Hinshelwood" `
    --metadata date="14 de enero de 2026" `
    sections/01-tall-cabinetry-wall.es.md `
    sections/02-continuous-base-cabinetry.es.md `
    sections/03-island.es.md `
    specifications/materials.es.md `
    specifications/electrical.es.md `
    specifications/plumbing.es.md `
    specifications/appliances-list.es.md `
    -o $outputFileES `
    --toc `
    --toc-depth=3 `
    --pdf-engine=xelatex `
    --variable geometry:margin=1in `
    --variable fontsize=11pt `
    --variable mainfont="Calibri" `
    --variable monofont="Consolas" `
    --syntax-definition=tango `
    2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Spanish PDF generated successfully: $outputFileES" -ForegroundColor Green
}
else {
    Write-Error "Failed to generate Spanish PDF. Check pandoc output above."
    exit 1
}

Write-Host ""
Write-Host "✓ All PDFs generated successfully!" -ForegroundColor Green
Write-Host "  - $outputFileEN" -ForegroundColor Cyan
Write-Host "  - $outputFileES" -ForegroundColor Cyan
Write-Host ""
Write-Host "Opening English PDF..." -ForegroundColor Cyan
Start-Process $outputFileEN
