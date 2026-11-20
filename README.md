# Control de inventario de una tienda

| Datos del proyecto | Detalle |
| --- | --- |
| Institución | Universidad Espíritu Santo, Facultad de Ingeniería |
| Asignatura | UCOM250 – Organización y Arquitectura de Computadores |
| Docente | Allan Roberto Avendano Sudario |
| Grupo | 1 |
| Integrantes | Allan Becerra, Mateo Chavez y Jeremy Llerena |
| Fecha | 20 de noviembre de 2026 |

## Escenario

Una tienda de productos tecnológicos inicia la jornada con 12 unidades en `inventario` y 25 en `registro`. El programa en ensamblador MIPS lee ambas cantidades y utiliza registros temporales para calcular sumas y diferencias. Durante el procesamiento, sobrescribe `$t0` con 6 y actualiza `$t4` de 36 a 18.

## Resultado esperado

El programa suma 36 (`$t5`) y 12 (`$t6`), con lo que obtiene 48 en `$t8`. El segundo dato, 25, queda en `$t7` y no interviene en esta suma. Como 48 es distinto de cero, el programa guarda **101** en la posición de memoria `estado` para indicar que el inventario se procesó correctamente. Si el valor calculado fuera cero, guardaría **0** en esa misma posición.

## Archivos del proyecto

- [Informe en PDF](Control_de_inventario_en_MIPS_Grupo_1.pdf)
- [Informe editable en Word](Control_de_inventario_en_MIPS_Grupo_1.docx)
- [Código base MIPS comentado](c_digo_base_comentado.md)

## Referencias utilizadas

- Patterson, D. A., & Hennessy, J. L. (2020). *Computer organization and design MIPS edition: The hardware/software interface* (6.ª ed.). Morgan Kaufmann.
- Sanchez, C. (2020, 24 de enero). *Citas APA*. [Normas APA](https://normas-apa.org/citas/)
- UNSW CSE. (s. f.). *Mipsy Web* [Simulador]. [Universidad de Nueva Gales del Sur](https://cgi.cse.unsw.edu.au/~cs1521/mipsy/)
