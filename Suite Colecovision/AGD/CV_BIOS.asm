;-----------------------------------------------------------
; Colecovision BIOS calls
;-----------------------------------------------------------

WRITE_REGISTER:		equ $1fd9
PATSIZE:		equ (sprgfx-chgfx)/8
CONTROLLER_INIT:	equ $1105
POLLER:			equ $1feb
clock:			equ MSX_JIFFY

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
	ld bc,01e2h		; Reg 1: Mode 2, 16k, no interrupts, 16x16 sprites
	call WRITE_REGISTER

; Fill screen 3x 0-255

	ld hl,MSX_NAMTBL		
	call CV_SETWRT
        xor a
	ld b,3
nxtblk:
	out (MSX_VDPDRW),a
	inc a
	jr nz,nxtblk
	djnz nxtblk

; Clear char table

	call CV_CLS		
	ret

;-----------------------------------------------------------
; Clear the VDP Pattern table (clears screen)
;-----------------------------------------------------------

CV_CLS:
	ld bc,256/8*192
	push bc
	ld hl,MSX_CHRTBL		; Clear char table
        xor a
	call CV_FILVRM

	ld hl,MSX_CLRTBL		; Clear colour tabel
	ld a,(MSX_BAKCLR)
	pop bc
	call CV_FILVRM

	ret

;-----------------------------------------------------------
; Fill a section of VRAM with value in A
; HL = VRAM Address
; BC = Length
;-----------------------------------------------------------

CV_FILVRM:
	ld e,a
	call CV_SETWRT
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

CV_SETWRT:
	di
	ld a,l
	out (MSX_VDPCW),a
	ld a,h
	and 3Fh
	or 40h
	out (MSX_VDPCW),a
	ei
	ret

;-----------------------------------------------------------
; Write data in VRAM
; HL = VRAM Address
; A  = data
;-----------------------------------------------------------

CV_WRTVRM:
	push af
	call CV_SETWRT
	pop af
	out (MSX_VDPDRW),a
	ret

;-----------------------------------------------------------
; Read data from VRAM
; HL = VRAM Address
; A  = data
;-----------------------------------------------------------

CV_RDVRM:
	ld a,l
	out (MSX_VDPCW),a 
	ld a,h
	and 3Fh
	out (MSX_VDPCW),a
	in a,(MSX_VDPSR)
	ret
