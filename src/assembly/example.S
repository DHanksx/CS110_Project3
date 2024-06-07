.section .data
string_loading: .asciz "Initializing..."
string_completed: .asciz "Success!"

.section .text
.globl draw
.globl numset

.type draw, @function
.type numset, @function

numset:
    li t0, 71         
    beq a0, t0, is_71  
    li a0, 0           
    ret                

is_71:
    li a0, 1           
    ret                


draw:

	#内层
	li a0, 35
	li a1, 65
	li a2, 45
	li a3, 85
	li a4, 65535
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	#次内层
	li a0, 30
	li a1, 50
	li a2, 50
	li a3, 100
	li a4, 2016
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	#次外层
	li a0, 10
	li a1, 20
	li a2, 70
	li a3, 130
	li a4, 63488
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	#外层
	li a0, 0
	li a1, 0
	li a2, 75
	li a3, 150
	li a4, 31
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 700
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	#消除外层
	li a0, 0
	li a1, 0
	li a2, 75
	li a3, 150
	li a4, 0
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	#消除次外层
	li a0, 10
	li a1, 20
	li a2, 70
	li a3, 130
	li a4, 0
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	#消除次内层
	li a0, 30
	li a1, 50
	li a2, 50
	li a3, 100
	li a4, 0
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	#消除内层
	li a0, 35
	li a1, 65
	li a2, 45
	li a3, 85
	li a4, 0
	addi sp, sp, -4
	sw ra, 0(sp)
	jal LCD_DrawRectangle
	lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 1000
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

    # Set up arguments for LCD_ShowChar function
    li a0, 10  # x
    li a1, 0  # y
    li a2, 'F'  
    li a3, 0  # mode 
    li a4, 0xFFFF  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	li a0, 20  # x
    li a1, 0  # y
    li a2, 'L'  
    li a3, 0  # mode 
    li a4, 2016 # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4




	li a0, 30  # x
    li a1, 0  # y
    li a2, 'A'  
    li a3, 0  # mode 
    li a4, 63488  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4




	li a0, 40  # x
    li a1, 0  # y
    li a2, 'P'  
    li a3, 0  # mode 
    li a4, 65504  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4



	li a0, 50  # x
    li a1, 0  # y
    li a2, 'P'  
    li a3, 0  # mode 
    li a4, 65504  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4




	li a0, 60  # x
    li a1, 0  # y
    li a2, 'Y'  
    li a3, 0  # mode 
    li a4, 48192  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4




	li a0, 30  # x
    li a1, 30  # y
    li a2, 'B'  
    li a3, 0  # mode 
    li a4, 65504  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4



	li a0, 40  # x
    li a1, 30  # y
    li a2, 'I'  
    li a3, 0  # mode 
    li a4, 2016  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

    li a0, 50  # x
    li a1, 30  # y
    li a2, 'R'  
    li a3, 0  # mode 
    li a4, 63488  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 300
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	li a0, 60  # x
    li a1, 30  # y
    li a2, 'D'  
    li a3, 0  # mode 
    li a4, 0xFFFF  # color

    addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowChar

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 2000
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4


	li a0, 10
	li a1, 50
	la a2, string_loading
	li a3, 65535
	addi sp, sp, -4
    sw ra, 0(sp)

    jal LCD_ShowString

    lw ra, 0(sp)
    addi sp, sp, 4

	li a0, 500
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	li t0, 11   #i
	li t1, 0   #axis x
	li t3, 70
loop_start:
	li a0, 10

	li a1, 90
	mv a2, t0
	li a3, 90
	li a4, 65535
	addi sp, sp, -4
	sw ra, 0(sp)

	jal LCD_DrawLine

	lw ra, 0(sp)
	addi sp, sp, 4
	
	addi t0, t0, 1
	beq t0, t3, loop_end; # if a2 =t3 then end
	
	# li a0, 15
	# addi sp, sp, -4
	# sw ra, 0(sp)
	# jal delay_1ms
	# lw ra, 0(sp)
	# addi sp, sp, 4


	j loop_start

loop_end:
	li a0, 500
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	//show "completed

    li x20, 1  # Number of blinks
blink_start:
	# Show "Success!"
	li a0, 0
	li a1, 95
	la a2, string_completed
	li a3, 65535
	addi sp, sp, -4
    sw ra, 0(sp)
    jal LCD_ShowString
    lw ra, 0(sp)
    addi sp, sp, 4

	# Delay
	li a0, 500
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	# Hide "Success!" by writing over it with background color
	li a0, 0
	li a1, 95
	la a2, string_completed
	li a3, 0  # Background color (black)
	addi sp, sp, -4
    sw ra, 0(sp)
    jal LCD_ShowString
    lw ra, 0(sp)
    addi sp, sp, 4

	# Delay
	li a0, 500
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

	# Decrement blink counter and loop if not zero
	addi x20, x20, -1
	bgez x20, blink_start


	# Final display of "Success!"
	li a0, 0
	li a1, 95
	la a2, string_completed
	li a3, 65535
	addi sp, sp, -4
    sw ra, 0(sp)
    jal LCD_ShowString
    lw ra, 0(sp)
    addi sp, sp, 4

	# Final delay
	li a0, 1000
	addi sp, sp, -4
	sw ra, 0(sp)
	jal delay_1ms
	lw ra, 0(sp)
	addi sp, sp, 4

end:



