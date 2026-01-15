# Kitchen Layout Documentation

This repository documents the complete kitchen design, organized by construction sections.

## Structure

- **sections/** - Kitchen sections in assembly order
  - 01-tall-cabinetry-wall.md - Independent tall cabinetry wall
  - 02-continuous-base-cabinetry.md - Base cabinetry spanning two walls
  - 03-island.md - Kitchen island
- **specifications/** - Consolidated specifications
- **images/** - All renders, photos, and diagrams
- **build/** - PDF generation scripts

## Building the PDF

```powershell
.\build\build-pdf.ps1
```

## Assembly Sequence

1. Tall Cabinetry Wall (independent)
2. Continuous Base Cabinetry (two walls)
3. Island

Each section is self-contained and includes all subsections, materials, electrical, and plumbing requirements.
