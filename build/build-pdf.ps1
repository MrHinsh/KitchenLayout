# Kitchen Layout PDF Build Script
# Requires: Pandoc and a PDF engine
# Install one of these PDF engines:
#   - MiKTeX (Windows): https://miktex.org/download
#   - TeX Live (Windows/Linux/Mac): https://www.tug.org/texlive/
#   - Tectonic (faster alternative): https://tectonic-typesetting.github.io/

$ErrorActionPreference = "Stop"

# Navigate to repository root
Set-Location $PSScriptRoot\..

# Create output directory if it doesn't exist
$outputDir = "output"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
    Write-Host "Created output directory: $outputDir" -ForegroundColor Cyan
}

# Check if pandoc is installed
if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "Pandoc is not installed. Install from: https://pandoc.org/installing.html"
    exit 1
}

Write-Host "Building Kitchen Layout Documents (English & Spanish)..." -ForegroundColor Cyan
Write-Host ""

# Build English document
Write-Host "Building English PDF..." -ForegroundColor Yellow
$outputFileEN = "$outputDir/kitchen-layout-en.pdf"

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
    --pdf-engine=xelatex `
    --toc `
    --toc-depth=3 `
    -V geometry:margin=1in `
    -V linkcolor:blue `
    2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ English PDF generated successfully: $outputFileEN" -ForegroundColor Green
}
else {
    Write-Error "Failed to generate English PDF. Make sure you have a PDF engine installed (MiKTeX, TeX Live, or Tectonic). Check pandoc output above."
    exit 1
}

Write-Host ""

# Build Spanish document
Write-Host "Building Spanish PDF..." -ForegroundColor Yellow
$outputFileES = "$outputDir/kitchen-layout-es.pdf"

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
    --pdf-engine=xelatex `
    --toc `
    --toc-depth=3 `
    -V geometry:margin=1in `
    -V linkcolor:blue `
    2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Spanish PDF generated successfully: $outputFileES" -ForegroundColor Green
}
else {
    Write-Error "Failed to generate Spanish PDF. Make sure you have a PDF engine installed (MiKTeX, TeX Live, or Tectonic). Check pandoc output above."
    exit 1
}

Write-Host ""
Write-Host "✓ All PDFs generated successfully!" -ForegroundColor Green
Write-Host "  - $outputFileEN" -ForegroundColor Cyan
Write-Host "  - $outputFileES" -ForegroundColor Cyan
Write-Host ""

# Try to open the English PDF, but don't fail if it errors
try {
    Write-Host "Opening English PDF..." -ForegroundColor Cyan
    Start-Process $outputFileEN -ErrorAction Stop
}
catch {
    Write-Host "Note: Could not automatically open PDF. You can manually open: $outputFileEN" -ForegroundColor Yellow
}
