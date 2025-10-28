
WRITE_REGISTER:		equ $1fd9
PATSIZE:		equ (sprgfx-chgfx)/8
CONTROLLER_INIT:	equ $1105

;-----------------------------------------------------------
; - Setup Screen 2,2
; - Interrupts are disabled
; - Fill screen 3x with chars 0-255
; - Clear char table
;-----------------------------------------------------------

CV_INIGRP:
	ld bc,0002h		; Reg 0: Mode 2
	call WRITE_REGISTER
	ld bc,0206h        	; Name table 1800h
	call WRITE_REGISTER
	ld bc,03ffh        	; Colour table 2000h
	call WRITE_REGISTER
	ld bc,0403h        	; Pattern table 0000h
	call WRITE_REGISTER
	ld bc,0536h        	; Sprite attribute table 1b00h
	call WRITE_REGISTER
	ld bc,0607h        	; Sprite pattern table 3800h
	call WRITE_REGISTER
	ld bc,0700h        	; Base colours
	call WRITE_REGISTER
	ld bc,01c2h		; Reg 1: Mode 2, 16k, no interrupts, 16x16 sprites
	call WRITE_REGISTER

	ld hl,MSX_NAMTBL		; Fill screen 3x 0-255
	call SETWRT
        xor a
	ld b,3
nxtblk:
	out (MSX_VDPDRW),a
	inc a
	jr nz,nxtblk
	djnz nxtblk

	call CV_CLS		; Clear char table
	ret

;-----------------------------------------------------------
; Clear the VDP Pattern table (clears screen)
;-----------------------------------------------------------

CV_CLS:
	ld bc,256/8*192
	push bc
	ld hl,MSX_CHRTBL		; Clear char table
        xor a
	call FILVRM

	ld hl,MSX_CLRTBL		; Clear colour tabel
	ld a,(MSX_BAKCLR)
	pop bc
	call FILVRM

	ret

;-----------------------------------------------------------
; Fill a section of VRAM with value in A
; HL = VRAM Address
; BC = Length
;-----------------------------------------------------------

FILVRM:
	ld e,a
	call SETWRT
FLOOP:
	ld a,e
	out (MSX_VDPDRW),a
	dec bc
	ld a,c
	or b
	cp 0
	jr nz,FLOOP
	ret

;-----------------------------------------------------------
; Set write to Video Ram
; HL = VRAM Address
;-----------------------------------------------------------

SETWRT:
	di
	ld a,l
	out (MSX_VDPCW),a
	ld a,h
	and 3Fh
	or 40h
	out (MSX_VDPCW),a
	ei
	ret

CONTROLLER_BUFFER:
	ds 12
