.data
inventario: .word 12        # Cantidad inicial del primer producto (12 unidades)
            .space 12       # Espacio reservado en memoria (12 bytes)
registro:   .word 25        # Cantidad inicial del segundo registro (25 unidades)
            .space 12       # Espacio reservado en memoria (12 bytes)
estado:     .word 0         # Espacio donde se guardará el estado final (101 o 0)

.text
.globl main

main:
    # 1. Cargar las direcciones de memoria de los datos
    la $s0, inventario      # Guarda en $s0 la dirección de 'inventario'
    la $s1, registro        # Guarda en $s1 la dirección de 'registro'
    la $s2, estado          # Guarda en $s2 la dirección de 'estado'

    # 2. Carga inicial y primeras operaciones aritméticas
    lw $t0, 0($s0)          # Carga el valor 12 en $t0
    add $t1, $t0, $t0       # Suma 12 + 12 = 24 y lo guarda en $t1
    sub $t2, $t1, $t0       # Resta 24 - 12 = 12 y lo guarda en $t2

    # 3. Operaciones intermedias y sobrescritura de registros
    add $t3, $t0, $t1       # Suma 12 + 24 = 36 y lo guarda en $t3
    addi $t0, $zero, 6      # Sobrescribe $t0 con el valor inmediato 6

    add $t4, $t1, $t2       # Suma 24 + 12 = 36 y lo guarda en $t4
    sub $t4, $t1, $t0       # Sobrescribe $t4 con la resta 24 - 6 = 18

    # 4. Cálculos para el resultado final
    add $t5, $t1, $t2       # Suma 24 + 12 = 36 y lo guarda en $t5
    sub $t6, $t1, $t2       # Resta 24 - 12 = 12 y lo guarda en $t6

    lw $t7, 0($s1)          # Carga el valor 25 desde 'registro' en $t7
    add $t8, $t5, $t6       # Suma 36 + 12 = 48 y lo guarda en $t8

    # 5. Comparación para definir el estado del inventario
    beq $t8, $zero, CERO    # Si $t8 es igual a 0, salta a la etiqueta CERO
    addi $t9, $zero, 101    # Como $t8 es 48 (distinto de 0), asigna 101 a $t9

    sw $t9, 0($s2)          # Guarda el código 101 en la variable 'estado'
    j FIN                   # Salta al final para no ejecutar el bloque CERO

CERO:
    addi $t9, $zero, 0      # Si $t8 fuera 0, asigna 0 a $t9
    sw $t9, 0($s2)          # Guarda 0 en la variable 'estado'

FIN:
    li $v0, 10              # Prepara el código de salida del programa
    syscall                 # Termina la ejecución