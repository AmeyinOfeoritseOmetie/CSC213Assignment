# File: CSC213Assignmentmips.asm
#Author: Ameyin Ofeoritse Ometie
#REG NO.: 79195356AJ (Direct Entry)
#level: 200 Level
#Purpose: A PROGRAM TO COMPUTE THE ROOT OF A QUADRATIC EQUATION

.data
prompt:.asciiz "\nEnter the value of a:\n"
prompt1:.asciiz "Enter the value of b:\n"
prompt2:.asciiz "Enter the value of c:\n"
msg1:.asciiz "Complex number\n"
num:.float 4.0
num1:.float 2.0
msg2:.asciiz "The roots of the values inputed are:\n"
msg3:.asciiz " and "
msg4:.asciiz "The purpose of this program is to compute the root of a quadratic equation"
msg5:.asciiz "\n"

.text
main:

#load 4 in coproc1
lwc1 $f4 num

#load 2 in coproc1
lwc1 $f5 num1

li $v0 4
la $a0 msg4
syscall


li $v0 4
la $a0 msg5
syscall

#assk user for the value of a
li $v0 4
la $a0 prompt
syscall

li $v0 6
syscall
mov.s $f1 $f0

#ask user for the value of b
li $v0 4
la $a0 prompt1
syscall

li $v0 6
syscall
mov.s $f2 $f0

#ask user for the value of c
li $v0 4
la $a0 prompt2
syscall

li $v0 6
syscall
mov.s $f3 $f0

# a *c
mul.s $f30 $f1 $f3
#4 * a* c
mul.s $f29 $f30 $f4
#b * b
mul.s $f28 $f2 $f2
#d=(b * b - 4ac)
sub.s $f27 $f28 $f29

mfc1 $t2 $f27
#if $ t2 < 0
bltz $t2 else

#sqrt of d
sqrt.s $f26 $f27

#make $f2(b) negative
neg.s $f9 $f2

add.s $f25 $f9 $f26
sub.s $f22 $f9 $f26
mul.s $f8 $f5 $f1
div.s $f11 $f25 $f8
div.s $f13 $f22 $f8

#first result
li $v0 4
la $a0 msg2
syscall

li $v0 2
mov.s $f12 $f11
syscall


li $v0 4
la $a0 msg3
syscall

#second result
li $v0 2
mov.s $f12 $f13
syscall
b exit

#else
else:
li $v0 4
la $a0 msg1
syscall

exit:
li $v0 10
syscall

