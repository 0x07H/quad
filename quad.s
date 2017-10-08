	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_solve_quad
	.def	_solve_quad;	.scl	2;	.type	32;	.endef
_solve_quad:
LFB55:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 56
	.cfi_def_cfa_offset 64
	mov	eax, DWORD PTR [esp+64]
	mov	ebx, DWORD PTR [esp+68]
	fld	QWORD PTR [eax]
	fld	QWORD PTR [eax+8]
	fld	QWORD PTR [eax+16]
	fldz
	fxch	st(3)
	fucom	st(3)
	fnstsw	ax
	fstp	st(3)
	sahf
	jp	L9
	je	L7
L9:
	fld	st(2)
	fmul	DWORD PTR LC1
	fmulp	st(1), st
	fld	st(1)
	fmul	st, st(2)
	fsubrp	st(1), st
	fldz
	fucom	st(1)
	fnstsw	ax
	sahf
	ja	L8
	fxch	st(1)
	fucom	st(1)
	fnstsw	ax
	fstp	st(1)
	sahf
	jp	L4
	jne	L4
	fstp	st(0)
	fchs
	fxch	st(1)
	mov	eax, 1
	fadd	st, st(0)
	fdivp	st(1), st
	fst	QWORD PTR [ebx]
	fstp	QWORD PTR [ebx+8]
L1:
	add	esp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L4:
	.cfi_restore_state
	fld	st(0)
	fsqrt
	fldz
	fucomp	st(2)
	fnstsw	ax
	sahf
	jbe	L13
	fstp	QWORD PTR [esp+40]
	fxch	st(1)
	fstp	QWORD PTR [esp+32]
	fxch	st(1)
	fstp	QWORD PTR [esp+24]
	fstp	QWORD PTR [esp]
	call	_sqrt
	fstp	st(0)
	fld	QWORD PTR [esp+40]
	fld	QWORD PTR [esp+32]
	fld	QWORD PTR [esp+24]
	jmp	L6
	.p2align 4,,10
L13:
	fstp	st(1)
	fxch	st(2)
L6:
	fadd	st, st(0)
	mov	eax, 2
	fld	st(2)
	fsub	st, st(2)
	fdiv	st, st(1)
	fstp	QWORD PTR [ebx]
	fxch	st(1)
	fchs
	fsubrp	st(2), st
	fdivp	st(1), st
	fstp	QWORD PTR [ebx+8]
	add	esp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L7:
	.cfi_restore_state
	fstp	st(0)
	fstp	st(0)
	fstp	st(0)
	mov	eax, -1
	jmp	L1
	.p2align 4,,10
L8:
	fstp	st(0)
	fstp	st(0)
	fstp	st(0)
	fstp	st(0)
	mov	eax, -2
	jmp	L1
	.cfi_endproc
LFE55:
	.section .rdata,"dr"
	.align 4
LC3:
	.ascii "Enter a, b and c of quadratic equation: \0"
LC4:
	.ascii "%lf%lf%lf\0"
	.text
	.p2align 4,,15
	.globl	_get_input
	.def	_get_input;	.scl	2;	.type	32;	.endef
_get_input:
LFB56:
	.cfi_startproc
	push	esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	push	ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	sub	esp, 68
	.cfi_def_cfa_offset 80
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	mov	ebx, DWORD PTR [esp+80]
	call	_printf
	lea	eax, [esp+56]
	mov	esi, DWORD PTR __imp___iob
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	mov	DWORD PTR [esp+16], eax
	lea	eax, [esp+48]
	mov	DWORD PTR [esp], esi
	mov	DWORD PTR [esp+12], eax
	lea	eax, [esp+40]
	mov	DWORD PTR [esp+8], eax
	call	_fscanf
	cmp	eax, 3
	jne	L18
	fld	QWORD PTR [esp+40]
	fstp	QWORD PTR [ebx]
	fld	QWORD PTR [esp+48]
	fstp	QWORD PTR [ebx+8]
	fld	QWORD PTR [esp+56]
	fstp	QWORD PTR [ebx+16]
	mov	DWORD PTR [esp+8], 2
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], esi
	call	_fseek
	xor	eax, eax
L14:
	add	esp, 68
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L18:
	.cfi_restore_state
	mov	DWORD PTR [esp+8], 2
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], esi
	call	_fseek
	mov	eax, -1
	jmp	L14
	.cfi_endproc
LFE56:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC5:
	.ascii "Double real root %24.16f\12\0"
LC6:
	.ascii "Roots  %24.16f  %24.16f\12\0"
	.align 4
LC7:
	.ascii "Please enter 1 to run again or 0 to quit: \0"
LC8:
	.ascii "%d\0"
LC9:
	.ascii "No real roots\0"
LC10:
	.ascii "Not a quadratic (a==0)\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB57:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	and	esp, -16
	sub	esp, 96
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	___main
	mov	ebx, DWORD PTR __imp___iob
	lea	edi, [esp+88]
	mov	DWORD PTR [esp+68], 1
	.p2align 4,,10
L22:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	lea	eax, [esp+80]
	mov	DWORD PTR [esp+16], edi
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	mov	DWORD PTR [esp], ebx
	mov	DWORD PTR [esp+12], eax
	lea	eax, [esp+72]
	mov	DWORD PTR [esp+8], eax
	call	_fscanf
	cmp	eax, 3
	jne	L38
	fld	QWORD PTR [esp+72]
	mov	DWORD PTR [esp+8], 2
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], ebx
	fstp	QWORD PTR [esp+56]
	fld	QWORD PTR [esp+80]
	fstp	QWORD PTR [esp+48]
	fld	QWORD PTR [esp+88]
	fstp	QWORD PTR [esp+40]
	call	_fseek
	fldz
	fld	QWORD PTR [esp+56]
	fucom	st(1)
	fnstsw	ax
	fstp	st(1)
	sahf
	jp	L32
	je	L23
L32:
	fld	st(0)
	fmul	DWORD PTR LC1
	fld	QWORD PTR [esp+40]
	fmulp	st(1), st
	fld	QWORD PTR [esp+48]
	fld	st(0)
	fmul	st, st(1)
	fsubrp	st(2), st
	fldz
	fucom	st(2)
	fnstsw	ax
	sahf
	ja	L25
	fxch	st(2)
	fucom	st(2)
	fnstsw	ax
	fstp	st(2)
	sahf
	jp	L39
	jne	L40
	fstp	st(1)
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	fchs
	fxch	st(1)
	fadd	st, st(0)
	fdivp	st(1), st
	fstp	QWORD PTR [esp+4]
	call	_printf
	.p2align 4,,10
L30:
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	_printf
	lea	eax, [esp+68]
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC8
	mov	DWORD PTR [esp], ebx
	mov	DWORD PTR [esp+8], eax
	call	_fscanf
	mov	DWORD PTR [esp+8], 2
	mov	esi, eax
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], ebx
	call	_fseek
	cmp	esi, 1
	jne	L30
	cmp	DWORD PTR [esp+68], 1
	je	L22
	lea	esp, [ebp-12]
	xor	eax, eax
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4,,10
L38:
	.cfi_restore_state
	mov	DWORD PTR [esp+8], 2
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], ebx
	call	_fseek
	jmp	L22
L39:
	fstp	st(0)
	jmp	L26
	.p2align 4,,10
L40:
	fstp	st(0)
L26:
	fld	st(0)
	fsqrt
	fldz
	fucomp	st(2)
	fnstsw	ax
	sahf
	jbe	L41
	fstp	QWORD PTR [esp+40]
	fxch	st(1)
	fstp	QWORD PTR [esp+56]
	fstp	QWORD PTR [esp]
	call	_sqrt
	fstp	st(0)
	fld	QWORD PTR [esp+40]
	fld	QWORD PTR [esp+56]
	jmp	L29
	.p2align 4,,10
L41:
	fstp	st(1)
	fxch	st(1)
L29:
	fadd	st, st(0)
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	fld	QWORD PTR [esp+48]
	fld	st(0)
	fchs
	fsub	st, st(3)
	fdiv	st, st(2)
	fstp	QWORD PTR [esp+12]
	fsubp	st(2), st
	fdivp	st(1), st
	fstp	QWORD PTR [esp+4]
	call	_printf
	jmp	L30
	.p2align 4,,10
L23:
	fstp	st(0)
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_puts
	jmp	L30
L25:
	fstp	st(0)
	fstp	st(0)
	fstp	st(0)
	fstp	st(0)
	mov	DWORD PTR [esp], OFFSET FLAT:LC9
	call	_puts
	jmp	L30
	.cfi_endproc
LFE57:
	.section .rdata,"dr"
	.align 4
LC1:
	.long	1082130432
	.def	_sqrt;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_fseek;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
