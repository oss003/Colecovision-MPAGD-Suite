;--------------------------------------------------------------------------
; Cartridge header part 2
;--------------------------------------------------------------------------

; Declare variables

READ_REGISTER:	equ $1fdc	; Read VDP register to clear NMI flag

;--------------------------------------------------------------------------
; Initialisation routine for Super Game Module (SGM)
;--------------------------------------------------------------------------

init:
	di
	ld a,1			; Enable SGM
	out ($53),a

	ld a,00011111b		; Enable BIOS
	out ($7f),a

	jp start

;--------------------------------------------------------------------------
; NMI routine at 60 Hz
;--------------------------------------------------------------------------

NMI:

; Save registers

	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	PUSH	IX
	PUSH	IY
;	EX	AF,AF'
;	PUSH	AF
;	EXX
;	PUSH	BC
;	PUSH	DE
;	PUSH	HL

; Increment time to sync framerate at 25 Hz

	ld hl,time
	ld a,(hl)
	inc a
	ld (hl),a

; Increment clock

	ld hl,MSX_JIFFY
	ld a,(hl)
	inc a
	ld (hl),a

; Scan keys

	call POLLER

; Sound

	if (YFLAG or XFLAG)
		call psgrout
		if YFLAG
			call music_play
		endif
	endif

; Now restore everything

nonmi:
;	POP	HL
;	POP	DE
;	POP	BC
;	EXX
;	POP	AF
;	EX	AF,AF'
	POP	IY
	POP	IX
	POP	HL
	POP	DE
	POP	BC

	call READ_REGISTER	;Side effect allows another NMI to happen
	pop af

	retn

