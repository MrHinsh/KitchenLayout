# Documentación de Diseño de Cocina

Este repositorio documenta el diseño completo de la cocina, organizado por secciones de construcción.
**Nota:** Todas las imágenes renderizadas en esta documentación son generadas por IA solo con fines indicativos y no representan medidas exactas, materiales o apariencia final. Consulte las especificaciones y dimensiones en el texto para información precisa.
## Estructura

- **sections/** - Secciones de cocina en orden de montaje
  - 01-tall-cabinetry-wall.es.md - Muro independiente de gabinetes altos
  - 02-continuous-base-cabinetry.es.md - Gabinetes base que abarcan dos muros
  - 03-island.es.md - Isla de cocina
- **specifications/** - Especificaciones consolidadas
- **images/** - Todos los renders, fotos y diagramas
- **build/** - Scripts de generación de PDF

## Generar el PDF

```powershell
.\build\build-pdf.ps1
```

## Secuencia de Montaje

1. Muro de Gabinetes Altos (independiente)
2. Gabinetes Base Continuos (dos muros)
3. Isla

Cada sección es independiente e incluye todas las subsecciones, materiales, requisitos eléctricos y de plomería.
