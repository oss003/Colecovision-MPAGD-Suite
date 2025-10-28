CONTROLLER_INIT:	equ $1105

; Cartridge header

	db $aa,$55		; Cartridge type
	dw $0000		; LOCAL_SPR_TBL
	dw $0000		; SPRITE_ORDER
	dw $0000		; WORK_BUFFER
	dw CONTROLLER_BUFFER	; CONTROLLER_MAP
	dw init			; START_GAME
rst_8:
	reti
	nop
rst_10:
	reti
	nop
rst_18:
	reti
        nop
rst_20:
	reti
	nop
rst_28:
	reti
	nop
rst_30:
	reti
	nop
rst_38:			; IRQ_INT_VECT
	reti
	nop
nmi_vec:		; NMI_INT_VECT
	jp NMI

	db "AGDGAME/PRESENTS MPAGD/2025"
init:
	di
	ld a,1		; Enable SGM
	out ($53),a

	ld a,00011111b	; Enable BIOS
	out ($7f),a

;Enable both joysticks, buttons, keypads

		ld hl,09b9bh
		ld (CONTROLLER_BUFFER),hl
		xor a
		call CONTROLLER_INIT    

loop:
	jp loop

NMI:
	retn

CONTROLLER_BUFFER:
	ds 12

