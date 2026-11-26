# Control de inventario de una tienda

| Datos del proyecto | Detalle |
| --- | --- |
| Institución | Universidad Espíritu Santo, Facultad de Ingeniería |
| Asignatura | UCOM250 – Organización y Arquitectura de Computadores |
| Docente | Allan Roberto Avendano Sudario |
| Grupo | 1 |
| Integrantes | Allan Becerra, Mateo Chavez y Jeremy Llerena |
| Fecha | 26 de noviembre de 2026 |

## Escenario

Una tienda de productos tecnológicos inicia la jornada con 12 unidades en `inventario` y 25 en `registro`. El programa en ensamblador MIPS lee ambas cantidades y utiliza registros temporales para calcular sumas y diferencias. Durante el procesamiento, sobrescribe `$t0` con 6 y actualiza `$t4` de 36 a 18.

## Resultado esperado

El programa suma 36 (`$t5`) y 12 (`$t6`), con lo que obtiene 48 en `$t8`. El segundo dato, 25, queda en `$t7` y no interviene en esta suma. Como 48 es distinto de cero, el programa guarda **101** en la posición de memoria `estado` para indicar que el inventario se procesó correctamente. Si el valor calculado fuera cero, guardaría **0** en esa misma posición.

## Avance 2: formatos de instrucción y datapath

El informe incluye ahora el análisis de las instrucciones del programa:

- **Clasificación R / I / J** de todas las instrucciones del código (Tabla 3). Las de formato R hacen los cálculos (`add`, `sub`, `syscall`), las de formato I acceden a memoria, cargan constantes y toman la decisión (`lw`, `sw`, `addi`, `beq`) y la de formato J salta a `FIN` (`j`).
- **Campos y codificación** de las instrucciones seleccionadas, con su operación y su efecto en registros, memoria y PC (Tablas 4 a 7):

| Formato | Instrucción | Codificación |
| --- | --- | --- |
| R | `add $t1, $t0, $t0` | `0x01084820` |
| R | `sub $t4, $t1, $t0` | `0x01286022` |
| I | `lw $t0, 0($s0)` | `0x8E080000` |
| I | `addi $t0, $zero, 6` | `0x20080006` |
| I | `sw $t9, 0($s2)` | `0xAE590000` |
| I | `beq $t8, $zero, CERO` | `0x13000003` |
| J | `j FIN` | `0x08100017` |

- **Datapath:** cómo intervienen el PC, la memoria de instrucciones, el banco de registros, la extensión de signo, la ALU, la memoria de datos, los multiplexores y la unidad de control, con las señales de control de cada instrucción (Tabla 8).
- **Dependencias en un pipeline de 5 etapas:** RAW, WAR, WAW y de control presentes en el código (Tabla 9).

## Cómo reproducir

1. Abrir [Mipsy Web](https://cgi.cse.unsw.edu.au/~cs1521/mipsy/) (o MARS).
2. Cargar [`programa_inventario.s`](programa_inventario.s) y ejecutarlo completo.
3. Comprobar los resultados: `$t8 = 48`, `$t4 = 18`, `$t7 = 25` y la palabra `estado` = **101**.
4. Para ver las codificaciones de las Tablas 4 a 6, usar la vista de código ensamblado de MARS. El segmento `.text` empieza en `0x00400000`, así que `j FIN` apunta a `0x0040005C`.

## Archivos del proyecto

- [Informe en PDF](Control_de_inventario_en_MIPS_Grupo_1.pdf)
- [Informe editable en Word](Control_de_inventario_en_MIPS_Grupo_1.docx)
- [Código base MIPS comentado](c_digo_base_comentado.md)
- [Programa listo para ensamblar (.s)](programa_inventario.s)

## Referencias utilizadas

- Patterson, D. A., & Hennessy, J. L. (2020). *Computer organization and design MIPS edition: The hardware/software interface* (6.ª ed.). Morgan Kaufmann.
- Sanchez, C. (2020, 24 de enero). *Citas APA*. [Normas APA](https://normas-apa.org/citas/)
- UNSW CSE. (s. f.). *Mipsy Web* [Simulador]. [Universidad de Nueva Gales del Sur](https://cgi.cse.unsw.edu.au/~cs1521/mipsy/)
