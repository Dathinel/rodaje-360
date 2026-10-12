<p align="center">
  <a href="https://github.com/Dathinel/rodaje"><img src="https://raw.githubusercontent.com/Dathinel/rodaje/main/assets/marca/rodaje.svg" alt="Logotipo de Rodaje" width="104"></a>
</p>

<h1 align="center">rodaje-360</h1>

<p align="center">
  Complemento opcional para <a href="https://github.com/Dathinel/rodaje">Rodaje</a>: activa el video 360 (reencuadre del equirectangular a una vista plana y exportación 360 con metadatos esféricos).
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/licencia-CC0_1.0-E8833A?style=flat-square&labelColor=1D1D1D" alt="Licencia CC0 1.0"></a>
  <a href="https://github.com/Dathinel/rodaje-360/releases/latest"><img src="https://img.shields.io/github/v/release/Dathinel/rodaje-360?style=flat-square&labelColor=1D1D1D&color=E8833A&label=versi%C3%B3n" alt="Última versión"></a>
  <img src="https://img.shields.io/badge/formato-.paquete-E8833A?style=flat-square&labelColor=1D1D1D" alt="Formato .paquete">
  <a href="https://github.com/Dathinel/rodaje"><img src="https://img.shields.io/badge/para-Rodaje-E8833A?style=flat-square&labelColor=1D1D1D" alt="Para Rodaje"></a>
</p>

El reencuadre lo hace el motor de Rodaje en la GPU (`rodaje.reframe360`); este paquete no trae código, solo datos. Instalado, Rodaje ofrece el efecto «Reencuadre 360» en la biblioteca y en el inspector, con guiñada, cabeceo, alabeo y campo de visión animables con keyframes, en proyección normal o de pequeño planeta. Sin el paquete, un proyecto que ya lo use se sigue viendo igual.

| Elemento | Qué hace |
|---|---|
| Mirar al frente, Gran angular | Vista plana de 90° o 120° hacia el centro del video |
| Pequeño planeta, Túnel | Proyección estereográfica hacia el suelo o hacia el cielo |
| Paneo de 360°, Paneo suave a la derecha, Levantar la mirada, Acercamiento 360, Planeta que gira | Movimientos de cámara con keyframes, estirados a la duración del clip |
| Video 360 4K (H.265 y H.264), Video 360 5,7K (H.265) | Preajustes de exportación equirectangulares (2:1) en MP4 con los metadatos esféricos (`st3d` y `sv3d`, Spherical Video V2) para YouTube y visores 360 |

Para editar en 360 y exportar en 360, crea la secuencia en 2:1 (por ejemplo 3840×1920) y usa un preajuste «Video 360». Para sacar un video plano de una toma 360, pon la secuencia en 16:9 o 9:16 y aplica uno de los efectos: la vista llena el cuadro.

## Instalar en Rodaje

En Rodaje, Complementos → Instalar lo baja, comprueba su firma y lo instala. A mano: descarga `rodaje-360-<versión>.paquete` de las [releases](https://github.com/Dathinel/rodaje-360/releases) y usa «Instalar desde archivo…» en Complementos.

## Construir el paquete

```
powershell -NoProfile -ExecutionPolicy Bypass -File probar.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File empaquetar.ps1
```

Solo hace falta Windows PowerShell 5.1. `probar.ps1` comprueba que cada elemento del manifiesto exista con su formato y su id, que los efectos solo usen `rodaje.reframe360` y que los preajustes sean equirectangulares 2:1. `empaquetar.ps1` deja `dist\rodaje-360-<versión>.paquete` con orden y fecha fijos.

## Licencia

CC0 1.0 (dominio público), ver `LICENSE`. YouTube es marca de su dueño y solo se nombra para decir con qué es compatible. El logotipo de Rodaje es marca de su autor y no forma parte de este contenido ([TRADEMARK.md](https://github.com/Dathinel/rodaje/blob/main/TRADEMARK.md)).
