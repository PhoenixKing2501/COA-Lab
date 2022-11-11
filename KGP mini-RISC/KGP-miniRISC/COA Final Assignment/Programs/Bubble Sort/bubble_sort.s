main:
    xor $0, $0
    xor $20, $20        
    xor $21, $21
    addi $21, 10        
    xor $8, $8          
    xor $9, $9          

fori:
    xor $10, $10
    add $10, $8
    comp $11, $21
    add $10, $11
    addi $10, 1         
    bz $10, exitfori    
    xor $0, $0
    xor $9, $9          

forj:
    xor $11, $11
    add $11, $9
    add $11, $10        
    bz $11, exitforj    
    xor $0, $0

    xor $12, $12
    add $12, $9
    add $12, $20        
    lw $13, 0($12)      
    xor $4, $4
    add $4, $12
    addi $12, 1
    lw $14, 0($12)      
    xor $5, $5
    add $5, $12

    comp $15, $14
    add $13, $15        
    bltz $13, incj
    xor $0, $0
    bz $13, incj
    xor $0, $0
    bl swap             
    xor $0, $0

incj:
    addi $9, 1          
    b forj
    xor $0, $0

swap:
    lw $18, 0($4)
    lw $19, 0($5)
    sw $18, 0($5)
    sw $19, 0($4)
    br $31
    xor $0, $0

exitforj:
    addi $8, 1          
    b fori
    xor $0, $0

exitfori:
    xor $0, $0
    lw $20, 0($0)
    lw $21, 1($0)
    lw $22, 2($0)
    lw $23, 3($0)
    lw $24, 4($0)
    lw $25, 5($0)
    lw $26, 6($0)
    lw $27, 7($0)
    lw $28, 8($0)
    lw $29, 9($0)
    
loop:
    b loop
    xor $0, $0