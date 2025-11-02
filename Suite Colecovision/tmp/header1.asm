;--------------------------------------------------------------------------
; Cartridge header part 1
;--------------------------------------------------------------------------

; Define cartridge header

	db $55,$aa		; Cartridge type
	dw $0000		; LOCAL_SPR_TBL
	dw $0000		; SPRITE_ORDER
	dw $0000		; WORK_BUFFER
	dw CONTROLLER_BUFFER	; CONTROLLER_MAP
	dw init			; START_GAME

; Define rst vectors

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
rst_38:
	reti
	nop

; Define NMI vector

nmi_vec:			; NMI_INT_VECT
	jp NMI

