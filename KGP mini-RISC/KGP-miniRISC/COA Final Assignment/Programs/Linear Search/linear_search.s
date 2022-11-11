main:
    xor $20, $20     
    addi $20, 1
    xor $21, $21
    addi $21, 10     
    xor $8, $8       
    lw $9, -1($20)   

fori:
    xor $10, $10        
    add $10, $8
    comp $11, $21
    add $10, $11     
    bz $10, notFound 
	xor $0, $0

    xor $12, $12
    add $12, $8
    add $12, $20     
    lw $13, 0($12)   

    xor $14, $14
    comp $15, $13
    add $14, $9
    add $14, $15     
    bz $14, found    
	xor $0, $0

    addi $8, 1       
    b fori
	xor $0, $0

found: 
    xor $19, $19
    add $19, $8      
    b exit
	xor $0, $0

notFound:
    xor $19, $19
    addi $19, -1     

exit:
    xor $0, $0











