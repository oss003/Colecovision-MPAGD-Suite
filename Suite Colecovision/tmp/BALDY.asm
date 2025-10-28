ifexists game.cfg
include game.cfg
endif

    output BALDY.rom

PageSize	equ	$4000

    defpage 0, $8000, $8000

    code @ $8000, #1, page 0

        include "header1.asm"
        include "name.txt"
        include "header2.asm"
    include "MSX_Defs.asm"
    include "MSX_Macros.asm"


WINDOWTOP equ 1
WINDOWLFT equ 1
WINDOWHGT equ 20
WINDOWWID equ 30
MAPWID	equ 13
mapedge: 
       db 255,255,255,255,255,255,255,255,255,255,255,255,255
mapdat:
       db 255,0,1,2,3,4,5,6,7,8,9,10,255
       db 255,11,12,13,14,15,16,17,18,19,20,255,255
       db 255,255,255,255,255,255,255,255,255,255,255,255,255
stmap: db 1

evnt00:	equ $
       call skobj
       ld (varobj),a
       ld a,255
       ld hl,varobj
       cp (hl)
       jp z,a00039
       ld a,2
       ld (varg),a
a00039 ld a,2
       ld hl,varg
       cp (hl)
       jp nz,a00161
       ld a,(ix+3)
       ld (varj),a
       ld a,(varj)
       rra
       rra
       and 63
       ld (varj),a
       ld a,(varj)
       and 127
       ld (sndtyp),a
       ld a,16
       ld (ix+1),a
       ld a,160
       cp (ix+3)
       jp c,a00152
       xor a
       ld hl,varc
       cp (hl)
       jp nz,a00143
       xor a
       call animsp
a00143 inc (ix+3)
       jp a00161
a00152 ld hl,deadf
       ld (hl),h
a00161 xor a
       ld hl,varg
       cp (hl)
       jp nz,a01062
       xor a
       ld hl,varl
       cp (hl)
       jp nz,a00678
       ld a,(joyval)
       and 1
       jp z,a00357
       ld a,1
       ld hl,vare
       cp (hl)
       jp nz,a00248
       xor a
       ld (vare),a
       ld c,8
       ld a,(ix+3)
       sub c
       ld (ix+3),a
a00248 ld a,218
       cp (ix+4)
       jp c,a00357
       xor a
       ld hl,vark
       cp (hl)
       jp nz,a00357
       ld a,(ix+4)
       ld (vara),a
       ld c,20
       ld a,(vara)
       add a,c
       ld (vara),a
       ld c,4
       ld a,(ix+3)
       sub c
       ld (ix+3),a
       ld a,1
       ld (vard),a
       ld a,1
       ld (vark),a
       ld a,1
       ld (ix+1),a
       xor a
       ld c,0
       call sfx_set
a00357 ld a,(joyval)
       and 2
       jp z,a00520
       ld a,1
       ld hl,vare
       cp (hl)
       jp nz,a00411
       xor a
       ld (vare),a
       ld c,8
       ld a,(ix+3)
       sub c
       ld (ix+3),a
a00411 ld a,30
       cp (ix+4)
       jp nc,a00520
       xor a
       ld hl,vark
       cp (hl)
       jp nz,a00520
       ld a,(ix+4)
       ld (vara),a
       ld c,38
       ld a,(vara)
       sub c
       ld (vara),a
       ld c,4
       ld a,(ix+3)
       sub c
       ld (ix+3),a
       ld a,2
       ld (vard),a
       ld a,1
       ld (vark),a
       ld a,3
       ld (ix+1),a
       xor a
       ld c,0
       call sfx_set
a00520 ld a,(joyval)
       and 4
       jp z,a00599
       xor a
       ld hl,vark
       cp (hl)
       jp nz,a00599
       xor a
       ld hl,vare
       cp (hl)
       jp nz,a00599
       ld a,1
       ld (vare),a
       ld a,4
       ld (ix+1),a
       ld c,8
       ld a,(ix+3)
       add a,c
       ld (ix+3),a
a00599 ld a,(joyval)
       and 8
       jp z,a00678
       xor a
       ld hl,vark
       cp (hl)
       jp nz,a00678
       ld a,1
       ld hl,vare
       cp (hl)
       jp nz,a00678
       xor a
       ld (vare),a
       xor a
       ld (ix+1),a
       ld c,8
       ld a,(ix+3)
       sub c
       ld (ix+3),a
a00678 ld a,1
       ld hl,vard
       cp (hl)
       jp nz,a00763
       ld a,(ix+4)
       ld hl,vara
       cp (hl)
       jp nc,a00739
       inc (ix+4)
       inc (ix+4)
       ld a,(vara)
       inc a
       ld (vara),a
       jp a00763
a00739 xor a
       ld (vard),a
       xor a
       ld (vark),a
       xor a
       ld (ix+1),a
a00763 ld a,(joyval)
       and 16
       jp z,a00918
       xor a
       ld hl,varb
       cp (hl)
       jp nz,a00847
       ld b,DEADLY
       call tded
       cp b
       jp nz,a00847
       ld c,40
       ld a,(ix+3)
       add a,c
       ld (ix+3),a
       ld a,1
       ld c,0
       call sfx_set
       ld a,10
       ld (varb),a
a00847 xor a
       ld hl,varb
       cp (hl)
       jp nz,a00918
       ld b,CUSTOM
       call tded
       cp b
       jp nz,a00918
       ld c,40
       ld a,(ix+3)
       sub c
       ld (ix+3),a
       ld a,1
       ld c,0
       call sfx_set
       ld a,10
       ld (varb),a
a00918 ld a,2
       ld hl,vard
       cp (hl)
       jp nz,a00990
       ld a,(ix+4)
       ld hl,vara
       cp (hl)
       jp c,a00965
       dec (ix+4)
       dec (ix+4)
       jp a00990
a00965 xor a
       ld (vard),a
       xor a
       ld (vark),a
       ld a,2
       ld (ix+1),a
a00990 xor a
       ld hl,vard
       cp (hl)
       jp nz,a01062
       xor a
       ld hl,vare
       cp (hl)
       jp nz,a01062
       call cangd
       jp nz,a01054
       inc (ix+3)
       inc (ix+3)
       ld a,1
       ld (varl),a
       jp a01062
a01054 xor a
       ld (varl),a
a01062 ld a,1
       ld hl,varg
       cp (hl)
       jp nz,a01285
       ld a,114
       ld hl,varf
       cp (hl)
       jp nc,a01113
       call cls
       ld hl,nexlev
       ld (hl),h
       jp a01285
a01113 ld a,11
       ld (charx),a
       ld a,10
       ld (chary),a
       ld a,6
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       ld a,2
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,2
       call dmsg
       ld a,4
       ld (loopa),a
a01210 ld a,2
       ld c,0
       call sfx_set
       ld hl,loopa
       dec (hl)
       jp nz,a01210
       push ix
       ld b,100
       call delay
       pop ix
       xor a
       ld (varg),a
       xor a
       ld (vark),a
       xor a
       ld (vard),a
       ld hl,nexlev
       ld (hl),h
a01285 ret

evnt01:	equ $
       ld c,0
       call sktyp
       jp nc,b00025
       ld a,2
       ld (varg),a
b00025 call cangr
       jp nz,b00321
       ld a,5
       ld hl,scno
       cp (hl)
       jp nz,b00066
       ld a,7
       and $0F
       ld c,a
       call cspr
b00066 ld a,6
       ld hl,scno
       cp (hl)
       jp nz,b00098
       ld a,7
       and $0F
       ld c,a
       call cspr
b00098 ld a,7
       ld hl,scno
       cp (hl)
       jp nz,b00129
       ld a,7
       and $0F
       ld c,a
       call cspr
b00129 ld a,9
       ld hl,scno
       cp (hl)
       jp nc,b00161
       ld a,7
       and $0F
       ld c,a
       call cspr
b00161 inc (ix+4)
       ld a,5
       ld hl,scno
       cp (hl)
       jp nz,b00197
       ld a,2
       and $0F
       ld c,a
       call cspr
b00197 ld a,6
       ld hl,scno
       cp (hl)
       jp nz,b00229
       ld a,2
       and $0F
       ld c,a
       call cspr
b00229 ld a,7
       ld hl,scno
       cp (hl)
       jp nz,b00261
       ld a,3
       and $0F
       ld c,a
       call cspr
b00261 ld a,9
       ld hl,scno
       cp (hl)
       jp nc,b00293
       ld a,2
       and $0F
       ld c,a
       call cspr
b00293 xor a
       ld hl,varc
       cp (hl)
       jp nz,b00317
       xor a
       call animsp
b00317 jp b00338
b00321 xor a
       ld (ix+4),a
       ld a,4
       ld (sndtyp),a
b00338 ret

evnt02:	equ $
       ld c,0
       call sktyp
       jp nc,c00025
       ld a,2
       ld (varg),a
c00025 call cangr
       jp nz,c00072
       inc (ix+4)
       inc (ix+4)
       xor a
       ld hl,varc
       cp (hl)
       jp nz,c00068
       xor a
       call animsp
c00068 jp c00089
c00072 xor a
       ld (ix+4),a
       ld a,4
       ld (sndtyp),a
c00089 ret

evnt03:	equ $
       ld c,0
       call sktyp
       jp nc,d00025
       ld a,2
       ld (varg),a
d00025 call cangl
       jp nz,d00097
       ld a,7
       and $0F
       ld c,a
       call cspr
       dec (ix+4)
       ld a,6
       and $0F
       ld c,a
       call cspr
       xor a
       ld hl,varc
       cp (hl)
       jp nz,d00093
       xor a
       call animsp
d00093 jp d00115
d00097 ld a,4
       ld (sndtyp),a
       ld a,240
       ld (ix+4),a
d00115 ret

evnt04:	equ $
       ld c,0
       call sktyp
       jp nc,e00025
       ld a,2
       ld (varg),a
e00025 ld a,20
       ld hl,scno
       cp (hl)
       jp nz,e00070
       xor a
       ld hl,varc
       cp (hl)
       jp nz,e00066
       xor a
       call animsp
e00066 jp e00135
e00070 call cangl
       jp nz,e00118
       dec (ix+4)
       dec (ix+4)
       xor a
       ld hl,varc
       cp (hl)
       jp nz,e00113
       xor a
       call animsp
e00113 jp e00135
e00118 ld a,4
       ld (sndtyp),a
       ld a,240
       ld (ix+4),a
e00135 ret

evnt05:	equ $
       ld c,0
       call sktyp
       jp nc,f00025
       ld a,2
       ld (varg),a
f00025 ld a,150
       cp (ix+3)
       jp c,f00071
       inc (ix+3)
       xor a
       ld hl,varc
       cp (hl)
       jp nz,f00067
       xor a
       call animsp
f00067 jp f00139
f00071 xor a
       ld (ix+3),a
       ld a,160
       ld d,a
       call random
       ld h,a
       call imul
       ld a,h
       ld (varrnd),a
       ld a,(varrnd)
       ld (ix+4),a
       ld c,60
       ld a,(ix+4)
       add a,c
       ld (ix+4),a
       jp f00139
f00139 ret

evnt06:	equ $
       ld c,0
       call sktyp
       jp nc,g00025
       ld a,2
       ld (varg),a
g00025 xor a
       ld hl,varc
       cp (hl)
       jp nz,g00105
       xor a
       call animsp
       call cangr
       jp nz,g00097
       ld a,7
       and $0F
       ld c,a
       call cspr
       inc (ix+4)
       ld a,5
       and $0F
       ld c,a
       call cspr
       jp g00105
g00097 xor a
       ld (ix+4),a
g00105 ret

evnt07:	equ $
       xor a
       ld hl,varc
       cp (hl)
       jp nz,h00043
       ld a,3
       and $0F
       ld c,a
       call cspr
       xor a
       call animsp
h00043 ld c,0
       call sktyp
       jp nc,h00104
       ld a,7
       and $0F
       ld c,a
       call cspr
       ld a,4
       call explod
       ld a,(varf)
       inc a
       ld (varf),a
       ld a,3
       ld c,0
       call sfx_set
h00104 ld a,114
       ld hl,varf
       cp (hl)
       jp nz,h00314
       call cls
       ld a,250
       ld (varb),a
       ld a,115
       ld (varf),a
       ld a,99
       ld (contrl),a
h00152 ld a,99
       ld hl,contrl
       cp (hl)
       jp nz,h00305
       ld hl,keys+14
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,h00204
       xor a
       ld (contrl),a
h00204 ld hl,keys+16
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,h00239
       ld a,1
       ld (contrl),a
h00239 ld hl,keys+18
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,h00275
       ld a,2
       ld (contrl),a
h00275 ld hl,keys+20
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,h00301
h00301 jp h00152
h00305 ld a,1
       ld (varg),a
h00314 ld a,112
       ld hl,varf
       cp (hl)
       jp nz,h00362
       ld (ix+0),255
       ld a,113
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,20
       ld (varh),a
h00362 ld a,111
       ld hl,varf
       cp (hl)
       jp nz,h00388
       ld a,136
       ld (ix+3),a
h00388 ld a,110
       ld hl,varf
       cp (hl)
       jp nz,h00413
       ld a,54
       ld (ix+3),a
h00413 ld a,109
       ld hl,varf
       cp (hl)
       jp nz,h00439
       ld a,16
       ld (ix+3),a
h00439 ld a,108
       ld hl,varf
       cp (hl)
       jp nz,h00473
       ld a,60
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
h00473 ld a,106
       ld hl,varf
       cp (hl)
       jp nz,h00521
       ld (ix+0),255
       ld a,107
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,19
       ld (varh),a
h00521 ld a,105
       ld hl,varf
       cp (hl)
       jp nz,h00556
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h00556 ld a,104
       ld hl,varf
       cp (hl)
       jp nz,h00590
       ld a,60
       ld (ix+4),a
       ld a,134
       ld (ix+3),a
h00590 ld a,103
       ld hl,varf
       cp (hl)
       jp nz,h00625
       ld a,220
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
h00625 ld a,102
       ld hl,varf
       cp (hl)
       jp nz,h00659
       ld a,180
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
h00659 ld a,101
       ld hl,varf
       cp (hl)
       jp nz,h00694
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h00694 ld a,99
       ld hl,varf
       cp (hl)
       jp nz,h00742
       ld (ix+0),255
       ld a,100
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,18
       ld (varh),a
h00742 ld a,98
       ld hl,varf
       cp (hl)
       jp nz,h00767
       ld a,54
       ld (ix+3),a
h00767 ld a,97
       ld hl,varf
       cp (hl)
       jp nz,h00793
       ld a,20
       ld (ix+4),a
h00793 ld a,96
       ld hl,varf
       cp (hl)
       jp nz,h00818
       ld a,134
       ld (ix+3),a
h00818 ld a,95
       ld hl,varf
       cp (hl)
       jp nz,h00844
       ld a,16
       ld (ix+3),a
h00844 ld a,93
       ld hl,varf
       cp (hl)
       jp nz,h00891
       ld (ix+0),255
       ld a,94
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,17
       ld (varh),a
h00891 ld a,92
       ld hl,varf
       cp (hl)
       jp nz,h00925
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h00925 ld a,91
       ld hl,varf
       cp (hl)
       jp nz,h00960
       ld a,180
       ld (ix+4),a
       ld a,134
       ld (ix+3),a
h00960 ld a,90
       ld hl,varf
       cp (hl)
       jp nz,h00994
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h00994 ld a,89
       ld hl,varf
       cp (hl)
       jp nz,h01020
       ld a,180
       ld (ix+4),a
h01020 ld a,87
       ld hl,varf
       cp (hl)
       jp nz,h01067
       ld (ix+0),255
       ld a,88
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,16
       ld (varh),a
h01067 ld a,86
       ld hl,varf
       cp (hl)
       jp nz,h01101
       ld a,20
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
h01101 ld a,85
       ld hl,varf
       cp (hl)
       jp nz,h01136
       ld a,100
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
h01136 ld a,84
       ld hl,varf
       cp (hl)
       jp nz,h01170
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h01170 ld a,83
       ld hl,varf
       cp (hl)
       jp nz,h01204
       ld a,20
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
h01204 ld a,82
       ld hl,varf
       cp (hl)
       jp nz,h01230
       ld a,16
       ld (ix+3),a
h01230 ld a,80
       ld hl,varf
       cp (hl)
       jp nz,h01277
       ld (ix+0),255
       ld a,81
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,15
       ld (varh),a
h01277 ld a,79
       ld hl,varf
       cp (hl)
       jp nz,h01312
       ld a,180
       ld (ix+4),a
       ld a,134
       ld (ix+3),a
h01312 ld a,78
       ld hl,varf
       cp (hl)
       jp nz,h01346
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h01346 ld a,77
       ld hl,varf
       cp (hl)
       jp nz,h01380
       ld a,20
       ld (ix+4),a
       ld a,134
       ld (ix+3),a
h01380 ld a,76
       ld hl,varf
       cp (hl)
       jp nz,h01406
       ld a,220
       ld (ix+4),a
h01406 ld a,75
       ld hl,varf
       cp (hl)
       jp nz,h01440
       ld a,20
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
h01440 ld a,73
       ld hl,varf
       cp (hl)
       jp nz,h01487
       ld (ix+0),255
       ld a,74
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,14
       ld (varh),a
h01487 ld a,72
       ld hl,varf
       cp (hl)
       jp nz,h01513
       ld a,16
       ld (ix+3),a
h01513 ld a,71
       ld hl,varf
       cp (hl)
       jp nz,h01547
       ld a,20
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
h01547 ld a,70
       ld hl,varf
       cp (hl)
       jp nz,h01573
       ld a,54
       ld (ix+3),a
h01573 ld a,69
       ld hl,varf
       cp (hl)
       jp nz,h01607
       ld a,180
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
h01607 ld a,67
       ld hl,varf
       cp (hl)
       jp nz,h01654
       ld (ix+0),255
       ld a,68
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,13
       ld (varh),a
h01654 ld a,66
       ld hl,varf
       cp (hl)
       jp nz,h01688
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h01688 ld a,65
       ld hl,varf
       cp (hl)
       jp nz,h01723
       ld a,140
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
h01723 ld a,64
       ld hl,varf
       cp (hl)
       jp nz,h01757
       ld a,60
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
h01757 ld a,63
       ld hl,varf
       cp (hl)
       jp nz,h01791
       ld a,20
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
h01791 ld a,61
       ld hl,varf
       cp (hl)
       jp nz,h01838
       ld (ix+0),255
       ld a,62
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,12
       ld (varh),a
h01838 ld a,60
       ld hl,varf
       cp (hl)
       jp nz,h01872
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h01872 ld a,59
       ld hl,varf
       cp (hl)
       jp nz,h01907
       ld a,60
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
h01907 ld a,58
       ld hl,varf
       cp (hl)
       jp nz,h01932
       ld a,16
       ld (ix+3),a
h01932 ld a,57
       ld hl,varf
       cp (hl)
       jp nz,h01966
       ld a,60
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
h01966 ld a,56
       ld hl,varf
       cp (hl)
       jp nz,h01992
       ld a,16
       ld (ix+3),a
h01992 ld a,54
       ld hl,varf
       cp (hl)
       jp nz,h02039
       ld (ix+0),255
       ld a,1
       ld (varg),a
       ld a,55
       ld (varf),a
       ld a,11
       ld (varh),a
h02039 ld a,53
       ld hl,varf
       cp (hl)
       jp nz,h02073
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h02073 ld a,52
       ld hl,varf
       cp (hl)
       jp nz,h02108
       ld a,100
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
h02108 ld a,51
       ld hl,varf
       cp (hl)
       jp nz,h02133
       ld a,16
       ld (ix+3),a
h02133 ld a,50
       ld hl,varf
       cp (hl)
       jp nz,h02167
       ld a,60
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
h02167 ld a,49
       ld hl,varf
       cp (hl)
       jp nz,h02201
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
h02201 ret

evnt08:	equ $
       xor a
       ld hl,varc
       cp (hl)
       jp nz,i00028
       xor a
       call animsp
i00028 ld a,3
       and $0F
       ld c,a
       call cspr
       ld c,0
       call sktyp
       jp nc,i00104
       ld a,7
       and $0F
       ld c,a
       call cspr
       ld a,4
       call explod
       ld a,3
       ld c,0
       call sfx_set
       ld a,(varf)
       inc a
       ld (varf),a
i00104 ld a,48
       ld hl,varf
       cp (hl)
       jp nz,i00151
       ld (ix+0),255
       ld a,49
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,10
       ld (varh),a
i00151 ld a,47
       ld hl,varf
       cp (hl)
       jp nz,i00186
       ld a,220
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
i00186 ld a,46
       ld hl,varf
       cp (hl)
       jp nz,i00220
       ld a,60
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i00220 ld a,45
       ld hl,varf
       cp (hl)
       jp nz,i00254
       ld a,220
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
i00254 ld a,44
       ld hl,varf
       cp (hl)
       jp nz,i00288
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i00288 ld a,42
       ld hl,varf
       cp (hl)
       jp nz,i00335
       ld (ix+0),255
       ld a,43
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,9
       ld (varh),a
i00335 ld a,41
       ld hl,varf
       cp (hl)
       jp nz,i00369
       ld a,220
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
i00369 ld a,40
       ld hl,varf
       cp (hl)
       jp nz,i00404
       ld a,100
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
i00404 ld a,39
       ld hl,varf
       cp (hl)
       jp nz,i00438
       ld a,140
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i00438 ld a,38
       ld hl,varf
       cp (hl)
       jp nz,i00464
       ld a,20
       ld (ix+4),a
i00464 ld a,36
       ld hl,varf
       cp (hl)
       jp nz,i00511
       ld (ix+0),255
       ld a,37
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,8
       ld (varh),a
i00511 ld a,35
       ld hl,varf
       cp (hl)
       jp nz,i00545
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i00545 ld a,34
       ld hl,varf
       cp (hl)
       jp nz,i00571
       ld a,60
       ld (ix+4),a
i00571 ld a,33
       ld hl,varf
       cp (hl)
       jp nz,i00605
       ld a,140
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
i00605 ld a,32
       ld hl,varf
       cp (hl)
       jp nz,i00639
       ld a,100
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
i00639 ld a,30
       ld hl,varf
       cp (hl)
       jp nz,i00687
       ld (ix+0),255
       ld a,31
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,7
       ld (varh),a
i00687 ld a,29
       ld hl,varf
       cp (hl)
       jp nz,i00721
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i00721 ld a,28
       ld hl,varf
       cp (hl)
       jp nz,i00755
       ld a,60
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
i00755 ld a,27
       ld hl,varf
       cp (hl)
       jp nz,i00789
       ld a,220
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
i00789 ld a,26
       ld hl,varf
       cp (hl)
       jp nz,i00823
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i00823 ld a,24
       ld hl,varf
       cp (hl)
       jp nz,i00871
       ld (ix+0),255
       ld a,25
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,6
       ld (varh),a
i00871 ld a,23
       ld hl,varf
       cp (hl)
       jp nz,i00905
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i00905 ld a,22
       ld hl,varf
       cp (hl)
       jp nz,i00939
       ld a,220
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
i00939 ld a,21
       ld hl,varf
       cp (hl)
       jp nz,i00973
       ld a,20
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
i00973 ld a,19
       ld hl,varf
       cp (hl)
       jp nz,i01020
       ld (ix+0),255
       ld a,20
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,5
       ld (varh),a
i01020 ld a,18
       ld hl,varf
       cp (hl)
       jp nz,i01054
       ld a,60
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
i01054 ld a,17
       ld hl,varf
       cp (hl)
       jp nz,i01089
       ld a,220
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i01089 ld a,1
       ld hl,varf
       cp (hl)
       jp nz,i01122
       ld a,60
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
i01122 ld a,2
       ld hl,varf
       cp (hl)
       jp nz,i01148
       ld a,220
       ld (ix+4),a
i01148 ld a,3
       ld hl,varf
       cp (hl)
       jp nz,i01182
       ld a,20
       ld (ix+4),a
       ld a,16
       ld (ix+3),a
i01182 ld a,4
       ld hl,varf
       cp (hl)
       jp nz,i01228
       ld (ix+0),255
       ld a,1
       ld (varg),a
       ld a,5
       ld (varf),a
       ld a,2
       ld (varh),a
i01228 ld a,6
       ld hl,varf
       cp (hl)
       jp nz,i01263
       ld a,100
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
i01263 ld a,7
       ld hl,varf
       cp (hl)
       jp nz,i01288
       ld a,220
       ld (ix+4),a
i01288 ld a,8
       ld hl,varf
       cp (hl)
       jp nz,i01313
       ld a,20
       ld (ix+4),a
i01313 ld a,9
       ld hl,varf
       cp (hl)
       jp nz,i01360
       ld (ix+0),255
       ld a,10
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,3
       ld (varh),a
i01360 ld a,11
       ld hl,varf
       cp (hl)
       jp nz,i01394
       ld a,20
       ld (ix+4),a
       ld a,54
       ld (ix+3),a
i01394 ld a,12
       ld hl,varf
       cp (hl)
       jp nz,i01429
       ld a,180
       ld (ix+4),a
       ld a,92
       ld (ix+3),a
i01429 ld a,13
       ld hl,varf
       cp (hl)
       jp nz,i01463
       ld a,20
       ld (ix+4),a
       ld a,136
       ld (ix+3),a
i01463 ld a,14
       ld hl,varf
       cp (hl)
       jp nz,i01510
       ld (ix+0),255
       ld a,15
       ld (varf),a
       ld a,1
       ld (varg),a
       ld a,4
       ld (varh),a
i01510 ld a,16
       ld hl,varf
       cp (hl)
       jp nz,i01536
       ld a,20
       ld (ix+4),a
i01536 ret

evnt09:	equ $
       xor a
       cp (ix+0)
       jp nz,j00024
       ld a,20
       ld (ix+4),a
j00024 ld a,1
       cp (ix+0)
       jp nz,j00054
       ld c,4
       ld a,(ix+3)
       add a,c
       ld (ix+3),a
j00054 ld a,2
       cp (ix+0)
       jp nz,j00083
       ld c,4
       ld a,(ix+3)
       add a,c
       ld (ix+3),a
j00083 ld a,3
       cp (ix+0)
       jp nz,j00113
       ld c,2
       ld a,(ix+3)
       add a,c
       ld (ix+3),a
j00113 ld a,4
       cp (ix+0)
       jp nz,j00142
       ld c,4
       ld a,(ix+3)
       add a,c
       ld (ix+3),a
j00142 ret

evnt10:	equ $
       xor a
       ld (charx),a
       ld a,7
       ld (chary),a
       ld a,(varh)
       call disply
       xor a
       ld (charx),a
       ld a,30
       ld (chary),a
       ld a,2
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,(numlif)
       call disply
       ret

evnt11:	equ $
       ld a,2
       ld hl,varc
       cp (hl)
       jp nz,l00032
       xor a
       ld (varc),a
       jp l00045
l00032 ld a,(varc)
       inc a
       ld (varc),a
l00045 xor a
       ld hl,varb
       cp (hl)
       jp nz,l00066
       jp l00079
l00066 ld a,(varb)
       dec a
       ld (varb),a
l00079 ld a,20
       ld hl,scno
       cp (hl)
       jp nz,l00313
       ld a,10
       ld (charx),a
       ld a,5
       ld (chary),a
       ld a,5
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,11
       call dmsg
       ld a,12
       ld (charx),a
       ld a,10
       ld (chary),a
       ld a,12
       call dmsg
       ld a,3
       ld d,a
       call random
       ld h,a
       call imul
       ld a,h
       ld (varrnd),a
       ld a,(varrnd)
       inc a
       ld (varrnd),a
       ld a,7
       ld (charx),a
       ld a,9
       ld (chary),a
       ld a,(varrnd)
       ld (chary),a
       ld a,10
       call dmsg
       xor a
       ld hl,varb
       cp (hl)
       jp nz,l00313
       ld hl,gamwon
       ld (hl),h
l00313 ret

evnt12:	equ $
       ld a,1
       ld (MSX_BDRCLR),a
       ld b,a
       ld c,7
       call MSX_WRTVDP
       ld a,4
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       call cls
       ld a,3
       ld (charx),a
       ld a,11
       ld (chary),a
       ld a,6
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,1
       ld (MSX_BDRCLR),a
       ld b,a
       ld c,7
       call MSX_WRTVDP
       ld a,1
       call dmsg
       ld a,5
       ld (charx),a
       ld a,8
       ld (chary),a
       ld a,5
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,5
       call dmsg
       ld a,8
       ld (charx),a
       ld a,4
       ld (chary),a
       ld a,3
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,6
       call dmsg
       ld a,9
       ld (charx),a
       ld a,4
       ld (chary),a
       ld a,7
       call dmsg
       ld a,10
       ld (charx),a
       ld a,4
       ld (chary),a
       ld a,8
       call dmsg
       ld a,19
       ld (charx),a
       ld a,5
       ld (chary),a
       ld a,2
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,9
       call dmsg
       ld a,1
       ld (MSX_BDRCLR),a
       ld b,a
       ld c,7
       call MSX_WRTVDP
       ld a,99
       ld (contrl),a
m00549 ld a,99
       ld hl,contrl
       cp (hl)
       jp nz,m00703
       ld hl,keys+14
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,m00602
       xor a
       ld (contrl),a
m00602 ld hl,keys+16
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,m00637
       ld a,1
       ld (contrl),a
m00637 ld hl,keys+18
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,m00672
       ld a,2
       ld (contrl),a
m00672 ld hl,keys+20
       ld a,(hl)
       inc hl
       ld d,(hl)
       call ktest
       jp c,m00699
m00699 jp m00549
m00703 ld a,3
       ld (MSX_BDRCLR),a
       ld b,a
       ld c,7
       call MSX_WRTVDP
       ret

evnt13:	equ $
       ld a,3
       ld (numlif),a
       ld a,15
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       ld a,8
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       xor a
       ld (MSX_BDRCLR),a
       ld b,a
       ld c,7
       call MSX_WRTVDP
       call cls
       ld a,24
       ld (vara),a
       xor a
       ld (varb),a
       xor a
       ld (varc),a
       xor a
       ld (vard),a
       xor a
       ld (vare),a
       xor a
       ld (varf),a
       xor a
       ld (varg),a
       ld a,1
       ld (varh),a
       xor a
       ld (vari),a
       xor a
       ld (varj),a
       xor a
       ld (vark),a
       xor a
       ld (varl),a
       xor a
       ld (varm),a
       ret

evnt14:	equ $
       call sfx_mute
       xor a
       ld (MSX_BDRCLR),a
       ld b,a
       ld c,7
       call MSX_WRTVDP
       ld a,7
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       call cls
       xor a
       ld (vara),a
       xor a
       ld (varg),a
       xor a
       ld (vard),a
       xor a
       ld (varj),a
       xor a
       ld (vark),a
       ld a,114
       ld hl,varf
       cp (hl)
       jp nz,o00160
       jp o00423
o00160 xor a
       ld (charx),a
       ld a,1
       ld (chary),a
       ld a,2
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,3
       call dmsg
       xor a
       ld (charx),a
       ld a,12
       ld (chary),a
       ld a,3
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,1
       call dmsg
       xor a
       ld (charx),a
       ld a,24
       ld (chary),a
       ld a,2
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,4
       call dmsg
o00423 ret

evnt15:	equ $
       xor a
       cp (ix+0)
       jp nz,p00025
       ld hl,deadf
       ld (hl),h
p00025 ret

evnt16:	equ $
       ld a,(numlif)
       dec a
       ld (numlif),a
       ld (ix+0),255
       xor a
       ld (varg),a
       call cls
       ret

evnt17:	equ $
       ld a,10
       ld (charx),a
       ld a,12
       ld (chary),a
       ld a,2
       ld (MSX_BDRCLR),a
       ld b,a
       ld c,7
       call MSX_WRTVDP
       call cls
       ld a,4
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       xor a
       call dmsg
       ld a,12
       ld (charx),a
       ld a,4
       ld (chary),a
       ld a,3
       add a,a
       add a,a
       add a,a
       add a,a
       ld e,a
       ld a,(clratt)
       and $0F
       or e
       ld (clratt),a
       xor a
       ld e,a
       ld a,(clratt)
       and $F0
       or e
       ld (clratt),a
       ld a,13
       call dmsg
       call prskey
       ret

evnt18:	equ $
       push ix
       ld b,50
       call delay
       pop ix
       ret

evnt19:	equ $
       ret

evnt20:	equ $
       ret
ptcusr ret
msgdat:	equ $
       db "GAME OVER",141
       db "BALDY ZX",141
       db "-NEXT LEVEL-",141
       db "LEVEL:",141
       db "LIVES:",141
       db "SELECT CONTROL",141
       db "1.............KEYBOARD",141
       db "2....KEMPSTON JOYSTICK",141
       db "3....SINCLAIR JOYSTICK",141
       db ";PAUL JENKINSON 2015",141
       db "CONGRATULATIONS",141
       db "BALDY HAS COLLECTED ALL",141
       db "OF HIS GAMES",141
       db "BALDY IS IN NEED OF WINE!",141
nummsg db 14
scdat:	equ $
       defw 83,72,72,57,62,58,52,60,53,101,56,43,60,70,50,65,48,49,41,37,21
       db 30,0,172,0,6,183,0,97,24,31,8,31,143,5,7,135,14,1,1,2,163,4,19,208,14,3,5,123,4,159,4,189
       db 139,181,134,0,224,139,31,9,31,222,19,181,134,199,149,19,255,127,149,222,154,125,134,159,253,154,188,149,19,254,154,215
       db 211,149,212,0,239,159,235,14,134,92,149,107,1,167,149,255,255,255,254,26,0,187,13,0,31,8,31,80,9,10,11,124
       db 12,4,17,213,135,9,13,14,15,185,4,171,227,139,9,159,9,16,105,9,24,111,139,205,149,17,253,181,149,47,129,144
       db 78,169,24,220,129,189,144,222,149,251,154,231,10,16,165,14,134,191,63,149,11,239,149,255,255,255,252,26,0,187,13,0
       db 31,8,31,80,14,20,21,124,22,4,26,191,9,135,14,23,24,25,185,4,171,176,139,31,9,31,222,19,211,14,239,139
       db 239,9,85,58,149,124,154,254,144,242,14,124,223,45,144,14,253,62,149,154,254,9,219,0,239,139,237,9,92,149,255,255
       db 255,255,192,58,0,170,8,0,31,8,31,4,18,18,251,9,88,0,27,28,123,29,155,4,235,113,0,134,62,4,9,139
       db 55,47,9,24,247,8,149,134,221,155,171,24,253,195,149,227,129,225,149,9,171,245,193,255,255,255,255,128,26,0,170,13
       db 0,31,8,31,216,14,32,33,123,34,131,4,35,36,37,209,4,30,233,14,255,209,144,4,9,31,253,14,191,159,149,106
       db 144,253,149,123,144,155,159,169,149,174,106,159,237,0,223,144,222,14,185,149,247,4,255,255,255,254,31,0,188,0,31,49
       db 8,31,5,18,174,112,19,0,38,39,40,247,7,4,41,42,43,185,4,254,139,149,9,129,251,159,187,19,14,253,111,149
       db 190,144,159,122,18,127,14,237,149,110,144,223,14,185,149,255,255,255,255,128,31,0,188,0,31,61,8,31,193,14,44,45
       db 46,238,111,4,172,0,31,60,9,31,139,62,6,6,14,251,159,253,203,149,124,123,139,190,154,19,255,123,149,219,144,243
       db 19,247,63,149,255,255,255,240,58,0,170,13,0,31,8,31,216,19,47,48,124,49,4,50,212,9,251,4,125,206,0,124
       db 143,4,9,31,227,159,191,19,143,134,119,14,149,124,252,139,62,14,255,89,171,248,139,221,191,14,150,161,50,235,31,149
       db 255,255,255,248,31,0,188,0,31,55,8,31,143,14,18,18,65,24,51,52,53,238,111,4,172,0,31,55,9,31,175,154
       db 149,175,144,24,247,190,149,129,254,144,239,0,245,175,149,129,115,14,247,63,149,255,255,255,240,58,0,187,12,0,31,8
       db 31,5,106,6,112,9,0,54,55,56,244,4,122,50,7,14,65,64,65,0,119,5,3,151,8,0,45,19,64,10,95,131
       db 144,31,9,227,139,78,9,19,239,124,115,4,195,129,67,139,227,150,107,15,14,93,67,144,217,166,239,19,89,166,235,4
       db 123,81,166,180,3,149,26,65,191,61,171,124,235,126,14,206,171,221,123,5,225,149,223,3,31,154,255,255,255,248,58,0
       db 255,15,0,31,8,31,7,9,32,33,34,184,4,57,61,58,59,205,4,119,13,134,155,14,9,252,149,53,58,252,149,56
       db 144,227,134,248,159,255,217,171,214,144,23,18,0,106,14,252,149,127,255,255,255,224,27,0,186,8,0,31,8,31,4,60
       db 61,123,62,139,4,63,0,220,4,255,237,124,217,24,9,254,245,149,124,238,126,159,253,149,253,159,174,167,149,255,255,255
       db 254,58,0,187,13,0,31,8,31,80,19,66,67,123,68,154,4,171,61,0,72,224,139,69,70,98,71,9,9,9,239,14
       db 119,141,149,251,0,240,139,211,14,227,174,221,227,149,249,181,244,139,57,181,251,19,253,143,149,255,255,255,252,58,0,187
       db 13,0,31,8,31,80,19,73,74,123,75,155,4,179,0,64,251,127,253,131,149,9,31,248,159,223,225,149,65,246,127,235
       db 207,166,27,159,127,19,199,149,243,151,187,226,166,69,55,30,71,191,19,135,139,1,224,149,65,244,166,91,59,223,83,255
       db 255,255,248,31,0,188,0,31,61,8,31,193,29,76,77,78,238,111,4,172,0,31,61,9,31,207,174,223,181,149,135,129
       db 69,70,71,157,4,14,223,174,255,91,149,129,183,14,238,127,149,255,255,255,224,26,0,187,8,0,31,8,31,4,82,83
       db 121,84,9,160,0,79,80,81,247,7,4,3,5,4,185,4,255,222,139,30,9,9,31,95,14,9,255,107,149,15,139,82
       db 83,84,62,14,174,255,91,149,183,0,59,139,154,239,19,246,149,255,255,255,255,192,58,0,170,13,0,31,8,31,216,24
       db 85,86,123,85,155,4,254,13,0,31,9,31,216,169,253,248,149,27,82,83,84,179,171,196,169,124,50,213,252,171,127,250
       db 193,255,255,255,255,192,58,0,170,13,0,31,8,31,216,14,51,48,111,49,126,4,123,19,236,0,31,122,9,31,149,199
       db 159,190,195,149,9,251,18,253,103,171,159,151,88,164,249,161,245,199,171,255,255,255,255,59,0,235,15,0,87,88,87,237
       db 4,207,24,117,6,0,31,9,31,236,149,107,199,164,186,135,134,231,24,239,207,171,171,26,149,248,171,255,255,255,255,224
       db 27,0,235,13,0,90,89,90,219,4,65,0,91,92,91,187,127,4,223,0,255,126,154,187,126,144,221,149,4,235,119,149
       db 4,255,255,255,254,63,87,160,0,93,94,0,245,47,0,27,255,219,29,246,185,255,255,255,255,240
numsc  db 21
chgfx:	equ $
       db 0,0,0,0,0,0,0,0,241,241,241,241,241,241,241,241
       db 0,175,191,0,183,181,0,91,129,129,129,129,129,129,129,129
       db 0,253,189,0,211,219,0,246,97,97,97,97,97,97,97,97
       db 87,0,23,23,0,0,0,0,97,97,97,97,97,97,97,97
       db 250,0,212,212,0,0,0,0,97,97,97,97,97,97,97,97
       db 247,0,239,239,0,0,0,0,97,97,97,97,97,97,97,97
       db 0,0,0,0,0,0,0,0,129,129,129,129,129,129,129,129
       db 0,0,0,0,0,0,0,0,177,177,177,177,177,177,177,177
       db 0,0,0,0,0,0,0,170,241,241,241,241,241,241,241,241
       db 0,0,0,0,0,0,0,170,241,241,241,241,241,241,241,241
       db 0,255,165,231,165,231,165,255,33,33,33,33,33,33,33,33
       db 0,223,223,181,191,177,191,181,33,33,33,33,33,33,33,33
       db 0,255,251,245,245,59,223,223,193,193,193,193,193,193,193,193
       db 0,127,49,31,0,0,0,0,193,193,193,193,193,193,193,193
       db 0,253,195,223,0,0,0,0,193,193,193,193,193,193,193,193
       db 0,222,140,136,0,0,0,0,193,193,193,193,193,193,193,193
       db 0,0,0,0,0,0,0,0,18,18,18,18,18,18,18,18
       db 0,223,193,253,165,228,167,255,33,33,33,33,33,33,33,33
       db 0,0,0,0,0,0,0,0,97,97,97,97,97,97,97,97
       db 0,239,235,0,253,237,0,191,97,97,97,97,97,97,97,97
       db 0,125,187,188,81,43,21,29,113,113,113,113,113,113,113,113
       db 0,246,181,111,143,70,216,181,113,113,113,113,113,113,113,113
       db 0,242,85,47,15,70,240,184,113,113,113,113,113,113,113,113
       db 8,3,2,1,0,0,0,0,113,113,113,113,113,113,113,113
       db 186,48,0,0,0,0,0,0,113,113,113,113,113,113,113,113
       db 240,96,0,0,0,0,0,0,113,113,113,113,113,113,113,113
       db 0,247,111,109,143,70,216,181,113,113,113,113,113,113,113,113
       db 0,222,218,76,49,61,24,0,209,209,209,209,209,209,209,209
       db 0,247,215,99,156,239,198,56,209,209,209,209,209,209,209,209
       db 0,223,93,142,112,118,44,0,209,209,209,209,209,209,209,209
       db 60,90,90,126,44,0,52,24,225,225,225,225,225,225,225,225
       db 0,0,0,0,0,0,0,170,241,241,241,241,241,241,241,241
       db 0,213,122,213,171,101,188,104,33,33,33,33,33,33,33,33
       db 0,106,191,117,174,85,170,5,33,33,33,33,33,33,33,33
       db 0,174,117,174,117,170,85,160,193,193,193,193,193,193,193,193
       db 14,237,167,216,21,10,1,0,129,129,129,129,129,129,129,129
       db 113,119,165,90,21,170,145,0,129,129,129,129,129,129,129,129
       db 6,234,164,90,52,168,0,0,129,129,129,129,129,129,129,129
       db 0,255,255,0,118,118,6,22,81,81,81,81,81,81,81,81
       db 0,255,255,0,222,222,0,123,81,81,81,81,81,81,81,81
       db 0,255,255,0,222,222,0,246,65,65,65,65,65,65,65,65
       db 6,0,0,0,0,0,0,0,65,65,65,65,65,65,65,65
       db 123,120,120,0,0,0,0,0,65,65,65,65,65,65,65,65
       db 246,6,0,0,0,0,0,0,65,65,65,65,65,65,65,65
       db 0,222,222,222,0,189,189,189,97,97,97,97,97,97,97,97
       db 0,247,247,247,0,253,253,253,129,129,129,129,129,129,129,129
       db 0,247,247,247,0,221,221,221,97,97,97,97,97,97,97,97
       db 0,111,165,66,24,53,25,3,33,33,33,33,33,33,33,33
       db 0,111,165,66,24,53,153,195,113,113,113,113,113,113,113,113
       db 0,111,165,66,24,52,152,192,113,113,113,113,113,113,113,113
       db 0,111,181,254,54,164,4,32,129,129,129,129,129,129,129,129
       db 0,189,189,89,32,14,23,11,225,225,225,225,225,225,225,225
       db 0,173,239,231,200,158,54,92,241,241,241,241,241,241,241,241
       db 0,215,222,140,32,92,116,120,225,225,225,225,225,225,225,225
       db 0,255,255,169,175,169,255,255,193,193,193,193,193,193,193,193
       db 0,255,215,131,131,131,215,255,33,33,33,33,33,33,33,33
       db 0,255,165,191,161,161,191,255,193,193,193,193,193,193,193,193
       db 6,214,209,44,0,0,0,0,97,97,97,97,97,97,97,97
       db 208,214,38,1,0,0,0,0,129,129,129,129,129,129,129,129
       db 218,218,4,64,0,0,0,0,97,97,97,97,97,97,97,97
       db 0,255,0,85,74,85,74,85,65,65,65,65,65,65,65,65
       db 0,255,0,61,188,65,170,85,81,81,81,81,81,81,81,81
       db 0,255,0,82,170,82,170,82,65,65,65,65,65,65,65,65
       db 0,255,0,0,0,0,0,0,81,81,81,81,81,81,81,81
       db 68,32,68,64,0,0,0,0,241,241,241,241,241,241,241,241
       db 40,4,36,0,4,0,0,0,177,177,177,177,177,177,177,177
       db 0,255,0,111,111,55,27,13,113,113,113,113,113,113,113,113
       db 0,255,0,232,244,232,244,232,113,113,113,113,113,113,113,113
       db 0,255,0,94,190,92,188,88,161,161,161,161,161,161,161,161
       db 255,152,170,168,170,154,255,0,129,129,129,129,129,129,129,129
       db 255,136,171,170,170,168,255,0,129,129,129,129,129,129,129,129
       db 255,147,181,147,181,149,255,0,97,97,97,97,97,97,97,97
       db 0,8,0,8,42,8,42,42,241,241,241,241,241,241,241,241
       db 0,246,246,6,174,174,32,0,161,161,161,161,161,161,161,161
       db 0,221,221,0,247,247,3,0,177,177,177,177,177,177,177,177
       db 0,111,111,99,11,120,123,3,225,225,225,225,225,225,225,225
       db 96,147,148,100,3,8,20,8,33,33,33,33,33,33,33,33
       db 24,36,165,153,64,164,74,4,177,177,177,177,177,177,177,177
       db 6,201,41,38,200,20,8,0,113,113,113,113,113,113,113,113
       db 0,255,0,183,170,157,174,4,209,209,209,209,209,209,209,209
       db 0,255,0,119,187,85,238,68,209,209,209,209,209,209,209,209
       db 0,255,0,117,169,93,237,68,209,209,209,209,209,209,209,209
       db 0,0,16,25,141,77,38,22,241,241,241,241,241,241,241,241
       db 4,128,148,133,147,214,206,220,177,177,177,177,177,177,177,177
       db 8,0,16,50,36,101,234,212,225,225,225,225,225,225,225,225
       db 0,218,85,109,42,41,68,4,97,97,97,97,97,97,97,97
       db 0,154,81,77,21,84,4,16,129,129,129,129,129,129,129,129
       db 0,255,0,102,102,102,0,255,161,161,161,161,161,161,161,161
       db 0,255,0,126,126,126,0,255,177,177,177,177,177,177,177,177
       db 0,133,86,187,237,183,93,10,81,81,81,81,81,81,81,81
       db 0,162,213,106,221,115,88,160,65,65,65,65,65,65,65,65
       db 6,213,108,8,0,0,0,0,241,241,241,241,241,241,241,241
       db 208,106,181,40,8,0,0,0,225,225,225,225,225,225,225,225
       db 94,157,94,77,86,89,92,94,113,113,113,113,113,113,113,113
       db 30,14,14,38,26,45,30,46,241,241,241,241,241,241,241,241
bprop  equ $
       db 0
       db 2
       db 2
       db 0
       db 0
       db 0
       db 0
       db 0
       db 5
       db 6
       db 2
       db 2
       db 2
       db 0
       db 0
       db 0
       db 0
       db 0
       db 0
       db 0
       db 2
       db 2
       db 2
       db 0
       db 0
       db 0
       db 2
       db 1
       db 1
       db 1
       db 0
       db 0
       db 1
       db 1
       db 1
       db 0
       db 0
       db 0
       db 1
       db 1
       db 1
       db 0
       db 0
       db 0
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 0
       db 0
       db 0
       db 1
       db 1
       db 1
       db 0
       db 0
       db 0
       db 1
       db 1
       db 1
       db 0
       db 0
       db 0
       db 0
       db 1
       db 0
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 0
       db 0
       db 0
       db 1
       db 1
       db 1
       db 1
       db 1
       db 1
       db 0
       db 0
       db 0
       db 0
sprgfx:	equ $
       db 15,30,3,7,30,15,0,30,53,43,29,24,37,88,60,116,192,160,96,224,32,192,0,208,224,232,220,8,224,192,184,116
       db 15,30,3,7,30,15,0,62,93,235,65,0,237,232,168,192,192,160,96,224,32,194,7,218,236,224,192,48,251,119,10,28
       db 3,5,6,7,4,3,0,11,7,23,59,16,7,3,29,46,240,120,192,224,120,240,0,120,172,212,184,24,164,26,60,46
       db 3,5,6,7,4,67,224,91,55,7,3,12,223,238,80,56,240,120,192,224,120,240,0,124,186,215,130,0,183,23,21,3
       db 5,15,14,15,183,219,76,218,0,0,0,0,0,0,0,0,160,240,112,240,237,219,50,91,0,0,0,0,0,0,0,0
       db 0,0,0,0,0,0,0,0,0,0,0,0,8,255,8,0,0,0,0,0,0,0,0,0,0,0,0,4,2,253,2,4
       db 0,0,0,0,0,0,0,0,0,0,0,0,248,15,248,0,0,0,0,0,0,0,0,0,0,0,0,0,6,253,6,0
       db 0,0,0,0,0,0,0,0,0,0,0,240,8,15,8,240,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,0
       db 0,0,0,0,0,0,0,0,0,0,0,0,248,15,248,0,0,0,0,0,0,0,0,0,0,0,0,0,6,253,6,0
       db 0,0,0,0,0,0,127,231,195,231,255,128,191,182,63,0,0,0,0,0,0,0,254,231,195,231,255,1,253,109,252,0
       db 0,0,0,0,0,0,29,43,42,43,43,42,42,42,42,0,0,0,0,0,0,0,240,88,72,88,248,8,232,168,232,0
       db 0,0,0,0,0,0,1,3,3,3,3,0,3,3,3,0,0,0,0,0,0,0,128,64,192,192,192,0,192,192,192,0
       db 0,0,0,0,0,0,31,53,36,53,63,32,46,42,46,0,0,0,0,0,0,0,112,168,168,168,168,168,168,168,168,0
       db 0,0,0,0,0,0,0,0,0,224,177,83,173,83,177,224,0,0,0,0,0,0,0,0,0,0,240,88,85,88,240,0
       db 0,0,0,0,0,0,0,0,0,1,243,86,170,86,243,1,0,0,0,0,0,0,0,0,0,224,240,184,170,184,240,224
       db 0,0,0,0,0,0,0,0,0,1,3,5,253,5,3,1,0,0,0,0,0,0,0,0,0,224,240,120,108,120,240,224
       db 0,0,0,0,0,0,0,0,0,0,241,83,173,83,241,0,0,0,0,0,0,0,0,0,0,0,240,88,85,88,240,0
       db 0,0,0,0,0,0,0,0,0,0,0,31,32,223,63,31,0,0,0,0,0,0,0,0,0,0,0,135,205,186,205,135
       db 0,0,0,0,0,0,0,0,0,0,0,31,63,255,63,31,0,0,0,0,0,0,0,0,0,0,0,128,207,186,207,128
       db 0,0,0,0,0,0,0,0,0,0,0,31,63,223,32,31,0,0,0,0,0,0,0,0,0,0,0,128,192,191,192,128
       db 0,0,0,0,0,0,0,0,0,0,0,31,63,192,63,31,0,0,0,0,0,0,0,0,0,0,0,128,207,186,207,128
       db 0,0,0,0,0,0,0,0,0,0,0,0,0,32,79,32,0,0,0,0,0,0,0,0,0,0,0,0,0,6,248,6
       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,240,12
       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,224,24
       db 0,0,0,0,0,0,0,0,0,0,0,0,0,32,79,32,0,0,0,0,0,0,0,0,0,0,0,0,0,12,240,12
       db 3,29,114,110,64,9,29,45,125,0,15,22,46,14,0,27,128,112,156,236,4,0,0,64,0,64,128,0,0,0,0,0
       db 3,29,114,110,64,9,29,45,125,0,15,22,39,3,0,6,128,112,156,236,4,0,0,64,0,64,128,0,0,0,64,128
       db 3,29,114,110,64,9,29,45,125,0,15,22,46,14,0,27,128,112,156,236,4,0,0,64,0,64,128,0,0,0,0,0
       db 3,29,114,110,64,9,29,45,125,0,15,54,12,24,64,44,128,112,156,236,4,0,0,64,0,64,128,0,0,0,0,0
       db 0,0,0,0,0,0,0,0,0,55,109,0,222,0,122,45,0,0,0,0,0,0,0,0,0,116,174,0,219,0,238,188
       db 0,0,0,0,0,0,0,0,55,109,0,183,222,0,122,45,0,0,0,0,0,0,0,0,116,174,0,119,219,0,238,188
       db 0,0,0,0,0,0,0,0,55,109,0,183,222,0,122,45,0,0,0,0,0,0,0,0,116,174,0,119,219,0,238,188
       db 0,0,0,0,0,0,0,0,0,55,109,0,222,0,122,45,0,0,0,0,0,0,0,0,0,116,174,0,219,0,238,188
       db 3,15,24,48,50,56,63,62,30,15,2,0,4,6,7,3,224,248,140,130,164,138,116,42,52,232,160,0,16,176,240,224
       db 3,15,24,49,48,56,63,62,30,15,2,4,6,7,3,0,224,248,140,194,132,138,116,42,52,232,160,16,176,240,224,0
       db 3,15,24,52,48,56,63,62,30,15,6,6,7,3,0,0,224,248,140,146,132,138,116,42,52,232,176,176,240,224,0,0
       db 3,15,24,48,52,56,63,62,30,15,2,4,6,7,3,0,224,248,140,130,148,138,116,42,52,232,160,16,176,240,224,0
       db 0,12,82,33,81,0,0,0,15,15,15,15,15,0,7,0,0,0,24,36,78,132,128,0,232,232,232,232,232,0,208,0
       db 0,0,22,9,21,0,0,0,15,15,15,15,15,0,7,0,0,0,0,48,120,144,128,0,248,248,248,248,248,0,240,0
       db 0,0,6,3,5,0,0,0,11,11,11,11,11,0,5,0,0,0,128,160,96,192,128,0,248,248,248,248,248,0,240,0
       db 0,0,2,13,21,0,0,0,15,15,15,15,15,0,7,0,0,0,32,80,120,144,128,0,120,120,120,120,120,0,112,0
       db 120,120,120,123,123,61,30,0,31,0,15,15,15,15,7,3,30,30,30,222,222,188,120,0,232,0,208,208,208,208,160,64
       db 30,30,30,30,30,30,14,0,31,0,15,15,15,15,7,3,120,120,56,216,216,184,112,0,232,0,208,208,208,208,160,64
       db 3,3,3,3,3,3,3,0,31,0,15,15,15,15,7,3,192,192,192,192,192,192,192,0,232,0,208,208,208,208,160,64
       db 30,30,28,27,27,29,14,0,31,0,15,15,15,15,7,3,120,120,120,120,120,120,112,0,232,0,208,208,208,208,160,64
       db 16,48,81,83,240,240,157,144,240,113,85,51,18,0,0,0,0,248,116,240,0,96,224,96,224,192,128,0,0,0,0,0
       db 16,48,81,83,240,240,157,144,240,113,85,51,18,0,0,0,0,244,120,240,0,96,224,96,224,192,128,0,0,0,0,0
       db 16,48,81,83,240,240,157,144,240,113,85,51,18,0,0,0,0,240,112,252,0,96,224,96,224,192,128,0,0,0,0,0
       db 16,48,81,83,240,240,157,144,240,113,85,51,18,0,0,0,0,240,124,240,0,96,224,96,224,192,128,0,0,0,0,0
       db 7,9,11,14,8,70,225,90,55,7,3,12,223,238,80,56,224,176,144,112,16,98,135,90,236,224,192,48,251,119,10,28
       db 7,9,11,14,8,6,1,90,247,75,3,4,15,14,112,62,224,144,208,112,16,98,135,90,236,224,195,59,251,119,2,0
       db 7,9,13,15,8,71,225,90,55,7,3,12,223,238,80,56,224,176,144,240,16,226,135,90,236,224,192,48,251,119,10,28
       db 7,9,13,15,8,70,225,90,55,7,131,204,223,238,0,0,224,144,176,240,16,96,128,90,239,242,192,32,240,118,14,62
       db 0,0,0,1,0,1,2,7,0,3,4,11,0,0,0,0,0,0,16,239,16,208,208,216,24,216,24,224,0,216,48,96
       db 0,0,0,0,0,1,2,7,0,3,4,11,0,0,0,0,0,0,16,108,16,208,208,216,24,216,24,224,0,216,24,48
       db 0,0,0,0,0,1,2,7,0,3,4,11,0,0,0,0,0,0,16,16,16,208,208,216,24,216,24,224,0,216,28,8
       db 0,0,0,0,0,1,2,7,0,3,4,11,0,0,0,0,0,0,16,108,16,208,208,216,24,216,24,224,0,216,24,48
frmlst equ $
       db 0,1
       db 1,1
       db 2,1
       db 3,1
       db 4,1
       db 5,4
       db 9,4
       db 13,4
       db 17,4
       db 21,4
       db 25,4
       db 29,4
       db 33,4
       db 37,4
       db 41,4
       db 45,4
       db 49,4
       db 53,4,57,0
nmedat db 0,0,15,16,16,1,5,15,80,16,8,6,15,136,16,255
       db 0,0,15,16,16,2,5,15,40,120,1,5,15,120,24,8,6,15,96,136,255
       db 0,0,15,16,16,2,7,15,48,64,1,5,15,80,192,8,6,15,136,216,255
       db 0,0,15,16,16,8,6,15,136,216,2,7,15,40,40,1,5,15,80,112,3,8,15,120,184,255
       db 0,0,15,16,16,8,6,15,16,216,3,8,15,8,192,1,7,15,120,48,4,9,15,80,120,255
       db 0,0,15,16,16,8,6,15,16,96,5,10,15,24,120,1,11,15,128,104,255
       db 0,0,15,16,16,8,6,15,136,216,3,8,15,8,208,1,11,15,120,80,5,12,15,48,120,255
       db 0,0,15,16,16,8,6,15,136,216,5,13,15,8,120,5,13,15,56,80,255
       db 0,0,15,16,16,4,8,15,8,232,3,8,15,128,112,1,5,15,40,96,8,6,15,16,176,255
       db 0,0,15,16,16,7,6,15,136,216,5,13,15,48,80,6,7,15,120,16,5,10,15,72,160,255
       db 0,0,15,16,16,5,14,15,48,120,5,14,15,64,160,3,17,15,120,120,1,5,15,40,24,7,6,15,136,216,255
       db 0,0,15,16,16,5,10,15,16,160,7,6,15,136,216,4,15,15,88,144,255
       db 0,0,15,16,16,5,13,15,16,120,1,5,15,80,104,3,8,15,88,184,7,6,15,136,176,255
       db 0,0,15,16,16,7,6,15,136,16,5,12,15,64,80,1,11,15,40,16,3,11,15,80,184,255
       db 0,0,15,16,16,7,6,15,136,224,5,10,15,48,80,3,17,15,128,160,4,8,15,40,120,255
       db 0,0,15,16,16,7,6,15,136,16,6,11,15,48,32,2,5,15,40,152,3,8,15,88,152,255
       db 0,0,15,16,16,7,6,15,136,216,6,11,15,48,72,5,14,15,16,120,6,7,15,128,152,3,17,15,80,144,255
       db 0,0,15,16,16,7,6,15,136,144,3,17,15,40,160,1,7,15,88,40,3,17,15,120,64,255
       db 0,0,15,16,16,7,6,15,136,64,3,8,15,120,144,3,8,15,128,40,1,11,15,88,56,255
       db 0,0,15,16,16,3,8,15,48,200,2,5,15,40,40,3,9,15,80,120,7,6,15,136,24,3,17,15,128,152,3,11,15,128,72,255
       db 4,6,15,48,32,4,6,15,48,208,4,13,15,136,32,4,13,15,136,208,255,255
NUMOBJ equ 40
objdta:	equ $
       db 0,16,176,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 0,56,96,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 0,96,136,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 1,56,136,0,0,0,0,0,0,0,0,0,0,0,0,66,231,231,66,0,0,0,0,0,0,0,0,0,189,60,189,60,189,60,189,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 1,96,96,0,0,0,0,0,0,0,0,0,0,0,0,66,231,231,66,0,0,0,0,0,0,0,0,0,189,60,189,60,189,60,189,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 1,136,136,0,0,0,0,0,0,0,0,0,0,0,0,66,231,231,66,0,0,0,0,0,0,0,0,0,189,60,189,60,189,60,189,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 2,16,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,16,16,84,84,68,40,41,170,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 2,56,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,16,16,84,84,68,40,41,170,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 2,136,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,16,16,84,84,68,40,41,170,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 3,16,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,130,68,40,146,85,186,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 3,96,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,130,68,40,146,85,186,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 3,136,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,130,68,40,146,85,186,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 4,16,136,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 4,56,96,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 4,96,176,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 5,16,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,130,68,40,146,85,186,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 5,56,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,130,68,40,146,85,186,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 5,96,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,130,68,40,146,85,186,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 6,56,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,56,56,56,56,186,215,238,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 6,96,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,56,56,56,56,186,215,238,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 6,136,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,56,56,56,56,186,215,238,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 7,16,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,73,73,127,54,62,20,42,28,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 7,96,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,73,73,127,54,62,20,42,28,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 7,136,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,73,73,127,54,62,20,42,28,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 8,16,136,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 8,56,136,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 8,96,96,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 9,16,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,16,16,84,84,68,40,41,170,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 9,96,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,16,16,84,84,68,40,41,170,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 10,136,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,130,68,40,146,85,186,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 10,136,96,0,0,0,0,0,4,4,2,0,0,0,0,0,4,68,68,2,3,1,1,0,4,3,1,100,108,173,194,246,236,21,187,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 12,56,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 12,136,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 13,136,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 14,96,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 14,96,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 15,16,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 15,96,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 15,136,136,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
       db 16,96,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241
palett:	equ $
       defw $0,$0,$611,$733,$117,$327,$151,$627,$171,$373,$661,$664,$411,$265,$555,$777
font:	equ $
       db 0,0,0,0,0,0,0,0
       db 0,48,48,48,48,0,48,0
       db 0,108,108,0,0,0,0,0
       db 0,108,254,108,108,254,108,0
       db 0,24,126,120,126,30,126,24
       db 0,230,236,24,48,110,206,0
       db 0,48,120,48,126,204,126,0
       db 0,24,48,0,0,0,0,0
       db 0,12,24,24,24,24,12,0
       db 0,96,48,48,48,48,96,0
       db 0,0,60,24,126,24,60,0
       db 0,0,24,24,126,24,24,0
       db 0,0,0,0,0,24,24,48
       db 0,0,0,24,36,24,0,0
       db 0,0,0,0,0,56,56,0
       db 0,0,6,12,24,48,96,0
       db 0,124,238,238,238,238,124,0
       db 0,56,60,28,28,126,126,0
       db 0,124,254,30,248,246,254,0
       db 0,124,222,60,30,254,124,0
       db 0,28,60,124,220,254,60,0
       db 0,254,246,248,62,222,124,0
       db 0,124,236,242,254,238,124,0
       db 0,254,254,14,60,120,120,0
       db 0,124,238,124,238,238,124,0
       db 0,124,254,246,222,62,124,0
       db 0,0,48,48,0,48,48,0
       db 0,124,130,186,162,186,130,124
       db 0,0,12,24,48,24,12,0
       db 0,0,0,126,0,126,0,0
       db 0,0,48,24,12,24,48,0
       db 0,124,198,12,24,0,24,0
       db 0,124,222,254,254,192,124,0
       db 0,124,238,254,238,238,108,0
       db 0,124,238,252,238,254,124,0
       db 0,124,254,224,254,254,124,0
       db 0,252,238,238,254,254,252,0
       db 0,126,240,252,240,254,126,0
       db 0,126,240,252,240,240,240,0
       db 0,124,254,240,238,246,124,0
       db 0,238,238,254,254,238,238,0
       db 0,126,126,60,60,126,126,0
       db 0,30,30,30,222,254,124,0
       db 0,238,252,248,248,252,238,0
       db 0,112,240,240,252,254,126,0
       db 0,214,254,254,238,238,238,0
       db 0,206,238,254,254,238,230,0
       db 0,124,254,238,238,254,124,0
       db 0,252,238,238,252,240,240,0
       db 0,124,254,254,238,242,124,0
       db 0,252,254,238,252,238,238,0
       db 0,124,240,252,30,254,124,0
       db 0,254,254,56,124,124,124,0
       db 0,238,238,238,238,254,124,0
       db 0,238,238,238,238,124,56,0
       db 0,238,238,238,254,254,108,0
       db 0,238,254,124,254,254,238,0
       db 0,238,238,254,62,254,252,0
       db 0,254,254,184,118,254,254,0
       db 0,30,24,24,24,24,30,0
       db 0,0,192,96,48,24,12,0
       db 0,240,48,48,48,48,240,0
       db 0,48,120,252,48,48,48,0
       db 0,0,0,0,0,0,0,255
       db 0,60,102,248,96,96,254,0
       db 0,0,120,12,124,204,124,0
       db 0,96,96,124,102,102,124,0
       db 0,0,60,96,96,96,60,0
       db 0,12,12,124,204,204,124,0
       db 0,0,120,204,248,192,124,0
       db 0,28,48,56,48,48,48,0
       db 0,0,124,204,204,124,12,120
       db 0,192,192,248,204,204,204,0
       db 0,48,0,112,48,48,120,0
       db 0,12,0,12,12,12,108,56
       db 0,96,120,112,112,120,108,0
       db 0,48,48,48,48,48,28,0
       db 0,0,248,252,252,252,252,0
       db 0,0,248,204,204,204,204,0
       db 0,0,120,204,204,204,120,0
       db 0,0,248,204,204,248,192,192
       db 0,0,124,204,204,124,12,14
       db 0,0,60,96,96,96,96,0
       db 0,0,120,192,120,12,248,0
       db 0,48,120,48,48,48,28,0
       db 0,0,204,204,204,204,120,0
       db 0,0,204,204,120,120,48,0
       db 0,0,204,252,252,252,120,0
       db 0,0,204,120,48,120,204,0
       db 0,0,204,204,204,124,12,120
       db 0,0,252,24,48,96,252,0
       db 0,30,24,112,24,24,30,0
       db 0,24,24,24,24,24,24,0
       db 0,240,48,28,48,48,240,0
       db 0,60,120,0,0,0,0,0
       db 124,198,187,227,227,187,198,124
jtab:	
       db 99
keytab:	defw $609,$607,$600,$605,$240,$540,$60B,$601,$602,$603,$60A; Game engine code --------------------------------------------------------------

; DEFINE DEBUG
; DEFINE FASTVRAMDUMP

; Arcade Game Designer.
; (C) 2008 - 2018 Jonathan Cauldwell.
; MSX version (C) jltursan
; Based on ZX Spectrum Engine v0.7.4
;
; Notes about Music & SFX engine
; From the EngineMSX itself, 5 routines are being called right now:
;
; * music_init => initializes the music engine. If your engine doesn't needs this, use ret to do nothing
; * music_play => plays a music frame from the ISR. The idea is to set a buffer with all the PSG register ready to dump
; but also must implement:
; * music_loopoff
; * music_loopon
; * music_set
; * music_mute
; * sfx_init => initializes the sfx engine. Idem
; * sfx_play => plays a sfx frame from the ISR. Idem
; * psgrout => generic routine to dump all PSG registers
;
; Fixed: Now evnt18 (game completed) doesn't disables sprites at all; so you can use the sprites in an ending scene (if you need to hide them, use now SPRITESOFF)
; Added: Due the change in evnt18, a new command SPRITESOFF has been added to the compiler, it hides all sprites by setting 208 Y-coord to sprite 0
; Fixed: CLS & CLW routines now erase scrmap buffer and also disable sprites (Thanks to FX).
; Fixed: ROM stack initialization bug in MSX machines with drives (specially TR)
;
; Fixed: Sprite flicker bug (MSX freezes) due a byte boundary overrun. Table colltab must not cross a byte boundary to avoid this.
; Added: Some cycles saved in plot pixel routine
; Added: New command CRUMBLE
; Fixed: Keyboard scanning back to 50fps to fix some positioning problems when controlling characters
; Fixed: PSG initialization bug filling registers with illegal values
; Fixed: Some optimization to the ayFX replayer routine
; Fixed: PSG wrong reset sound when multichannel mode active (FX_MODE=1)  
; Fixed: Serious bug in the PSG dumping routine (PT3 specially affected)
; Added: Support for Metablocks (2x2 characters map blocks)
; Fixed: UNDOSPRITEMOVE support
; Fixed: Sometimes player sprite was not initialized correctly when changing screen 
; Added: New command SPRITESOFF
; Fixed: RAM/ROM slot routines changed to a more compatible ones (Thanks JAM!)
; Added: Support of forced PAL/NTSC TV modes
; Added: PAL/NTSC modes swappable with hotkey (SELECT)
; Added: New command THRUST
; Added: LZ compression (Pletter) instead RLE for map screens
; Added: New command SCREENON
; Added: New command SCREENOFF

;
; Core rotuines
; ----------------------------------
; ptxt => core routine that prints a font character (no color)
; pchr => core routine that prints a BLOCK (pattern+color)

/*
MEANING OF FLAGS
=========================================

AFLAG	: Adventure mode
CFLAG	: Collectables
CRFLAG	: Crumbling blocks
DFLAG	: Digging
EFLAG	: Beeper
HCFLAG	: Hardware collisions disabled
LFLAG	: Ladders
MFLAG	: Menu/Inventory
MBFLAG	: MetaBlocks
RTFLAG	: Thrust for rotational control
OFLAG	: Objects
PFLAG	: Particles
QFLAG	: Marquee
SFLAG	: Scrolling
TVFREQ	: Force 50Hz(50)/60Hz(60). Only for MSX2 or higher models
UFLAG	: User routines 
XFLAG	: PSG SFX
YFLAG	: PSG Music
FX_RELATIVE : Relative SFX volume
FX_MODE 	: SFX replayer mode
FX_CHANNEL	: Fixed SFX channel (if FX_MODE=0, 1 = C, 2 = B, 3 = A)
*/

; Distribution types

ROM=0
DISK=1
TAPE=2

; TV modes

PAL=1
NTSC=2

; MSX machines characteristics
MSX_MAXROWS	equ 24
MSX_MAXCOLS	equ 32
MSX_MAXCX	equ 255
MSX_MAXCY	equ 191
MSX_SPRHS	equ 16
MSX_SPRVS	equ 16


; =============================================================================================
 
; Block characteristics.

PLATFM	equ 1               ; platform.
WALL	equ PLATFM + 1      ; solid wall.
LADDER	equ WALL + 1        ; ladder.
FODDER	equ LADDER + 1      ; fodder block.
DEADLY	equ FODDER + 1      ; deadly block.
CUSTOM	equ DEADLY + 1      ; custom block.
WATER	equ CUSTOM + 1      ; water block.
COLECT	equ WATER + 1       ; collectable block.
NUMTYP	equ COLECT + 1      ; number of types.

CRUMBLING_SPEED	equ	7		; crumble every 8 frames. Valid values are 7 (every 8),3 (every 4) or 1 (every 2)

; Objects

	if DISTYPE=ROM

OBJSIZ 	equ 64+3			; size of each object entry, variable bytes are moved to 
ODTSIZ 	equ 3			   	; object data size
		
	else
	
OBJSIZ 	equ 64+6			; size of each object entry
ODTSIZ 	equ 6			   	; object data size

	endif

; Sprites.

NUMSPR 	equ 32              ; number of sprites.
TABSIZ 	equ 17              ; size of each entry.
SPRBUF 	equ NUMSPR * TABSIZ ; size of entire table.
NMESIZ 	equ 5               ; bytes stored in nmetab for each sprite (SPRITEPOSITIONs).
X      	equ 3               ; new x coordinate of sprite.
Y      	equ X + 1           ; new y coordinate of sprite.
PAM1ST	equ 5               ; first sprite parameter, old x (ix+5).
MAPSIZE	equ	WINDOWHGT * WINDOWWID	
	
; Particle engine.

	if PFLAG

NUMSHR	equ 54              ; pieces of shrapnel.
SHRSIZ	equ 9               ; bytes per particle.
VAPTIM	equ 10				; vapour particle life time
		
	endif

;	include "MSX_Defs.asm"
;	include "MSX_Macros.asm"

; Game starts here.  No reason why screen data couldn't go between start and contrl to put them in
; contended RAM, leaving the code and rest of the game in uncontended memory at 32768 and beyond.

start:
;	if DISTYPE=ROM
		di
		ld sp,CV_STACK
;	else
; 		ld hl,(MSX_HIMEM)
;		ld sp,hl
;	endif
;		ld a,$C9
;		ld (MSX_HKEYI),a
;		ld (MSX_HTIMI),a
;		xor	a
;		ld (MSX_SCNCNT),a
;		ld (MSX_INTCNT),a		
;
		; initialize vars
		ld hl,varbegin
		ld de,varbegin+1
		ld bc,(varend-varbegin)-1
		ld (hl),0
		ldir

;		;init mapper
;		ld	a,1
;		out	(MSX_MMAP2),a
;		inc	a
;		out	(MSX_MMAP1),a
;		inc	a
;		out	(MSX_MMAP0),a
;		
;	ifdef NOBIOS
;		ld a,(biosvars+MSX_MSXVER)      	; version del MSX
;	else
;		ld a,(MSX_MSXVER)      	; version del MSX
;	endif
;		inc a
;		dec a
;		jr z,.common
;		dec a
;		jr z,.MSX2
;		dec a
;		jr z,.MSX2P
;		; it's a TR		
;	if EFLAG
;		ld a,255
;		ld (snddelay),a
;	endif
;		jr .MSX2
;.MSX2P:
;		in a,(MSX_DEVID)
;		cpl
;		push af
;		ld a,8
;		out (MSX_DEVID),a  		;out the manufacturer code 8 (Panasonic) to I/O port 40h
;		in a,(MSX_DEVID)   		;read the value you have just written
;		cpl          			;complement all bits of the value
;		cp 8         			;if it does not match the value you originally wrote,
;		jr nz,.notWX  			;it is not a WX/WSX/FX.
;		xor a        			;write 0 to I/O port 41h
;		out (MSX_SWTIO),a  		;and the mode changes to high-speed clock
;	if EFLAG
;		ld a,32
;		ld (snddelay),a
;	endif
;.notWX:
;		pop af
;		out (MSX_DEVID),a		
;.MSX2:		
;		ld hl,palett
;		call setpal
;				
;		if (TVFREQ>0)
;			ld hl,MSX_RG9SAV
;			if (TVFREQ=PAL)
;				res 1,(hl)
;			else
;				set 1,(hl)
;			endif
;			call swaphz
;		else
;			ld a,(MSX_RG9SAV)
;		endif
;		call setticks
;
;.common:		
;		; Set up the display if needed
;	if QFLAG=0
;	
		ld hl,$0101
		ld (MSX_FORCLR+1),hl    ; sets background & border colour to black

 
		call CV_INIGRP		; set display to screen 2

;Enable both joysticks, buttons, keypads

		ld hl,$9b9b
		ld (CONTROLLER_BUFFER),hl
		xor a
		call CONTROLLER_INIT    
		
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;		ld a,(MSX_RG1SAV)
;		or 2
;		ld b,a
;		ld c,1
;		call MSX_WRTVDP			; enable 16x16 sprites
;
;		xor a
;		ld (MSX_CLIKSW),a       ; disables keyboard click

;	endif
		
		ld a,$F1
		ld (clratt),a
	
	if YFLAG
		call music_init
	endif
	if XFLAG
		call sfx_init
	endif
	
;		; installs ISR
;		di
;		ld hl,isr
;		ld (MSX_HTIMI+1),hl
;		ld a,$C3
;		ld (MSX_HTIMI),a
		ei

	; When ROM, setup of variables with starting value
	if DISTYPE=ROM
		
		xor a
	if EFLAG
		ld hl,sndtyp
		ld (hl),a
	endif
		; ROM mode needs to initialize some vars
		ld hl,score         ; scores.		
		ld de,score+1       ; next byte.
		ld bc,17			; size of score vars.
		ld (hl),'0'        	; write '0'
		ldir
		ld hl,displ0+3
		ld (hl),13+128
	if SFLAG
		inc a				; A=1
		ld (scrlyoff),a		; by default, no scrolltext
	endif
	if PFLAG
		ld hl,prosh1
		ld (shrplot),hl
	endif
	if MFLAG
		ld a,$C3
		ld (mod0),a
		ld (mod1),a
		ld (mod2),a
	endif
		ld hl,keytab
		ld de,keys
		ld bc,22
		ldir
		
		ex de,hl
		
		ld (hl),WINDOWTOP
		inc hl
		ld (hl),WINDOWLFT
		inc hl
		ld (hl),WINDOWHGT
		inc hl
		ld (hl),WINDOWWID
		
	; DATA command initialization
	ifdef DATA00
		ld hl,rdat00
		ld (rptr00),hl
	endif
	ifdef DATA01
		ld hl,rdat01
		ld (rptr01),hl
	endif
	ifdef DATA02
		ld hl,rdat02
		ld (rptr02),hl
	endif
	ifdef DATA03
		ld hl,rdat03
		ld (rptr03),hl
	endif
	ifdef DATA04
		ld hl,rdat04
		ld (rptr04),hl
	endif
	ifdef DATA05
		ld hl,rdat05
		ld (rptr05),hl
	endif
	ifdef DATA06
		ld hl,rdat06
		ld (rptr06),hl
	endif
	ifdef DATA07
		ld hl,rdat07
		ld (rptr07),hl
	endif
	ifdef DATA08
		ld hl,rdat08
		ld (rptr08),hl
	endif
	ifdef DATA09
		ld hl,rdat09
		ld (rptr09),hl
	endif
	ifdef DATA10
		ld hl,rdat10
		ld (rptr10),hl
	endif
	ifdef DATA11
		ld hl,rdat11
		ld (rptr11),hl
	endif
	ifdef DATA12
		ld hl,rdat12
		ld (rptr12),hl
	endif
	ifdef DATA13
		ld hl,rdat13
		ld (rptr13),hl
	endif
	ifdef DATA14
		ld hl,rdat14
		ld (rptr14),hl
	endif
	ifdef DATA15
		ld hl,rdat15
		ld (rptr15),hl
	endif
	ifdef DATA16
		ld hl,rdat16
		ld (rptr16),hl
	endif
	ifdef DATA17
		ld hl,rdat17
		ld (rptr17),hl
	endif
	ifdef DATA18
		ld hl,rdat18
		ld (rptr18),hl
	endif
	ifdef DATA19
		ld hl,rdat19
		ld (rptr19),hl
	endif
	ifdef DATA20
		ld hl,rdat20
		ld (rptr20),hl
	endif
		
	endif
		jp game             ; start the game.


numob  db NUMOBJ         ; number of objects in game.

; Variables start here.
; Pixel versions of wintop, winlft, winhgt, winwid.

wntopx db (8 * WINDOWTOP) + 1
wnlftx db (8 * WINDOWLFT)
wnbotx db ((WINDOWTOP * 8) + (WINDOWHGT * 8) - 16)
wnrgtx db ((WINDOWLFT * 8) + (WINDOWWID * 8) - 16)


; Make sure pointers are arranged in the same order as the data itself.

frmptr dw frmlst         ; sprite frames.
blkptr dw chgfx          ; block graphics.
proptr dw bprop          ; address of char properties.
scrptr dw scdat          ; address of screens.
nmeptr dw nmedat         ; enemy start positions.


	if MFLAG
	
; Modify for inventory.

minve:
	if MBFLAG
		ld l,a
		ld a,WINDOWHGT	
		add a,a			
		ld (winhgt),a	
		ld a,WINDOWWID	
		add a,a			
		ld (winwid),a	
		ld a,l
	endif
		
		ld hl,invdis        ; routine address.
		ld (mod0+1),hl      ; set up menu routine.
		ld (mod2+1),hl      ; set up count routine.
		ld hl,fopt          ; find option from available objects.
		ld (mod1+1),hl      ; set up routine.
		jr dbox             ; do menu routine.

; Modify for menu.

mmenu:
		ld hl,always        ; routine address.
		ld (mod0+1),hl      ; set up routine.
		ld (mod2+1),hl      ; set up count routine.
		ld hl,fstd          ; standard option selection.
		ld (mod1+1),hl      ; set up routine.

; Drop through into box routine.

; Work out size of box for message or menu.

dbox:   		
		ld hl,msgdat        ; pointer to messages.
		call getwrd         ; get message number.
		push hl             ; store pointer to message.
		ld d,1              ; height.
		xor a               ; start at object zero.
		ld (combyt),a       ; store number of object in combyt.
		ld e,a              ; maximum width.
dbox5:
		ld b,0              ; this line's width.
;mod2:						 ; auto-modifying code
;		call always
		
		call mod2		
		jr nz,dbox6         ; not in inventory, skip this line. (dbox3?)
		inc d               ; add to tally.
dbox6:
		ld a,(hl)           ; get character.
		inc hl              ; next character.
		cp ','              ; reached end of line?
		jr z,dbox3          ; yes.
		cp 13               ; reached end of line?
		jr z,dbox3          ; yes.
		inc b               ; add to this line's width.
		and a               ; end of message?
		jp m,dbox4          ; yes, end count.
		jr dbox6            ; repeat until we find the end.
dbox3:
		ld a,e              ; maximum line width.
		cp b                ; have we exceeded longest so far?
		jr nc,dbox5         ; no, carry on looking.
		ld e,b              ; make this the widest so far.
		jr dbox5            ; keep looking.
dbox4:
		ld a,e              ; maximum line width.
		cp b                ; have we exceeded longest so far?
		jr nc,dbox8         ; no, carry on looking.
		ld e,b              ; final line is the longest so far.
dbox8:
		dec d               ; decrement items found.
		jp z,dbox15         ; total was zero.
		ld a,e              ; longest line.
		and a               ; was it zero?
		jp z,dbox15         ; total was zero.
		ld (bwid),de        ; set up size.

; That's set up our box size.

		call dissprs

		ld a,(winhgt)       ; window height in characters.
		sub d               ; subtract height of box.
		rra                 ; divide by 2.
		ld hl,wintop        ; top edge of window.
		add a,(hl)          ; add displacement.
		ld (btop),a         ; set up box top.
		ld a,(winwid)       ; window width in characters.
		sub e               ; subtract box width.
		rra                 ; divide by 2.
		inc hl              ; left edge of window.
		add a,(hl)          ; add displacement.
		ld (blft),a         ; box left.

		ld hl,font-256       ; font.
		ld (grbase),hl      ; set up for text display.
		pop hl              ; restore message pointer.
		ld a,(btop)         ; box top.
		ld (dispx),a        ; set display coordinate.
		xor a               ; start at object zero.
		ld (combyt),a       ; store number of object in combyt.
dbox2:
		ld a,(combyt)       ; get object number.
;mod0:						 ; auto-modifying code
;		call always         ; check inventory for display.


		call mod0		
		jp nz,dbox13        ; not in inventory, skip this line.
		ld a,(blft)         ; box left.
		ld (dispy),a        ; set left display position.
		ld a,(bwid)         ; box width.
		ld b,a              ; store width.
	   
dbox0:  
		ld a,(hl)           ; get character.
		cp ','              ; end of line?
		jr z,dbox1          ; yes, next one.
		cp 13               ; end of option?
		jr z,dbox1          ; yes, on to next.
		dec b               ; one less to display.
		and 127             ; remove terminator.

		push bc             ; store characters remaining.
		push hl             ; store address on stack.


		call ptxt           ; display character.		
		
		ld hl,dispy         ; y coordinate.
		inc (hl)            ; move along one.
		
		pop hl              ; retrieve address of next character.
		pop bc              ; chars left for this line.

		ld a,(hl)           ; get character.
		inc hl              ; next character.
		cp 128              ; end of message?
		jp nc,dbox7         ; yes, job done.
		ld a,b              ; chars remaining.
		and a               ; are any left?
		jr nz,dbox0         ; yes, continue.

; Reached limit of characters per line.

dbox9:
		ld a,(hl)           ; get character.
		inc hl              ; next one.
		cp ','              ; another line?
		jr z,dbox10         ; yes, do next line.
		cp 13               ; another line?
		jr z,dbox10         ; yes, on to next.
		cp 128              ; end of message?
		jr nc,dbox11        ; yes, finish message.
		jr dbox9

; Fill box to end of line.

dboxf:
		push hl             ; store address on stack.
		push bc             ; store characters remaining.	   
		ld a,' '
		call ptxt           ; display character.		
		
		ld hl,dispy         ; y coordinate.
		inc (hl)            ; move along one.		
		pop bc              ; retrieve character count.
		pop hl              ; retrieve address of next character.
		djnz dboxf          ; repeat for remaining chars on line.
		ret

dbox1:
		inc hl              ; skip character.
		call dboxf          ; fill box out to right side.
dbox10:
		ld a,(dispx)        ; x coordinate.
		inc a               ; down a line.
		ld (dispx),a        ; next position.
		jp dbox2            ; next line.
dbox7:
		ld a,b              ; chars remaining.
		and a               ; are any left?
		jr z,dbox11         ; no, nothing to draw.
		call dboxf          ; fill message to line.

; Drawn the box menu, now select option.

dbox11:
		ld a,(btop)         ; box top.
		ld (dispx),a        ; set bar position.
dbox14:
		call joykey         ; get controls.
		and 31              ; anything pressed?
		jr nz,dbox14        ; yes, debounce it.
		call dbar           ; draw bar.
dbox12:
		call joykey         ; get controls.
		and 28              ; anything pressed?
		jr z,dbox12         ; no, nothing.
		and 16              ; fire button pressed?
;mod1:						 ; auto-modifying code
;		jp nz,fstd          ; yes, job done.

		
		jp nz,mod1
		call dbar           ; delete bar.
		ld a,(joyval)       ; joystick reading.
		and 8               ; going up?
		jr nz,dboxu         ; yes, go up.
		ld a,(dispx)        ; vertical position of bar.
		inc a               ; look down.
		ld hl,btop          ; top of box.
		sub (hl)            ; find distance from top.
		dec hl              ; point to height.
		cp (hl)             ; are we at end?
		jp z,dbox14         ; yes, go no further.
		ld hl,dispx         ; coordinate.
		inc (hl)            ; move bar.
		jr dbox14           ; continue.
dboxu:
		ld a,(dispx)        ; vertical position of bar.
		ld hl,btop          ; top of box.
		cp (hl)             ; are we at the top?
		jp z,dbox14         ; yes, go no further.
		ld hl,dispx         ; coordinate.
		dec (hl)            ; move bar.
		jr dbox14           ; continue.
fstd:
		ld a,(dispx)        ; bar position.
		ld hl,btop          ; top of menu.
		sub (hl)            ; find selected option.
		ld (varopt),a       ; store the option.
		jp redraw           ; redraw the screen.

; Option not available.  Skip this line.

dbox13:
		ld a,(hl)           ; get character.
		inc hl              ; next one.
		cp ','              ; another line?
		jp z,dbox2          ; yes, do next line.
		cp 13               ; another line?
		jp z,dbox2          ; yes, on to next line.
		and a               ; end of message?
		jp m,dbox11         ; yes, finish message.
		jr dbox13
dbox15:

	if MBFLAG
		ld a,WINDOWWID
		ld (winwid),a
		ld a,WINDOWHGT
		ld (winhgt),a
	endif
	
		pop hl              ; pop message pointer from the stack.
		ret

dbar:
		ld a,(blft)         ; box left.
		ld (dispy),a        ; set display coordinate.
		call gprad          ; get printing address.
		ex de,hl            ; flip into hl register pair.
	   
		set 5,h
		ld a,(bwid)         ; box width.
		add a,a
		add a,a
		add a,a
		ld c,a
		ld b,0
		call MSX_RDVRM
		rlca
		rlca
		rlca
		rlca
		jp MSX_FILVRM

invdis:
		push hl             ; store message text pointer.
		push de             ; store de pair for line count.
		ld hl,combyt        ; object number.
		ld a,(hl)           ; get object number.
		inc (hl)            ; ready for next one.
		call gotob          ; check if we have object.
		pop de              ; retrieve de pair from stack.
		pop hl              ; retrieve text pointer.
		ret
		
; Find option selected.

fopt:
		ld a,(dispx)
		ld hl,btop          ; top of menu.
		sub (hl)            ; find selected option.
		inc a               ; object 0 needs one iteration, 1 needs 2 and so on.
		ld b,a              ; option selected in b register.
		ld hl,combyt        ; object number.
		ld (hl),0           ; set to first item.
fopt0:
		push bc             ; store option counter in b register.
		call fobj           ; find next object in inventory.
		pop bc              ; restore option counter.
		djnz fopt0          ; repeat for relevant steps down the list.
		ld a,(combyt)       ; get option.
		dec a               ; one less, due to where we increment combyt.
		ld (varopt),a       ; store the option.
		xor a
		ld (joyval),a
		jp redraw           ; redraw the screen.

fobj:
		ld hl,combyt        ; object number.
		ld a,(hl)           ; get object number.
		inc (hl)            ; ready for next item.
		ret z               ; in case we loop back to zero.
		call gotob          ; do we have this item?
		ret z               ; yes, it's on the list.
		jr fobj             ; repeat until we find next item in pockets.

	endif

;
; ISR
;
isr:
	ifdef NOBIOS
		push hl
		push de
		push bc
		push af
		exx
		ex af,af
		push hl
		push de
		push bc
		push af
		push iy
		push ix
        in a,($99)      ;Clear possible interrupt request
        or a               ;Interrupt requested by VDP?		
		jp p,.intret       ;No, skip the rest
		ei
	endif			
        ld (MSX_STATFL),a	;Store this new status
        ld hl,(MSX_JIFFY)
        inc hl
        ld (MSX_JIFFY),hl		
	if (YFLAG or XFLAG)	
		call psgrout
		if YFLAG
			call music_play
		endif
		if XFLAG
			call sfx_play
		endif
	endif
	ifdef NOBIOS
.intret:
	else
		pop af
	endif
        pop ix              ;Restore all registers
        pop iy
        pop af
        pop bc
        pop de
        pop hl
        ex  af,af
        exx
        pop af
        pop bc
        pop de
        pop hl
        ei
        ret					; returns from interrupt		
;
; Wait for keypress.
;
chkkey:
;		call vsync
;		ld b,11
;.nokey:
;		ld a,b
;		dec a
;		call MSX_SNSMAT
;		cp 255
;		ret nz
;		djnz .nokey
;		jr chkkey
		
prskey:
	call vsync

	ld a,(CONTROLLER_BUFFER+2)	; Test button left
	and a
	jr nz,debkey

	ld a,(CONTROLLER_BUFFER+3)	; Test joystick
	and a
	jr nz,debkey

	ld a,(CONTROLLER_BUFFER+6)	; Test keypad
	cp $0f
	jr nz,debkey

	ld a,(CONTROLLER_BUFFER+5)	; Test button right
	and a
	jr nz,debkey

	jp prskey

; Debounce keypress.
		
debkey:
	call vsync

	ld a,(CONTROLLER_BUFFER+2)	; Test button left
	and a
	jr nz,debkey

	ld a,(CONTROLLER_BUFFER+3)	; Test joystick
	and a
	jr nz,debkey

	ld a,(CONTROLLER_BUFFER+6)	; Test keypad
	cp $0f
	jr nz,debkey

	ld a,(CONTROLLER_BUFFER+5)	; Test button right
	and a
	jr nz,debkey

	ret

; Delay routine.

delay:
		push bc             ; store loop counter.
		call vsync          ; wait for interrupt.
		pop bc              ; restore counter.
		djnz delay          ; repeat.
		ret

; Clear sprite table.

xspr:
		ld hl,sprtab       ; sprite table.
		ld de,sprtab+1
		ld (hl),255
		ld bc,SPRBUF-1     ; length of table.
		ldir
		xor a
		ld (highslot),a		; resets also highest sprite slot number
;
xspr0:
		ld hl,mapspr       ; sprite images map.
		ld de,mapspr+1
		ld (hl),255
		ld bc,127          ; length of table.
		ldir
		ret
		
	if OFLAG
	
; Initialise all objects.

	if DISTYPE=ROM

iniob:
		; ROM model
		ld a,(numob)        ; number of objects in the game.
		ld b,a
		ld hl,objdta        ; objects table.
		ld de,objatr
.loop:
		ld a,OBJSIZ-ODTSIZ  ; distance between objects.
		ld c,a
		ldi
		ldi
		ldi
		ADD_HL_A
		djnz .loop         ; repeat.
		ret

	else
		; RAM model
iniob:
		/*
		ld ix,objdta        ; objects table.
		ld a,(numob)        ; number of objects in the game.
		ld b,a              ; loop counter.
		ld de,OBJSIZ        ; distance between objects.
.loop:
		ld a,(ix+67)        ; start screen.
		ld (ix+64),a        ; set start screen.
		ld a,(ix+68)        ; find start x.
		ld (ix+65),a        ; set start x.
		ld a,(ix+69)        ; get initial y.
		ld (ix+66),a        ; set y coord.
		add ix,de           ; point to next object.
		djnz .loop         ; repeat.
		ret
		*/
		ld a,(numob)        ; number of objects in the game.
		ld b,a				; objects counter
		ld hl,objdta+OBJSIZ-1	
.loop:
		ld c,h				; h must be > 3
		ld d,h
		ld e,l
		dec de
		dec de
		dec de
		ldd
		ldd
		ldd
		ld de,OBJSIZ+3
		add hl,de
		djnz .loop         ; repeat.
		ret
		
	endif
	
	endif
	
	
; Screen synchronisation.

vsync:
	call buildspr
;	call POLLER
	call joykey

; Sync framerate to 25 Hz

	push hl

check_if_enough_frames_passed:
	ld hl,time
	ld a,(hl)
	cp 1
	nop
	nop
	nop
	nop
	nop
	nop
	jr c,check_if_enough_frames_passed

	xor a			; sync framerate 25 Hz
	ld (hl),a
	pop hl

	ret
;		ld hl,MSX_JIFFY
;		ld a,(hl)

	if SFLAG
		push af
		push hl
		call scrltxt
		pop hl
		pop af
		cp (hl)
		jr z,.novbl0
		call scrly
	if PFLAG
;		call proshr
	endif
		call buildspr
	ret
	if EFLAG
		call beeper
	endif
		call joykey
		jr .nowait
		
.novbl0:		
	endif

	if PFLAG
		
		push af
		push hl
		call proshr
		pop hl
		pop af
		cp (hl)
		jr z,.novbl1
	if SFLAG
		call scrly
	endif
		call buildspr
	if EFLAG
		call beeper
	endif
		call joykey
		jr .nowait
		
.novbl1:		
	endif
		
		push af
		push hl
		call buildspr
		pop hl
		pop af
		cp (hl)
		jr z,.novbl2
	if SFLAG
		call scrly
	endif
	if EFLAG
		call beeper
	endif
		call joykey
		jr .nowait

.novbl2:
	if EFLAG
		call beeper
	endif
		cp (hl)
		jr z,.novbl3
	if SFLAG
		call scrly
	endif
		call joykey
		jr .nowait
		
.novbl3:
		push af
		push hl
		call joykey
		pop hl
		pop af
		cp (hl)
		; jr z,.novbl5
		jr z,.wait
	if SFLAG
		call scrly
	endif
		jr .nowait
		
.wait:		
	ifdef DEBUG
		BORDER 13
	endif
		cp (hl)
		jr z,.wait
	if SFLAG
		call scrly
	endif
	
.nowait:
	ifdef DEBUG
		BORDER 14
	endif
		ret

	if EFLAG
	
beeper:
	ifdef DEBUG
		BORDER 15
	endif
		ld e,a				; keeps JIFFY
		ld a,(sndtyp)       ; sound to play.
		and a               ; any sound?
		jr z,beep1			; no.
		ld b,a              ; outer loop.
		and a               ; test it.
		ld c,14				; first value to write (0)
		jp m,noise          ; play white noise.
.beep2:
		ld a,c              ; (5) get speaker value.
		out (MSX_PPICM),a   ; (12) write to speaker.
		xor 1               ; (7) toggle bit 0.
		ld c,a              ; (5) store value for next time.
		ld d,b              ; (5) store loop counter.
		
		ld a,(snddelay)
		or a
		jr z,.nodelay
		ld b,a
		djnz $
		ld b,d
.nodelay:		
		ld a,e				; (5) restore old JiFFY
.beep3:
		cp (hl)				; (8) next frame?
		jr nz,.beep4		; (8/13) yes, no more processing please.
		djnz .beep3         ; (14/9) loop while frame doesn't changes.
		
		ld b,d              ; (5) restore loop counter.
		djnz .beep2         ; (14/9) continue noise.
							; (87)
.beep4:
		ld a,d              ; where we got to.
vsynca:
		ld (sndtyp),a       ; remember for next time.
beep1:		
		ld a,e

	ifdef DEBUG
		BORDER 14
	endif

		ret

; Play white noise

noise: 
		sub 127
		ld b,a				; outer loop
vsync7:
		ld a,r              ; get random speaker value.
		and 2               ; only retain the speaker/earphone bits.
		rrca
		or c                ; merge with command PPI bit 7.
		out (MSX_PPICM),a   ; write to speaker.
		ld a,e				; restore old JiFFY
		cp (hl)             ; subtract last reading.
		jp nz,vsync8        ; yes, no more processing please.
		ld a,b
		;and 127
		inc a
vsync9:
		dec a
		jr nz,vsync9        ; loop.
		djnz vsync7         ; continue noise.
vsync8:
		xor a
		jr vsynca

	endif
	
; Redraw the screen.

redraw:
	if MBFLAG
		ld a,WINDOWWID
		ld (winwid),a
		ld a,WINDOWHGT
		ld (winhgt),a
	endif

		call clrscrmap
		push ix             ; place sprite pointer on stack.
		; ld (nohide),a		; disable screen hiding
		
		call droom          ; show screen layout.
	if OFLAG
		call shwob          ; draw objects.
	endif

		WAITFRAME
		
		ld hl,spratr
		ld de,MSX_SPRATR
		ld b,128
		call ram2vram			   
	   
rpblc1:
	if PFLAG
		call dshrp          ; redraw shrapnel.
	endif
	if AFLAG
		call rbloc          ; draw blocks for this screen
	endif
		pop ix              ; retrieve sprite pointer.
		ret

; swap PAL/NTSC

swaphz:		
		ld a,(MSX_RG9SAV)
		xor 2
		ld b,a
		ld c,9
		push af
		call MSX_WRTVDP			
		pop af
		ret

; Clear screen routine.

cls:
		ld a,(clratt)
		ld e,a
		and $F0
		rrca
		rrca
		rrca
		rrca
		ld (MSX_FORCLR),a
		ld a,e
		and $0F
		ld (MSX_BAKCLR),a
		xor a
		call MSX_CLS
		ld hl,0             ; set hl to origin (0, 0).
		ld (charx),hl       ; reset coordinates.
		call clrscrmap
		jp dissprs

; Set palette routine and data.
; Palette.

setpal:
		ld a,(MSX_VDPPRT)	; get first VDP write port
		ld c,a
		inc c      		; prepare to write register data
		xor a      		; from color 0
		out (c),a
		ld a,16+128		; write R#16
		out (c),a
		inc c      		; prepare to write palette data
		ld b,32      	; 16 color * 2 bytes for palette data
		otir
		ret
		
	if (PFLAG or DFLAG)
	
fdchk:
		ld a,(hl)           ; fetch cell.
		cp FODDER           ; is it fodder?
		ret nz              ; no.
		ld (hl),0           ; rewrite block type.
		push hl             ; store pointer to block.
		ld de,MAP           ; address of map.
		and a               ; clear carry flag for subtraction.
		sbc hl,de           ; find simple displacement for block.
		ld a,l              ; low byte is y coordinate.
		and 31              ; column position 0 - 31.
		ld (dispy),a        ; set up y position.
		add hl,hl           ; multiply displacement by 8.
		add hl,hl
		add hl,hl
		ld a,h              ; x coordinate now in h.
		ld (dispx),a        ; set the display coordinate.
		ld hl,(blkptr)      ; blocks.
		ld (grbase),hl      ; set graphics base.		
		xor a               ; block to write.
		call pattr          ; write block.
		pop hl              ; restore block pointer.
		ret
		
	endif
	
; Colour a sprite.

cspr:
		ld (ix+5),c
		ret
				
	if PFLAG

; Specialist routines.
; Process shrapnel.
		
proshr:
		call setshr
		
proshrnoset:
		
	ifdef DEBUG
		BORDER 5
	endif

		call proshr0
		call proshr0
		call proshr0
		call proshr0
		call proshr0
		call proshr0
		call proshr0
		call proshr0
		
	ifdef DEBUG

		call proshr0 	
		BORDER 14
		ret

	else

proshr0:
		ld ix,(shraddr)
		ld b,NUMSHR/(9*2)
proshloop:
		ld a,(ix+0)         ; on/off marker.
		rla                 ; check its status.
		call nc,proshx      ; on, so process it.
		ld de,SHRSIZ*2      ; distance to next.
		add ix,de           ; point there.
		djnz proshloop      ; round again.
		ld (shraddr),ix
		ret
	
	endif
	
setshr:
;		ld a,(MSX_JIFFY)
setshr0:
		ld hl,SHRAPN+SHRSIZ        ; table.
		rrca
		jr c,.shrodd
		ld hl,SHRAPN			 ; table.
.shrodd:
		ld (shraddr),hl
		ret

	ifdef DEBUG
		
proshr0:
		ld ix,(shraddr)
		ld b,NUMSHR/(9*2)
proshloop:
		ld a,(ix+0)         ; on/off marker.
		rla                 ; check its status.
		call nc,proshx      ; on, so process it.
		ld de,SHRSIZ*2      ; distance to next.
		add ix,de           ; point there.
		djnz proshloop      ; round again.
		ld (shraddr),ix
		ret

	endif

proshx:
		ld hl,(shrplot)
		jp (hl)

prosh1:
		push bc             ; store counter.
		call plot           ; delete the pixel.
		ld a,(ix+0)         ; restore shrapnel type.
		call prosh2         ; run the routine.
		call chkxy          ; check x and y are good before we redisplay.
		pop bc              ; restore counter.
		ret
prosh2:
		add a,a		
		add a,shrptr&$FF
		ld l,a
		ld h,shrptr>>8
		;ld (addr+1),a			; auto-modifying code
;addr:
		;ld hl,(shrptr)

		jp jumphl
 

; Explosion shrapnel.
; 220
/*
shrap: 
		ld h,(shrsin >> 8) & $FF    ; Get MSB of table
		ld l,(ix+1)
		
		ld e,(hl)           ; fetch value from table.
		inc hl              ; next byte of table.
		ld d,(hl)           ; fetch value from table.
		
		inc hl              ; next byte of table.
		ld c,(hl)           ; fetch value from table.
		inc hl              ; next byte of table.
		ld b,(hl)           ; fetch value from table.
		
		ld l,(ix+2)         ; x coordinate in hl.
		ld h,(ix+3)
		add hl,de           ; add sine.
		ld (ix+2),l         ; store new coordinate.
		ld (ix+3),h
		
		ld l,(ix+4)         ; y coordinate in hl.
		ld h,(ix+5)
		add hl,bc           ; add cosine.
		ld (ix+4),l         ; store new coordinate.
		ld (ix+5),h
		ret
 */
 ; 182 -> 156
shrap: 
		ld h,shrsin>>8    ; Get MSB of table
		ld a,(ix+1)
		add a,shrsin&$FF	; table offset (saving some bytes)
		ld l,a
		ld (stack),sp
		di
		ld sp,hl
		pop de						; fetch sine
		pop bc						; fetch cosine
		ld sp,ix
		pop hl
		pop hl
		add hl,de
		push hl		
		pop hl
		pop hl
		add hl,bc
		push hl				
		ei
		ld sp,(stack)            ;parameter will overwritten
		ret
		
dotl:   dec (ix+5)          ; move left.
        ret
dotr:   inc (ix+5)          ; move left.
        ret
dotu:   dec (ix+3)          ; move up.
        ret
dotd:   inc (ix+3)          ; move down.
        ret

; Check coordinates are good before redrawing at new position.

chkxy:
;		ld (ix+7),255

		ld hl,wntopx        ; window top.
		ld a,(ix+3)         ; fetch shrapnel Y coordinate.
		cp (hl)             ; compare with top window limit.
		jr c,kilshr         ; out of window, kill shrapnel.
		inc hl              ; left edge.
		ld a,(ix+5)         ; fetch shrapnel X coordinate.
		cp (hl)             ; compare with left window limit.
		jr c,kilshr         ; out of window, kill shrapnel.

		inc hl              ; point to bottom.
		ld a,(hl)           ; fetch window limit.
		add a,MSX_SPRVS-1   ; add height of sprite.
		cp (ix+3)           ; compare with shrapnel Y coordinate.
		jr c,kilshr         ; off screen, kill shrapnel.
		inc hl              ; point to right edge.
		ld a,(hl)           ; fetch shrapnel X coordinate.
		add a,MSX_SPRVS-1   ; add width of sprite.
		cp (ix+5)           ; compare with window limit.
		jr nc,plot          ; off screen, kill shrapnel.

kilshr:
		ld (ix+0),128       ; switch off shrapnel.
		; ld (ix+7),255       ; switch off shrapnel.
		
		ret


; Drop through.
; Display shrapnel.

plot:   ; ret

		ld l,(ix+3)         ; y integer.
		ld h,(ix+5)         ; x integer.
		ld (dispx),hl       ; workspace coordinates.
		ld a,(ix+0)         ; type.
		and a               ; is it a laser?
		jr z,plot1          ; yes, draw laser instead.

; INPUT:
; 	H = X
;	L = Y
plot0:
/*
		ld a,h              ; 5 which pixel within byte do we
		and 7               ; 7 want to set first?		
		ld e,a				; 5
		call scadd          	; screen address.		
		ld a,l				; 5 (22)
		di					; 5
		out (MSX_VDPCW),a	; 12
		ld a,h				; 5
		out (MSX_VDPCW),a	; 12
		ld d,dots>>8		; 7 Get MSB of table
		ld a,(de)			; 8 get value
		ld e,a				; 5
		in a,(MSX_VDPDRW)   ; 12 (66)
		xor e				; 5
		ld e,a				; 5
		ld a,l				; 5
		out (MSX_VDPCW),a	; 12
		ld a,h				; 5
		or 64				; 7
		out (MSX_VDPCW),a	; 12
		ei					; 5
		ld a,e				; 5
		out (MSX_VDPDRW),a	; 12 (73) 161		 = 139
		ret	   
*/


		ld a,h              ; 5 which pixel within byte do we
		and 7               ; 7 want to set first?		
		ld e,a				; 5	(24)
		call scadd          	; screen address.					
		ld c,MSX_VDPCW		; 7
		di					; 5
		out (c),l			; 14	
		out (c),h			; 14
		ld d,dots>>8		; 7 Get MSB of table
		ld a,(de)			; 8 get value
		ld e,a				; 5
pltwrt:
		in a,(MSX_VDPDRW)   ; 12
		xor e				; 5 (70)
		out (c),l			; 14
		set 6,h				; 10
		out (c),h			; 14
		ei					; 5
		out (MSX_VDPDRW),a	; 12 (65)		 = 159
		ret	   
		
plot1:
		call scadd          ; screen address.
		ld c,MSX_VDPCW		; 7
		di					; 5
		out (c),l			; 14	
		out (c),h			; 14
		ld e,255
		jp pltwrt
		
		/*
		and $FF					; dummy, wait 7 cycles
		and $FF					; dummy, wait 7 cycles
		in a,(MSX_VDPDRW)   ; 12
		cpl					; 5 (70)
		out (c),l			; 14
		set 6,h				; 10
		out (c),h			; 14
		ei					; 5
		out (MSX_VDPDRW),a	; 12 (65)		 = 159
		ret	   
		*/
/*
		call scadd          ; screen address.
		ld a,l
		di
		out (MSX_VDPCW),a
		ld a,h
		out (MSX_VDPCW),a
		and $FF					; dummy, wait 7 cycles
		and $FF					; dummy, wait 7 cycles
		in a,(MSX_VDPDRW)
		cpl
		ld e,a
		ld a,l
		out (MSX_VDPCW),a
		ld a,h
		or 64
		out (MSX_VDPCW),a
		ei	
		ld a,e
		out (MSX_VDPDRW),a		
		ret
*/



trail:
		dec (ix+1)          ; time remaining.
		jp z,trailk        ; time to switch it off.
		call qrand          ; get a random number.
		rra                 ; x or y axis?
		jr c,.trailv        ; use x.
		rra                 ; which direction?
		jr c,.traill        ; go left.
		inc (ix+5)          ; go right.
		ret
.traill:
		dec (ix+5)          ; go left.
		ret
.trailv:
		rra                 ; which direction?
		jr c,.trailu        ; go up.
		inc (ix+3)          ; go down.
		ret
.trailu:
		dec (ix+3)          ; go up.
		ret
trailk:
		ld (ix+3),200       ; set off-screen to kill vapour trail.
		ret

laser:
		ld a,(ix+1)         ; direction.
		rra                 ; left or right?
		jr nc,laserl        ; move left.
		ld b,8              ; distance to travel.
		jr laserm           ; move laser.
laserl:
		ld b,248            ; distance to travel.
laserm:
		ld a,(ix+5)         ; y position.
		add a,b             ; add distance.
		ld (ix+5),a         ; set new y coordinate.

; Test new block.

		ld (dispy),a        ; set y for block collision detection purposes.
		ld a,(ix+3)         ; get x.
		ld (dispx),a        ; set coordinate for collision test.
		call tstbl          ; get block type there.
		cp WALL             ; is it solid?
		jr z,trailk         ; yes, it cannot pass.

	if (PFLAG or DFLAG)
		cp FODDER           ; is it fodder?
		jr nz,.exit         ; no, ignore it.
		call fdchk          ; remove fodder block.
		jr trailk           ; destroy laser.
.exit
	endif
		ret

; Plot, preserving de.

plotde:
		push de             ; put de on stack.
		call plot           ; plot pixel.
		pop de              ; restore de from stack.
		ret

; Shoot a laser.

shoot:
		ld c,a              ; store direction in c register.
		ld a,(ix+3)         ; sprite x coordinate.
shoot1:
		add a,7             ; down 7 pixels.
		ld l,a              ; puty x coordinate in l.
		ld h,(ix+4)         ; sprite y coordinate in h.
		push ix             ; store pointer to sprite.
		call fpslot         ; find particle slot.
		jr nc,vapou2        ; failed, restore ix.
		ld (ix+0),0         ; set up a laser.
		ld (ix+1),c         ; set the direction.
		ld (ix+3),l         ; set x coordinate.
		rr c                ; check direction we want.
		jr c,shootr         ; shoot right.
		ld a,h              ; y position.

shoot0:
		and 248             ; align on character boundary.
		ld (ix+5),a         ; set y coordinate.
		jr vapou0           ; draw first image.
shootr:
		ld a,h              ; y position.
		add a,15            ; look right.
		jr shoot0           ; align and continue.

; Create a bit of vapour trail.

vapour:
		push ix             ; store pointer to sprite.
		ld l,(ix+3)         ; x coordinate.
		ld h,(ix+4)         ; y coordinate.
vapou3:
		ld de,7*256+7       ; mid-point of sprite.
		add hl,de           ; point to centre of sprite.
		call fpslot         ; find particle slot.
		jr c,vapou1         ; no, we can use it.
vapou2:
		pop ix              ; restore sprite pointer.
		ret                 ; out of slots, can't generate anything.
vapou1:
		ld (ix+3),l         ; set up x.
		ld (ix+5),h         ; set up y coordinate.
		call qrand          ; get quick random number.
		and 15              ; random time.
		add a,VAPTIM      ; minimum time on screen.
		ld (ix+1),a         ; set time on screen.
		ld (ix+0),1         ; define particle as vapour trail.
vapou0:
		call chkxy          ; plot first position.
		jr vapou2

; Create a user particle.

ptusr:
		ex af,af            ; store timer.
		ld l,(ix+3)         ; x coordinate.
		ld h,(ix+4)         ; y coordinate.
		ld de,7*256+7       ; mid-point of sprite.
		add hl,de           ; point to centre of sprite.
		call fpslot         ; find particle slot.
		jr c,.ptusr1        ; no, we can use it.
		ret                 ; out of slots, can't generate anything.
.ptusr1:
		ld (ix+3),l         ; set up x.
		ld (ix+5),h         ; set up y coordinate.
		ex af,af            ; restore timer.
		ld (ix+1),a         ; set time on screen.
		ld (ix+0),7         ; define particle as user particle.
		jp chkxy            ; plot first position.


; Create a vertical or horizontal star.

star   push ix             ; store pointer to sprite.
       call fpslot         ; find particle slot.
       jp c,star7          ; found one we can use.
star0  pop ix              ; restore sprite pointer.
       ret                 ; out of slots, can't generate anything.

star7  ld a,c              ; direction.
       and 3               ; is it left?
       jr z,star1          ; yes, it's horizontal.
       dec a               ; is it right?
       jr z,star2          ; yes, it's horizontal.
       dec a               ; is it up?
       jr z,star3          ; yes, it's vertical.

       ld a,(wntopx)       ; get edge of screen.
       inc a               ; down one pixel.
star8  ld (ix+3),a         ; set x coord.
       call qrand          ; get quick random number.
star9  ld (ix+5),a         ; set y position.
       ld a,c              ; direction.
       and 3               ; zero to three.
       add a,3             ; 3 to 6 for starfield.
       ld (ix+0),a         ; define particle as star.
       call chkxy          ; plot first position.
       jp star0
star1  call qrand          ; get quick random number.
       ld (ix+3),a         ; set x coord.
       ld a,(wnrgtx)       ; get edge of screen.
       add a,15            ; add width of sprite minus 1.
       jp star9
star2  call qrand          ; get quick random number.
       ld (ix+3),a         ; set x coord.
       ld a,(wnlftx)       ; get edge of screen.
       jp star9
star3  ld a,(wnbotx)       ; get edge of screen.
       add a,15            ; height of sprite minus one pixel.
       jp star8


; Find particle slot for lasers or vapour trail.
; Can't use alternate accumulator.

fpslot:
		ld ix,SHRAPN        ; shrapnel table.
		ld de,SHRSIZ        ; size of each particle.
		ld b,NUMSHR         ; number of pieces in table.
fpslt0:
		ld a,(ix+0)         ; get type.
		rla                 ; is this slot in use?
		ret c               ; no, we can use it.
		add ix,de           ; point to more shrapnel.
		djnz fpslt0         ; repeat for all shrapnel.
		ret                 ; out of slots, can't generate anything.

; Create an explosion at sprite position.

explod:
		ld c,a              ; particles to create.
		push ix             ; store pointer to sprite.
		ld l,(ix+3)         ; y coordinate.
		ld h,(ix+4)         ; x coordinate.
		ld ix,SHRAPN        ; shrapnel table.
		ld de,SHRSIZ        ; size of each particle.
		ld b,NUMSHR         ; number of pieces in table.
expld0:
		ld a,(ix+0)         ; get type.
		rla                 ; is this slot in use?
		jr c,expld1         ; no, we can use it.
expld2:
		add ix,de           ; point to more shrapnel.
		djnz expld0         ; repeat for all shrapnel.
expld3:
		pop ix              ; restore sprite pointer.
		ret                 ; out of slots, can't generate any more.

expld1:
		ld a,c              ; shrapnel counter.
		and 15              ; 0 to 15.
		add a,l             ; add to x.
		ld (ix+3),a         ; x coord.
		ld a,(seed3)        ; crap random number.
		and 15              ; 0 to 15.
		add a,h             ; add to y.
		ld (ix+5),a         ; y coord.
		ld (ix+0),2         ; switch it on.
		exx                 ; store coordinates.
		call chkxy          ; plot first position.
		call qrand          ; quick random angle.
		and 60              ; keep within range.
		ld (ix+1),a         ; angle.
		exx                 ; restore coordinates.
		dec c               ; one less piece of shrapnel to generate.
		jr nz,expld2        ; back to main explosion loop.
		jr expld3           ; restore sprite pointer and exit.
qrand:
		ld a,(seed3)        ; random seed.
		ld l,a              ; low byte.
		ld h,0              ; no high byte.
		ld a,r              ; r register.
		xor (hl)            ; combine with seed.
		ld (seed3),a        ; new seed.
		ret

; Display all shrapnel.

dshrp:
		ld hl,plotde        ; display routine.
		ld (shrplot),hl
		; ld (proshx+1),hl    ; modify routine.		
		
		xor a
		call setshr0
		call proshrnoset    ; process even shrapnel.
		ld a,1
		call setshr0
		call proshrnoset    ; process odd shrapnel.
		
		ld hl,prosh1        ; processing routine.
		ld (shrplot),hl
		; ld (proshx+1),hl    ; modify the call.
		
		ret

; Deletes all shrapnel

delshr: 
		ld ix,SHRAPN        ; table.
		ld b,NUMSHR         ; shrapnel pieces to process.
		; ld d,0				; plot needs this initially		
.loop:
		ld a,(ix+0)         ; on/off marker.
		rla
		jr c,.noshr
		push bc             ; store counter.
		call plot           ; delete the pixel.
		pop bc              ; restore counter.
.noshr:		
		ld de,SHRSIZ        ; distance to next.
		add ix,de           ; point there.
		djnz .loop         ; round again.
		ret

inishr:	
		ld hl,SHRAPN        ; table.
		ld de,SHRAPN+1        ; distance to next.
		ld (hl),255
		ld bc,(NUMSHR*SHRSIZ)-1         ; shrapnel pieces to process.
		ldir 
		ret
	   
; Check for collision between laser and sprite.

lcol:
		ld hl,SHRAPN        ; shrapnel table.
		ld de,SHRSIZ        ; size of each particle.
		ld b,NUMSHR         ; number of pieces in table.
.loop:
		ld a,(hl)           ; get type.
		and a               ; is this slot a laser?
		jr z,.chkcol          ; yes, check collision.
.nxtshr:
		add hl,de           ; point to more shrapnel.
		djnz .loop          ; repeat for all shrapnel.
		ret                 ; no collision, carry not set.
.chkcol:
		push hl             ; store pointer to laser.
		inc hl              ; direction.
		inc hl              ; not used.
		inc hl              ; x position.
		ld a,(hl)           ; get x.
		sub (ix+X)          ; subtract sprite x.
;lcolh:
		cp 16               ; within range?
		jr nc,.missed         ; no, missed.
		inc hl              ; not used.
		inc hl              ; y position.
		ld a,(hl)           ; get y.
		sub (ix+Y)          ; subtract sprite y.
		cp 16               ; within range?
		jr c,.exit          ; yes, collision occurred.
.missed:
		pop hl              ; restore laser pointer from stack.
		jr .nxtshr
.exit:
		pop hl              ; restore laser pointer.
		ret                 ; return with carry set for collision.

	endif
	
; Main game engine code starts here.

game:

	if PFLAG
		call inishr         ; initialise particle engine.
	endif
evintr:
	di
		call evnt12         ; call intro/menu event.

		ld hl,MAP           ; block properties.
		ld c,3     			; 3 * 256 bytes
		ld a,WALL			; fill value
		call fastfill

	if OFLAG
		call clrobjlst
	endif
		call clrscrmap

	if OFLAG
		call iniob          ; initialise objects.
	endif
		xor a               ; put zero in accumulator.
		ld (gamwon),a       ; reset game won flag.

		ld hl,score         ; score.
		call inisc          ; init the score.
mapst:
		ld a,(stmap)        ; start position on map.
		ld (roomtb),a       ; set up position in table, if there is one.
inipbl:
	if AFLAG
		ld hl,eop          ; reset blockpointer
		; ld (pbptr+1),hl
		ld (pblkptr),hl
	endif
 
		call initsc         ; set up first screen.
		ld ix,ssprit        ; default to spare sprite in table.
evini:  

		call evnt13         ; initialisation. (GAMEINIT)

; Two restarts.
; First restart - clear all sprites and initialise everything.

rstrt:
		call rsevt          ; restart events (evnt14 - RESTARTSCREEN).
		call xspr           ; clear sprite table.
		call sprlst         ; fetch pointer to screen sprites.
		call ispr           ; initialise sprite table.
		jr rstrt0

; Second restart - clear all but player, and don't initialise him.

rstrtn:
		call rsevt          ; restart events (evnt14 - RESTARTSCREEN).
		call nspr           ; clear all non-player sprites.
		call xspr0
		call sprlst         ; fetch pointer to screen sprites.
		call kspr           ; initialise sprite table, no more players.

; Set up the player and/or enemy sprites.

rstrt0: 
		xor a               ; zero in accumulator.
		ld (nexlev),a       ; reset next level flag.
		ld (restfl),a       ; reset restart flag.
		ld (deadf),a        ; reset dead flag.
		; ld (nohide),a		; enable screen hiding		
		
	if PFLAG
		call delshr			; erases all particles from screen
	endif
	if OFLAG
		call robjs			; removes all present objects from screen
	endif
		call droom          ; show screen layout.
rpblc0: 
	if AFLAG
		call rbloc          ; draw blocks for this screen
	endif
	if PFLAG
		call inishr         ; initialise particle engine.
	endif
	if OFLAG
		call shwob          ; draw objects.
	endif
mloop:
		call vsync          ; synchronise with display.
		call dumpspr
		
	ifdef DEBUG
		BORDER 9
	endif
	   
		ld ix,ssprit        ; point to spare sprite for spawning purposes.
evlp1:  
		call evnt10         ; MAINLOOP1: called once per main loop.
		call pspr           ; process sprites.
		
; Main loop events.
		ld ix,ssprit        ; point to spare sprite for spawning purposes.
evlp2:  
	ifdef DEBUG
		BORDER 8
	endif
		call evnt11         ; MAINLOOP2: called once per main loop.
	ifdef DEBUG
		BORDER 14
	endif
		
		ld ix,sprtab
		call chkimg
		
		ld a,(nexlev)       ; finished level flag.
		and a               ; has it been set?
		jr nz,newlev        ; yes, go to next level.
		ld a,(gamwon)       ; finished game flag.
		and a               ; has it been set?
		jr nz,evwon         ; yes, finish the game.
		ld a,(restfl)       ; finished level flag.
		dec a               ; has it been set?
		jp z,rstrt          ; yes, go to next level.
		dec a               ; has it been set?
		jp z,rstrtn         ; yes, go to next level.
		ld a,(deadf)        ; dead flag.
		and a               ; is it non-zero?
		jr nz,pdead         ; yes, player dead.
		
		ld hl,frmno         ; game frame.
		inc (hl)            ; advance the frame.
; Back to start of main loop.
qoff:	
		jp mloop            ; switched to a jp nz,mloop during test mode.
		
;----------------------------------------------------------
; Read blocks from list and update screen accordingly.
;----------------------------------------------------------

	if AFLAG
	
rbloc:
;pbbuf:
		ld de,eop             ; check for last block
rbloc2:
		; ld hl,(pbptr+1)
		ld hl,(pblkptr)
		or a
		sbc hl,de
		ret z
rbloc1:
		ex de,hl
		ld a,(scno)
		cp (hl)                ;pbbuf
		jr nz,rbloc0
		push hl
		inc hl
		ld de,dispx
		ldi                    ;dispx
		ldi                    ;dispy
		ld a,(hl)
		call pattr2            ; draw block
		pop hl
rbloc0:
		ld de,4
		add hl,de              ; point to next block
		ex de,hl
		jr rbloc2
    
	endif

	
newlev:
		ld a,(scno)         ; current screen.
		ld hl,numsc         ; total number of screens.
		inc a               ; next screen.
		cp (hl)             ; reached the limit?
		jr nc,evwon         ; yes, game finished.
		ld (scno),a         ; set new level number.
		jp rstrt            ; restart, clearing all aliens.
evwon:
		call evnt18         ; game completed.
		jp tidyup           ; tidy up and return to BASIC/calling routine.

; Player dead.

pdead:
		xor a               ; zeroise accumulator.
		ld (deadf),a        ; reset dead flag.
evdie:
		call evnt16         ; death subroutine.
		ld a,(numlif)       ; number of lives.
		and a               ; reached zero yet?
		jp nz,rstrt         ; restart game.
		call dissprs
		call evnt17         ; failure event.
tidyup: 
		ld hl,hiscor        ; high score.
		ld de,score         ; player's score.
		ld b,6              ; digits to check.
.tidyu2 
		ld a,(de)           ; get score digit.
		cp (hl)             ; are we larger than high score digit?
		jr c,tidyu0         ; high score is bigger.
		jr nz,tidyu1        ; score is greater, record new high score.
		inc hl              ; next digit of high score.
		inc de              ; next digit of score.
		djnz .tidyu2         ; repeat for all digits.
tidyu0:
		jp game
tidyu1:
		ld hl,score         ; score.
		ld de,hiscor        ; high score.
		ld bc,6             ; digits to copy.
		ldir                ; copy score to high score.
		call dissprs
		call evnt19         ; new high score event.
		jr tidyu0           ; tidy up.

; Restart event.

rsevt:
		ld ix,ssprit        ; default to spare element in table.
evrs:
		jp evnt14           ; call restart event.

; Copy number passed in a to string position bc, right-justified.

num2ch ld l,a              ; put accumulator in l.
       ld h,0              ; blank high byte of hl.
       ld a,32             ; leading spaces.
numdg3 ld de,100           ; hundreds column.
       call numdg          ; show digit.
numdg2 ld de,10            ; tens column.
       call numdg          ; show digit.
       or 16               ; last digit is always shown.
       ld de,1             ; units column.
numdg  and 48              ; clear carry, clear digit.
numdg1 sbc hl,de           ; subtract from column.
       jr c,numdg0         ; nothing to show.
       or 16               ; something to show, make it a digit.
       inc a               ; increment digit.
       jr numdg1           ; repeat until column is zero.
numdg0 add hl,de           ; restore total.
       cp 32               ; leading space?
       ret z               ; yes, don't write that.
       ld (bc),a           ; write digit to buffer.
       inc bc              ; next buffer position.
       ret
num2dd ld l,a              ; put accumulator in l.
       ld h,0              ; blank high byte of hl.
       ld a,32             ; leading spaces.
       ld de,100           ; hundreds column.
       call numdg          ; show digit.
       or 16               ; second digit is always shown.
       jr numdg2
num2td ld l,a              ; put accumulator in l.
       ld h,0              ; blank high byte of hl.
       ld a,48             ; leading spaces.
       jr numdg3

inisc  ld b,6              ; digits to initialise.
inisc0 ld (hl),'0'         ; write zero digit.
       inc hl              ; next column.
       djnz inisc0         ; repeat for all digits.
       ret


; Multiply h by d and return in hl.

imul:   
		ld e,d              ; HL = H * D
		ld c,h              ; make c first multiplier.
imul0:
		ld hl,0             ; zeroise total.
		ld d,h              ; zeroise high byte.
		ld b,8              ; repeat 8 times.
.loop:
		rr c                ; rotate rightmost bit into carry.
		jr nc,.imul2         ; wasn't set.
		add hl,de           ; bit was set, so add de.
		and a               ; reset carry.
.imul2:
		rl e                ; shift de 1 bit left.
		rl d
		djnz .loop          ; repeat 8 times.
		ret

; Divide d by e and return in d, remainder in a.

idiv:
		xor a
		ld b,8              ; bits to shift.
.loop:
		sla d               ; multiply d by 2.
		rla                 ; shift carry into remainder.
		cp e                ; test if e is smaller.
		jr c,.nodiv          ; e is greater, no division this time.
		sub e               ; subtract it.
		inc d               ; rotate into d.
.nodiv:
		djnz .loop
		ret

	
	if OFLAG

; Objects handling.
; 64 bytes for image
; 3 for room, x and y
; 3 for starting room, x and y.
; 254 = disabled.
; 255 = object in player's pockets.

; Show items present.

	if DISTYPE=ROM
	
shwob:
		ld hl,objatr        ; objects attribute table.		
		ld a,(numob)        ; number of objects in the game.
		ld b,a              ; loop counter.
.loop0:
		push bc             ; store count.
		push hl             ; store item pointer.
		ld a,(numob)
		sub b				; need to invert object counter
		ld (curobj),a
		ld a,(scno)         ; current location.
		cp (hl)             ; same as an item?
		call z,dobj         ; yes, display object in colour.
		pop hl              ; restore pointer.
		pop bc              ; restore counter.
		ld de,ODTSIZ		; distance to next item.
		add hl,de           ; point to it.
		djnz .loop0         ; repeat for others.
		ret

	else
	
shwob:
		ld hl,objdta        ; objects table.
		ld de,OBJSIZ-ODTSIZ ; distance to room number.
		add hl,de           ; point to room data.
		ld a,(numob)        ; number of objects in the game.
		ld b,a              ; loop counter.
.loop0:
		push bc             ; store count.
		push hl             ; store item pointer.
		ld a,(numob)
		sub b				; need to invert object counter
		ld (curobj),a
		ld a,(scno)         ; current location.
		cp (hl)             ; same as an item?
		call z,dobj         ; yes, display object in colour.
		pop hl              ; restore pointer.
		pop bc              ; restore counter.
		ld de,OBJSIZ        ; distance to next item.
		add hl,de           ; point to it.
		djnz .loop0         ; repeat for others.
		ret

	endif

; Display object.
; hl must point to object's room number.

	if DISTYPE=ROM
	
dobj:   
		inc hl						; point to y.
		ld de,dispx         		; coordinates.
		ld a,(hl)
		cp MSX_MAXCY+1
		ret nc						; don't draw if it's out of boundaries
		ldi                 		; transfer y coord.
		ldi                 		; transfer x too.
		call objimg			; gets object image address in HL
putobj:
		push hl             ; store object graphic address.
		call wobj			; preserves visible object coords in list
		call scadd          ; get screen address in hl.
		set 6,h				; set write permanently
		ld a,l
		di					;
		out (MSX_VDPCW),a
		ld a,h
		ei	
		out (MSX_VDPCW),a   ;
		ld c,MSX_VDPDRW		
		ex de,hl            ; switch regs. DE=VRAM
		pop hl              ; restore graphic address. HL=graphics, DE=VRAM
		call putrow0		; 1st pattern row
		inc d				; row increased
		call putrow			; 2nd pattern row
		dec d				; back again to 1st row
		set 5,d				; point to color area
		call putrow			; 1st color row
		inc d				; row increased and process color row
putrow:
		ld a,e
		di					;
		out (MSX_VDPCW),a
		ld a,d
		ei	
		out (MSX_VDPCW),a   ;
putrow0:
		ld b,16
.loop:
		outi
		jp nz,.loop
		ret
;
; calculates object image address from object number
;
; Input:
;	A = object number
; Output:
;	HL = object image address
;
objimg:
		ld d,0
		ld a,(curobj)
		ld e,a
		rrca
		rrca
		ld l,a			
		and $3F			
		ld h,a			
		ld a,l			
		and $C0			
		ld l,a			; n * 64
		add hl,de
		ex de,hl		; DE=n*65
		add hl,hl		; HL=n*2
		add hl,de		; HL=n*65 + n*2
		ld de,objdta+3
		add hl,de		; point to image.		
		ret

	else
	
dobj:   
		inc hl						; point to x.
		ld de,dispx         		; coordinates.
		ld a,(hl)
		cp MSX_MAXCY+1
		ret nc						; don't draw if it's out of boundaries
		ldi                 		; transfer y coord.
		ldi                 		; transfer x too.
		ld de,-(OBJSIZ-(ODTSIZ/2))	; distance needed to restore image pointer.
		add hl,de           		; point to image.
putobj:
		push hl             ; store sprite graphic address.
		call wobj			; preserves visible object coords in list
		call scadd          ; get screen address in hl.
		set 6,h
		ld a,l
		di					;
		out (MSX_VDPCW),a
		ld a,h
		ei	
		out (MSX_VDPCW),a   ;
		ld c,MSX_VDPDRW		
		ex de,hl            ; switch regs. DE=VRAM
		pop hl              ; restore graphic address. HL=graphics, DE=VRAM
		call putrow0		; 1st pattern row
		inc d				; row increased
		call putrow			; 2nd pattern row
		dec d				; back again to 1st row
		set 5,d				; point to color area
		call putrow			; 1st color row
		inc d				; row increased and process las color row
putrow:
		ld a,e
		di					;
		out (MSX_VDPCW),a
		ld a,d
		ei	
		out (MSX_VDPCW),a   ;
putrow0:
		ld b,16
.loop:
		outi
		jp nz,.loop
		ret

	endif
	
	
; Remove an object (REMOVEOBJECT).

remob:
		ld hl,numob         ; number of objects in game.
		cp (hl)             ; are we checking past the end?
		ret nc              ; yes, can't get non-existent item.
		push af             ; remember object.
		call getob          ; pick it up if we haven't already got it.
		pop af              ; retrieve object number.
		call gotob          ; get its address.
		ld (hl),254         ; remove it.
		ret

; Pick up object number held in the accumulator (GET).

getob:  
		ld (curobj),a		; preserves object number
		ld hl,numob         ; number of objects in game.
		cp (hl)             ; are we checking past the end?
		ret nc              ; yes, can't get non-existent item.
		call gotob          ; check if we already have it.
		ret z               ; we already do.
		ex de,hl            ; object address in de.
		ld hl,scno          ; current screen.
		cp (hl)             ; is it on this screen?
		ex de,hl            ; object address back in hl.
		jr nz,.notinscr        ; not on screen, so nothing to delete.
		ld (hl),255         ; pick it up.
		ld hl,(blkptr)      ; blocks.
		ld (grbase),hl      ; set graphics base.		
		jp robj
.notinscr:
		ld (hl),255         ; pick it up.
		ret

;
; Returns pointers over dispx & object coords list
; Input:
;	curobj = object number
; Output:
;	HL = dispx
;	DE = Object's pointer
;
objptr:
		ld a,(curobj)
		add a,a
		ld e,a
		ld d,(objlist >> 8) & $FF
		ld hl,dispx
		ret

;
; Stores current coords in object coords list
; Input:
;	curobj = object number
; Output:
;	None. Object's coords filled with dispx/y
;
wobj:
		call objptr
		ldi
		ldi					; stores dispxy to objects coords list
		ret

;
; Removes object from objects list restoring background		
;		
; Input:
; 	curobj = object number to delete
; Output:
;	None. Object's coords erased with $FF
; Modifies: All
;		
robj:
		call objptr
		ld a,(de)			
		cp 255
		ret z				; if dispx=255, there's no object displayed
		ex de,hl	
		ldi				
		ldi					; restores to dispxy stored objects coords
		dec hl
		dec hl
		ld (hl),255			; clear stored dispx, object deleted
		call gp2tp
		ld de,scrmap
		call pradd
		add hl,de
		ld a,(hl)			; gets old block from screen map buffer
		push hl
		call pchr
		pop hl
		inc hl
		ld a,(hl)
		push hl
		call pchr
		dec (hl)
		dec (hl)
		dec hl
		inc (hl)
		pop hl
		ld de,31
		add hl,de
		ld a,(hl)
		push hl
		call pchr
		pop hl
		inc hl
		ld a,(hl)
		jp pchr

;
; Removes all objects from objects list restoring background		
;		
; Input:
; 	None
; Output:
;	None. All object's dispx in objects list erased with $FF		
		
robjs:
		ld hl,(blkptr)      ; blocks.
		ld (grbase),hl      ; set graphics base.
		ld a,(numob)
		ld b,a
.loop:
		push bc
		ld a,b
		dec a
		ld (curobj),a
		call robj			; erase object restoring bg
		pop bc
		djnz .loop
		ret

; Drop object number at (dispx, dispy).

	if DISTYPE=ROM

drpob:
		ld (curobj),a		; preserves object number
		ld hl,numob         ; number of objects in game.
		cp (hl)             ; are we checking past the end?
		ret nc              ; yes, can't drop non-existent item.
		call gotob          ; make sure object is in inventory.
		ld a,(scno)         ; screen number.
		cp (hl)             ; already on this screen?
		ret z               ; yes, nothing to do.
		ld (hl),a           ; bring onto screen.
		inc hl              ; point to x coord.
		
		ld a,(dispx)        ; object y coordinate.
		ld (hl),a           ; set y coord.
		ld c,a
		inc hl              ; point to object x.
		ld a,(dispy)        ; object x coordinate.
		ld (hl),a           ; set the x position.
		ld a,c
		cp MSX_MAXCY+1
		ret nc				; don't draw object if it's out of boundaries

		ld a,(curobj)
		call objimg
		jp putobj           ; draw object.

	else
	
drpob:
		ld (curobj),a		; preserves object number
		ld hl,numob         ; number of objects in game.
		cp (hl)             ; are we checking past the end?
		ret nc              ; yes, can't drop non-existent item.
		call gotob          ; make sure object is in inventory.
		ld a,(scno)         ; screen number.
		cp (hl)             ; already on this screen?
		ret z               ; yes, nothing to do.
		ld (hl),a           ; bring onto screen.
		inc hl              ; point to x coord.
		
		ld a,(dispx)        ; object y coordinate.
		ld (hl),a           ; set y coord.
		ld c,a
		inc hl              ; point to object x.
		ld a,(dispy)        ; object x coordinate.
		ld (hl),a           ; set the x position.
		ld a,c
		cp MSX_MAXCY+1
		ret nc				; don't draw object if it's out of boundaries
		
		ld de,-66           ; minus graphic size.
		add hl,de           ; point to graphics.
		jp putobj           ; draw object.

	endif
	

; Seek objects at sprite position.

	if DISTYPE=ROM
	
skobj:
		ld de,ODTSIZ        ; size of each object.
		ld hl,objatr
		ld a,(numob)        ; number of objects in game.
		ld b,a              ; set up the loop counter.
.sk0: 
		ld a,(scno)         ; current room number.
		cp (hl)             ; is object in here?
		call z,.sk1       	; yes, check coordinates.
		add hl,de           ; point to next object in table.
		djnz .sk0         	; repeat for all objects.
		ld a,255            ; end of list and nothing found, return 255.
		ret
.sk1: 
		inc hl              ; point to y coordinate.
		ld a,(hl)           ; get coordinate.
		sub (ix+3)          ; subtract sprite y.
		add a,MSX_SPRVS-1	; add sprite height minus one.
		cp MSX_SPRVS+16-1   ; within range?
		jp nc,.sk2        	; no, ignore object.
		inc hl              ; point to x coordinate now.
		ld a,(hl)           ; get coordinate.
		sub (ix+4)          ; subtract the sprite x.
		add a,MSX_SPRHS-1   ; add sprite width minus one.
		cp MSX_SPRHS+16-1   ; within range?
		jp nc,.sk3        	; no, ignore object.
		pop de              ; remove return address from stack.
		ld a,(numob)        ; objects in game.
		sub b               ; subtract loop counter.
		ret                 ; accumulator now points to object.
.sk3:
		dec hl              ; back to y position.
.sk2:
		dec hl              ; back to room.
		ret

	else
	
skobj:
		ld hl,objdta        ; pointer to objects.
		ld de,OBJSIZ-ODTSIZ ; distance to room number.
		add hl,de           ; point to room data.
		ld de,OBJSIZ        ; size of each object.
		ld a,(numob)        ; number of objects in game.
		ld b,a              ; set up the loop counter.
.sk0: 
		ld a,(scno)         ; current room number.
		cp (hl)             ; is object in here?
		call z,.sk1       	; yes, check coordinates.
		add hl,de           ; point to next object in table.
		djnz .sk0         	; repeat for all objects.
		ld a,255            ; end of list and nothing found, return 255.
		ret
.sk1: 
		inc hl              ; point to x coordinate.
		ld a,(hl)           ; get coordinate.
		sub (ix+3)          ; subtract sprite x.
		add a,15            ; add sprite height minus one.
		cp 31               ; within range?
		jp nc,.sk2        	; no, ignore object.
		inc hl              ; point to y coordinate now.
		ld a,(hl)           ; get coordinate.
		sub (ix+4)          ; subtract the sprite y.
		add a,15            ; add sprite width minus one.
		cp 31               ; within range?
		jp nc,.sk3        	; no, ignore object.
		pop de              ; remove return address from stack.
		ld a,(numob)        ; objects in game.
		sub b               ; subtract loop counter.
		ret                 ; accumulator now points to object.
.sk3:
		dec hl              ; back to y position.
.sk2:
		dec hl              ; back to room.
		ret

	endif
	
	endif
	
	if (OFLAG or MFLAG)
		
;-----------------------------------------------------------------
; Got object check.
; Call with object in accumulator, returns zero set if in pockets.
;
; Input:
;  A = object number
;-----------------------------------------------------------------

gotob:
		ld hl,numob         ; number of objects in game.
		cp (hl)             ; are we checking past the end?
		jr nc,.gotob0       ; yes, we can't have a non-existent object.
		call findob         ; find the object.
.gotob1:
		cp 255              ; in pockets?
		ret
.gotob0:
		ld a,254            ; missing.
		jr .gotob1

; Find object address

	if DISTYPE=ROM
	
findob:
		ld h,0
		ld l,a
		add hl,hl
		ADD_HL_A
		ld de,objatr
		add hl,de
		ld a,(hl)
		ret

	else
	
findob:
		ld hl,objdta        ; objects.
		ld de,OBJSIZ        ; size of each object (64+6)
		and a               ; is it zero?
		jr z,.fndob1        ; yes, skip loop.
		ld b,a              ; loop counter in b.
.fndob2:
		add hl,de           ; point to next one.
		djnz .fndob2        ; repeat until we find address.
.fndob1:
		ld e,OBJSIZ-ODTSIZ  ; distance to room it's in (0-63 obj.data, 64 room)
		add hl,de           ; point to room.
		ld a,(hl)           ; fetch status.
		ret

	endif
	
	endif


;
; Fills a box of values 255 in screenmap
;
; Input:
;	dispx: y coord (0-191)
;	dispy: x coord (0-255)
;	dirthig: height of the box
;	dirthig+1: width of the box		
; Output:
; 	None. box is filled in scrmap
; Modifies:
;	None
;

/* dirtybox:
		push hl
		push de
		push bc
		ld de,scrmap
		call chradd
		add hl,de
		ld de,32
		ld bc,(dirthig)
		ld a,b
.looprows:	
		push hl
.loopcols:		
		ld (hl),255
		inc hl
		djnz .loopcols
		pop hl		
		add hl,de
		ld b,a		
		dec c
		jr nz,.looprows		
		pop bc
		pop de
		pop hl
		ret
 */	   

; Spawn a new sprite.

spawn:
		ld hl,sprtab        ; sprite table.
numsp1:
		ld a,NUMSPR         ; number of sprites.
		ld de,TABSIZ        ; size of each entry.
.nxtslot:
		ex af,af            ; store loop counter.
		ld a,(hl)           ; get sprite type.
		inc a               ; is it an unused slot?
		jr z,.spaw1         ; yes, we can use this one.
		add hl,de           ; point to next sprite in table.
		ex af,af            ; restore loop counter.
		dec a               ; one less iteration.
		jr nz,.nxtslot      ; keep going until we find a slot.
; Didn't find one but drop through and set up a dummy sprite instead.
.spaw1:
		push ix             ; existing sprite address on stack.
		ld (spptr),hl       ; store spawned sprite address.
		ld (hl),c           ; set the type.
		inc hl              ; point to image.
		ld (hl),b           ; set the image.
		inc hl              ; next byte.

		ld a,b
		call mapsprite

		ld (hl),0           ; frame zero.
		inc hl              ; next byte.
		ld a,(ix+X)         ; x coordinate.
		ld (hl),a           ; set sprite coordinate.
		inc hl              ; next byte.
		ld a,(ix+Y)         ; y coordinate.
		ld (hl),a           ; set sprite coordinate.
		inc hl              ; next byte.

		ld a,(ix+5)         ; color
		ld (hl),a           ; set sprite color.
		inc hl              ; next byte.
		inc hl
		inc hl
		ld a,(ix+X)         ; x coordinate.
		ld (hl),a           ; set sprite coordinate.
		inc hl              ; next byte.
		ld a,(ix+Y)         ; y coordinate.
		ld (hl),a           ; set sprite coordinate.
		inc hl              ; next byte.

		ld a,(ix+10)        ; direction of original.
		ld (hl),a           ; set the direction.
		inc hl              ; next byte.
		ld b,0
		ld (hl),b           ; reset parameter.
		inc hl              ; next byte.
		ld (hl),b           ; reset parameter.
		inc hl              ; next byte.
		ld (hl),b           ; reset parameter.
		inc hl              ; next byte.
		ld (hl),b           ; reset parameter.
rtssp:
		ld ix,(spptr)       ; address of new sprite.
evis1:
		call evnt09         ; call sprite initialisation event.
		pop ix              ; address of original sprite.

;
; Finds the highest used sprite slot
;

hslot:		
		ld a,255
		ld b,NUMSPR
		ld de,-TABSIZ
		ld hl,sprtab+((NUMSPR-1)*TABSIZ)
.nxtslot:
		cp (hl)
		jr nz,.found
		add hl,de
		djnz .nxtslot
.found		
		ld a,b
		ld (highslot),a
		ret

checkx:
		ld a,e              ; x position.
		cp MSX_MAXROWS      ; off screen?
		ret c               ; no, it's okay.
		pop hl              ; remove return address from stack.
		ret

; Displays the current score. (MSX:OK)

dscor:
		call preprt         ; set up font and print position.
		call checkx         ; make sure we're in a printable range.
		ld a,(prtmod)       ; get print mode.
		and a               ; standard size text?
		jp nz,bscor0        ; no, show double-height.
dscor0:
		push bc             ; place counter onto the stack.
		push hl
		ld a,(hl)           ; fetch character.
		call ptxt           ; display character.
		
		ld hl,dispy         ; y coordinate.
		inc (hl)            ; move along one.
		pop hl
		inc hl              ; next score column.
		pop bc              ; retrieve character counter.
		djnz dscor0         ; repeat for all digits.
		ld hl,(blkptr)      ; blocks.
		ld (grbase),hl      ; set graphics base.
dscor2:
		ld hl,(dispx)       ; general coordinates.
		ld (charx),hl       ; set up display coordinates.
		ret

; Displays the current score in double-height characters.

bscor0 push bc             ; place counter onto the stack.
       push hl
       ld a,(hl)           ; fetch character.
       call bchar          ; display big char.
       pop hl
       inc hl              ; next score column.
       pop bc              ; retrieve character counter.
       djnz bscor0         ; repeat for all digits.
       jp dscor2           ; tidy up line and column variables.

; Adds number in the hl pair to the score.

addsc  ld de,score+1       ; ten thousands column.
       ld bc,10000         ; amount to add each time.
       call incsc          ; add to score.
       inc de              ; thousands column.
       ld bc,1000          ; amount to add each time.
       call incsc          ; add to score.
       inc de              ; hundreds column.
       ld bc,100           ; amount to add each time.
       call incsc          ; add to score.
       inc de              ; tens column.
       ld bc,10            ; amount to add each time.
       call incsc          ; add to score.
       inc de              ; units column.
       ld bc,1             ; units.
incsc  push hl             ; store amount to add.
       and a               ; clear the carry flag.
       sbc hl,bc           ; subtract from amount to add.
       jr c,incsc0         ; too much, restore value.
       pop af              ; delete the previous amount from the stack.
       push de             ; store column position.
       call incsc2         ; do the increment.
       pop de              ; restore column.
       jp incsc            ; repeat until all added.
incsc0 pop hl              ; restore previous value.
       ret
incsc2 ld a,(de)           ; get amount.
       inc a               ; add one to column.
       ld (de),a           ; write new column total.
       cp '9'+1            ; gone beyond range of digits?
       ret c               ; no, carry on.
       ld a,'0'            ; mae it zero.
       ld (de),a           ; write new column total.
       dec de              ; back one column.
       jr incsc2

; Add bonus to score.

addbo  ld de,score+5       ; last score digit.
       ld hl,bonus+5       ; last bonus digit.
       and a               ; clear carry.
       ld bc,6*256+48      ; 6 digits to add, ASCII '0' in c.
addbo0 ld a,(de)           ; get score.
       adc a,(hl)          ; add bonus.
       sub c               ; 0 to 18.
       ld (hl),c           ; zeroise bonus.
       dec hl              ; next bonus.
       cp 58               ; carried?
       jr c,addbo1         ; no, do next one.
       sub 10              ; subtract 10.
addbo1 ld (de),a           ; write new score.
       dec de              ; next score digit.
       ccf                 ; set carry for next digit.
       djnz addbo0         ; repeat for all 6 digits.
       ret

; Swap score and bonus.

swpsb  ld de,score         ; first score digit.
       ld hl,bonus         ; first bonus digit.
       ld b,6              ; digits to add.
swpsb0 ld a,(de)           ; get score and bonus digits.
       ld c,(hl)
       ex de,hl            ; swap pointers.
       ld (hl),c           ; write bonus and score digits.
       ld (de),a
       inc hl              ; next score and bonus.
       inc de
       djnz swpsb0         ; repeat for all 6 digits.
       ret

; Turns graphic coordinates to text ones
; Input:
;	None
; Output:
; 	dispx & dispy updated
gp2tp:
		ld a,(dispx)
		rrca
		rrca
		rrca
		and $1F			
		ld (dispx),a	; stores y/8
		ld a,(dispy)
		rrca
		rrca
		rrca
		and $1F			
		ld (dispy),a	; stores x/8
		ret
		
; Get print address.Returns VRAM address in DE (0000-17FF).
; Requires: y(0-23), x(0-31)
; Must NOT modify HL

gprad:
		ld de,(dispx)		; get y coord
		ld a,d				; y*256
		add a,a				; get x coord
		add a,a				; 
		add a,a				; 
		ld d,e				; x*8
		ld e,a				; (y*256)+(x*8)
		ret		
 
; Get property buffer address of char at (dispx, dispy) in HL (0-767).
; Requires: y(0-23), x(0-31)

pradd:
		ld a,(dispx)        ; y coordinate.
		rrca
		rrca
		rrca
		ld l,a			
		and $1F			
		ld h,a			
		ld a,l			
		and $E0			
		ld l,a				; y * 32
		ld a,(dispy)    	; fetch x coordinate.
		and $1F         	; should be in range 0 - 31.
		ADD_HL_A
		ret		

; Get screen buffer address of char at (dispx, dispy) in hl (0-767).
; Requires: y(0-191), x(0-255)

chradd:
		ld a,(dispx)
		rlca                ; multiply char by 4.
		rlca
		ld l,a              ; store shift in e.
		and 3               ; only want high byte bits.
		ld h,a              ; store in d.
		ld a,l              ; restore shifted value.
		and $FC             ; only want low byte bits.
		ld l,a
		ld a,(dispy)
		and $F8
		rrca
		rrca
		rrca
		ADD_HL_A
		ret

; print char pattern (without color) (MSX:OK)
; A= char
; dispy,dispx = x,y
; fgclr,bgclr		
ptxt:
		rlca                ; find address for the font char
		rlca
		rlca				; multiply char code by 8.
		ld e,a              ; store shift in e.
		and 7               ; only want high byte bits.
		ld d,a              ; store in d.
		ld a,e              ; restore shifted value.
		and 248             ; only want low byte bits.
		ld e,a              ; that's the low byte. DE=CHAR*8
		ld hl,(grbase)      ; address of graphics.
		add hl,de           ; add displacement.
		call gprad          ; get screen address (in DE)
		SETWRT de		
		ld bc,8*256+MSX_VDPDRW
ldirvm0:
		outi				; writes pattern bytes
		jp nz,ldirvm0				
		ld a,e
		di					; 5
		out (MSX_VDPCW),a
		ld a,d
		or $60				; color patterns + write
		ei	
		out (MSX_VDPCW),a   ; (51)
		ld b,8
		ld a,(clratt)
.nxtrow:
		out (MSX_VDPDRW),a	; writes color bytes
		djnz .nxtrow
		ret
		
; Print block with attributes, properties and pixels (saves block if adventure mode).

pattr:
		if AFLAG
		call wbloc          ; save blockinfo	   
		endif

; Print block with attributes, properties and pixels (no saving).
		
pattr2:
		ld b,a              ; store cell in b register for now.
		ld hl,(proptr)      ; pointer to properties.
		ADD_HL_A
		ld c,(hl)           ; fetch byte.
		ld a,c              ; put into accumulator.
		cp COLECT           ; is it a collectable?
		jp nz,pattr1        ; no, carry on as normal.
		ld a,b              ; restore cell.
		ld (colpat),a       ; store collectable block.
pattr1:
		ld de,MAP
		call pradd          ; get property buffer address.
		push hl
		add hl,de
		ld (hl),c           ; write property.		
		ld de,scrmap		; screen buffer
		pop hl
		add hl,de
		ld a,(hl)
		cp b
		jr z, pattrnxt		; skip printing char
 		ld (hl),b		
		ld a,b              ; restore block number.

; Print block.
pchr:
		rlca                ; find address for the block 
		rlca
		rlca
		rlca				; multiply block code by 16
		ld e,a              ; store shift in e.
		and $0F             ; only want high byte bits.
		ld d,a              ; store in d.
		ld a,e              ; restore shifted value.
		and $F0             ; only want low byte bits.
		ld e,a              ; that's the low byte. DE=CHAR*8
		ld hl,(grbase)      ; address of graphics.
		add hl,de           ; add displacement.
		call gprad          ; get screen address (in DE)
		SETWRT de
		ld bc,8*256+MSX_VDPDRW
.ldirvm0:
		outi
		jp nz,.ldirvm0		
		ld a,e
		di					; 5
		out (MSX_VDPCW),a
		ld a,d
		or $60				; color patterns + write
		ei	
		out (MSX_VDPCW),a   ; (51)
		ld b,8
.loop:
		outi
		jp nz,.loop
pattrnxt:		
		ld hl,dispy         ; x coordinate.
		inc (hl)            ; move along one.
		ret

;----------------------------------------------
; Write block
;----------------------------------------------

		if AFLAG
wbloc:
		ld de,(pblkptr)
        ld hl,scno
        ldi                ; write screen.
        ld hl,dispx
        ldi                ; write x position of block.
        ldi                ; write y position of block.
        ld (de),a          ; store block number
        inc de
		
		ld (pblkptr),de
        ret
		endif
	   
; Get room address.

groom:
		ld a,(scno)         ; screen number.
groomx:
		ld de,0             ; start at zero.
		ld hl,(scrptr)      ; pointer to screens.
groom1:
		ld c,(hl)           ; low byte of screen size.
		inc hl              ; point to high byte.
		ld b,(hl)           ; high byte of screen size.
		inc hl              ; next address.
		and a               ; is it the first one?
		jr z,groom0         ; no more screens to skip.
		ex de,hl            ; put total in hl, pointer in de.
		add hl,bc           ; skip a screen.
		ex de,hl            ; put total in de, pointer in hl.
		dec a               ; one less iteration.
		jr groom1           ; loop until we reach the end.
groom0:
		ld hl,(scrptr)      ; pointer to screens.
		add hl,de           ; add displacement.
		ld a,(numsc)        ; number of screens.
		ld d,0              ; zeroise high byte.
		ld e,a              ; displacement in de.
		add hl,de           ; add double displacement to address.
		add hl,de
		ret

; Draw present room.

droom:
		ld a,(wintop)       ; window top.
		ld (dispx),a        ; set x coordinate.
droom2:
		ld hl,(blkptr)      ; blocks.
		ld (grbase),hl      ; set graphics base.
		call groom          ; get address of current room.

		ld de,mapbuf
		call unpack
		; call scunpack	
		
		
		ld hl,mapbuf
		ld a,(winhgt)       ; height of window.
		ld c,a
droom0:
		ld a,(winlft)       ; window left edge.
		ld (dispy),a        ; set cursor position.
		ld a,(winwid)       ; width of window.
		ld b,a
droom1:
		push bc             ; store column counter.
		ld a,(hl)
		inc hl
		push hl             ; store address of cell.
	if MBFLAG
		call drwmeta		; draw metablock
	else
		call pattr2
	endif
		pop hl              ; restore cell address.
		pop bc              ; restore loop counter.
		djnz droom1
		ld a,(dispx)        ; y coord.
		inc a               ; move down one line.
	if MBFLAG
		inc a				; move down one line.
	endif		
		ld (dispx),a        ; set new position.
		dec c
		jr nz,droom0
		jp enascreen

/*
; HL = pointer to packed screen data
; BC = lenght of packed screen data
scunpack:
		xor a               ; zero in accumulator.
		ld (comcnt),a       ; reset compression counter.	
		ex de,hl	
		ld bc,MAPSIZE		
.nxtbyte:		
		ld a,(comcnt)       ; compression counter.
		and a               ; any more to decompress?
		jp nz,.flbyt1        ; yes.
		ld a,(de)           ; fetch next byte.
		inc de              ; point to next cell.
		cp 255              ; is this byte a control code?
		jp nz,.nocom         ; no, this byte is uncompressed.
		ld a,(de)           ; fetch byte type.
		ld (combyt),a       ; set up the type.
		inc de              ; point to quantity.
		ld a,(de)           ; get quantity.
		inc de              ; point to next byte.
.flbyt1:
		dec a               ; one less.
		ld (comcnt),a       ; store new quantity.
		ld a,(combyt)       ; byte to expand.
.nocom:
		ld (hl),a
		cpi
		jp pe,.nxtbyte
		ret
*/
	
; ------------------------------------------------------------------------------------------------------------------------------------------
; Drawing a MetaBlock (4 tiles 8x8 => 16x16)
; param in regA tells the block number to use, if 0 use 0,0,0,0  else use 
; N,N+2 
; N+1,N+3
; ------------------------------------------------------------------------------------------------------------------------------------------
	if MBFLAG
drwmeta:
		ld b,2
drwm01:
		push bc
		push af
		call pattr2		; put block N
		dec (hl)		; decrement X, back to start column
		dec hl
		inc (hl)		; increment y, next line
		pop af
		or a
		jr z, drwm02
		inc a			; put block N+1
drwm02:
		push af
		call pattr2
		dec hl			
		dec (hl)		; decrement Y, back to start line
		pop af
		or a
		jr z,drwm03
		inc a			; put block N+2
drwm03:
		pop bc
		djnz drwm01
		ret
/*

drwmeta:
		ldb	#$02							; columns to be drawn
		pshs	b,a							; [,S]=block number - [1,S]=column counter
DrwM01:	
		jsr	PAttr2						; print block number A at dispX,dispY
		inc	<dispY						; point to next line
		dec	<dispX						; back one column
		lda	,s								; get block number
		beq	DrwM02						; is zero?
		inca									; no, get next block number (for row two)
		sta	,s								; update stack variable
DrwM02:	
		jsr	PAttr2						; print block number A at dispX,dispY
		dec	<dispY						; point to previous line, column is OK
		lda	,s								; get block number
		beq	DrwM03						; is zero?
		inca									; no, point to next block number: N+2
		sta	,s								; update stack variable
DrwM03:	
		dec	1,s							; decrement column counter in stack
		bne	DrwM01						; if not zero, loop for next Column
		puls	a,b,pc						; clean stack and return
*/

	endif
	
	if LFLAG
	
; Ladder down check.

laddd:
		ld l,16
		jr ladd

; Ladder up check.

laddu:
		ld l,15
ladd:
		ld a,(ix+3)         ; y coordinate.
		ld h,(ix+4)         ; x coordinate.
		add a,l            ; look 2 pixels above feet.
		ld l,a              ; coords in hl.

laddv:
		ld (dispx),hl       ; set up test coordinates.
		call tstbl          ; get map address.
		call ldchk          ; standard ladder check.
		ret nz              ; no way through.
		inc hl              ; look right one cell.
		call ldchk          ; do the check.
		ret nz              ; impassable.
		ld a,(dispy)        ; y coordinate.
		and 7               ; position straddling block cells.
		ret z               ; no more checks needed.
		inc hl              ; look to third cell.
	
; Check ladder is available.

ldchk:
		ld a,(hl)           ; fetch cell.
		cp LADDER           ; is it a ladder?
		ret                 ; return with zero flag set accordingly.

	endif
	
; Can go up check.

cangu:
		ld a,(ix+3)         ; y coordinate.
		ld h,(ix+4)         ; x coordinate.
		sub 1               ; look up 1 pixels.
		ld l,a              ; coords in hl.
		ld (dispx),hl       ; set up test coordinates.
		call tstbl          ; get map address.
		call lrchk          ; standard left/right check.
		ret nz              ; no way through.
		inc hl              ; look right one cell.
		call lrchk          ; do the check.
		ret nz              ; impassable.
		ld a,(dispy)        ; y coordinate.
		and 7               ; position straddling block cells.
		ret z               ; no more checks needed.
		inc hl              ; look to third cell.
		jp lrchk          ; do the check.

; Can go down check.

cangd:
		ld a,(ix+3)         ; y coordinate.
		ld h,(ix+4)         ; x coordinate.
numsp3:
		add a,16            ; look down 16 pixels.
		ld l,a              ; coords in hl.
		ld (dispx),hl       ; set up test coordinates.
		call tstbl          ; get map address.
		call plchk          ; block, platform check.
		ret nz              ; no way through.
		inc hl              ; look right one cell.
		call plchk          ; block, platform check.
		ret nz              ; impassable.
		ld a,(dispy)        ; y coordinate.
		and 7               ; position straddling block cells.
		ret z               ; no more checks needed.
		inc hl              ; look to third cell.

; Check platform or solid item is not in way.

plchk:
		ld a,(hl)           ; fetch map cell.
		cp WALL             ; is it passable?
		jr z,lrchkx         ; no.
	if (PFLAG or DFLAG)
		cp FODDER           ; fodder has to be dug.
		jr z,lrchkx         ; not passable.
	endif
		cp PLATFM           ; platform is solid.
		jr z,plchkx         ; not passable.
	if LFLAG
		cp LADDER           ; is it a ladder?
		jr z,lrchkx         ; on ladder, deny movement.
	endif
plchk0:
		xor a               ; report it as okay.
		ret
plchkx:
		ld a,(dispx)        ; x coordinate.
		and 7               ; position straddling blocks.
		jr z,lrchkx         ; on platform, deny movement.
		jr plchk0


; Can go left check.

cangl:
		ld l,(ix+3)         ; y coordinate.
		ld a,(ix+4)         ; x coordinate.
		sub 1               ; look left 1 pixels.
		ld h,a              ; coords in hl.
		jr cangh            ; test if we can go there.

; Can go right check.

cangr:
		ld l,(ix+3)         ; y coordinate.
		ld a,(ix+4)         ; x coordinate.
		add a,16            ; look right 16 pixels.
		ld h,a              ; coords in hl.

cangh:
		ld (dispx),hl       ; set up test coordinates.
cangh2:
		ld b,3              ; default rows to write.
		ld a,l              ; x position.
		and 7               ; does x straddle cells?
		jr nz,cangh0        ; yes, loop counter is good.
		dec b               ; one less row to write.
cangh0:
		call tstbl          ; get map address.
		ld de,MSX_MAXCOLS      ; distance to next cell.
cangh1:
		call lrchk          ; standard left/right check.
		ret nz              ; no way through.
		add hl,de           ; look down.
		djnz cangh1
		ret

; Check left/right movement is okay.

lrchk:
		ld a,(hl)           ; fetch map cell.
		cp WALL             ; is it passable?
		jr z,lrchkx         ; no.
		cp FODDER           ; fodder has to be dug.
		jr z,lrchkx         ; not passable.
always:
		xor a               ; report it as okay.
		ret
lrchkx:
		xor a               ; reset all bits.
		inc a
		ret

	
	if CFLAG
	
; Get collectables.

getcol:
		ld b,COLECT         ; collectable blocks.
		call tded           ; test for collectable blocks.
		cp b                ; did we find one?
		ret nz              ; none were found, job done.
		call gtblk          ; get block.
		call evnt20         ; collected block event.
		jr getcol           ; repeat until none left.

; Get collectable block.

gtblk:
		ld (hl),0           ; make it empty now.
		ld de,MAP           ; map address.
		and a               ; clear carry.
		sbc hl,de           ; find cell number.
		ld a,l              ; get low byte of cell number.
		and MSX_MAXCOLS-1   ; 0 - 31 is column.
		ld d,a              ; store y in d register.
		add hl,hl           ; multiply by 8.
		add hl,hl
		add hl,hl           ; x is now in h.
		ld e,h              ; put x in e.
		ld (dispx),de       ; set display coordinates.
		ld hl,(blkptr)      ; blocks.
		ld (grbase),hl      ; set graphics base.
		xor a
		jp pchr

	endif
	
; Touched deadly block check.
; Returns with DEADLY (must be non-zero) in accumulator if true.

tded:
		ld l,(ix+3)         ; x coordinate.
		ld h,(ix+4)         ; y coordinate.
		ld (dispx),hl       ; set up test coordinates.
		call tstbl          ; get map address.
		ld de,MSX_MAXCOLS-1 ; default distance to next line down.
		cp b                ; is this the required block?
		ret z               ; yes.
		inc hl              ; next cell.
		ld a,(hl)           ; fetch type.
		cp b                ; is this deadly/custom?
		ret z               ; yes.
		ld a,(dispy)        ; horizontal position.
		ld c,a              ; store column in c register.
		and 7               ; is it straddling cells?
		jr z,.tded0          ; no.
		inc hl              ; last cell.
		ld a,(hl)           ; fetch type.
		cp b                ; is this the block?
		ret z               ; yes.
		dec de              ; one less cell to next row down.
.tded0:  
		add hl,de           ; point to next row.
		ld a,(hl)           ; fetch left cell block.
		cp b                ; is this fatal?
		ret z               ; yes.
		inc hl              ; next cell.
		ld a,(hl)           ; fetch type.
		cp b                ; is this fatal?
		ret z               ; yes.
		ld a,c              ; horizontal position.
		and 7               ; is it straddling cells?
		jr z,.tded1          ; no.
		inc hl              ; last cell.
		ld a,(hl)           ; fetch type.
		cp b                ; is this fatal?
		ret z               ; yes.
.tded1:
		ld a,(dispx)        ; vertical position.
		and 7               ; is it straddling cells?
		ret z               ; no, job done.
		add hl,de           ; point to next row.
		ld a,(hl)           ; fetch left cell block.
		cp b                ; is this fatal?
		ret z               ; yes.
		inc hl              ; next cell.
		ld a,(hl)           ; fetch type.
		cp b                ; is this fatal?
		ret z               ; yes.
		ld a,c              ; horizontal position.
		and 7               ; is it straddling cells?
		ret z               ; no.
		inc hl              ; last cell.
		ld a,(hl)           ; fetch final type.
		ret                 ; return with final type in accumulator.


; Fetch block type at (dispx, dispy).
; Input:
; 	dispx = Y coord (0-191)
; 	dispy = X coord (0-255)
; Output:
;	A = block code at (dispx, dispy)
; Modifies:
;	A,HL
tstbl:
		ld a,(dispx)        ; fetch y coord.
		rlca                ; divide by 8,
		rlca                ; and multiply by 32.
		ld h,a              ; store in d.
		and $E0             ; mask off high bits.
		ld l,a              ; low byte.
		ld a,h              ; restore shift result.
		and 3               ; high bits.
		add a,MAP>>8
		ld h,a              ; got displacement in de.
		ld a,(dispy)        ; x coord.
		rra                 ; divide by 8.
		rra
		rra
		and 31              ; only want 0 - 31.
		add a,l             ; add to displacement.
		ld l,a              ; displacement in hl.
		ld a,(hl)           ; fetch byte there.
		ret


; Jump - if we can.
; Requires initial speed to be set up in accumulator prior to call.

jump:
		neg                 ; switch sign so we jump up.
		ld c,a              ; store in c register.
jump0:
		ld a,(ix+13)        ; jumping flag.
		and a               ; is it set?
		ret nz              ; already in the air.
		inc (ix+13)         ; set it.
		ld (ix+14),c        ; set jump height.
		ret

hop:   
		ld a,(ix+13)        ; jumping flag.
		and a               ; is it set?
		ret nz              ; already in the air.
		ld (ix+13),255      ; set it.
		ld (ix+14),0        ; set jump table displacement.
		ret

; Random numbers code.
; Pseudo-random number generator, 8-bit.

random:
		ld hl,seed          ; set up seed pointer.
		ld a,(hl)           ; get last random number.
		ld b,a              ; copy to b register.
		rrca                ; multiply by 32.
		rrca
		rrca
		xor 31
		add a,b
		sbc a,255
		ld (hl),a           ; store new seed.
		ld (varrnd),a       ; return number in variable.
		ret

; Keyboard test routine. (returns NC if pressed)
;
; Checks if a key is pressed
;
; Input:	A=offset
;		D=mask
; Output:	Carry=1 if key not pressed
;		Carry=0 if key is pressed
; Modifies:	A,C
;
ktest:
	push bc
	push hl
	ld bc,0
	ld c,d
	ld hl,CONTROLLER_BUFFER
	add hl,bc
	cp (hl)
	jr z,keypressed
	pop hl
	pop bc
	scf
	ret
keypressed:
	pop hl
	pop bc
	and a
	ret	

;		call MSX_SNSMAT
;		and d
;		ret z
;		scf					; sets C, key NOT pressed
;		ret
;
;chkselect:
;		ld a,(select)
;		or a
;		jr z,.chghz
;		dec a
;		ld (select),a
;		ret nz
;.chghz:
;		bit 6,e
;		ret nz
;		; SELECT key pressed
;		call swaphz
;		; falls through setticks
		
; Sets the number of frames/sec. based on PAL/NTSC setting
; Input:
;	A = (RG9SAV)
; Output:
;	(TICKS) = 50/60
;   (SELECT) = 50/60
;setticks:
;		and 2
;		ld a,50
;		jr nz,.itspal
;		ld a,60
;.itspal:
;		ld (ticks),a
;		ld (select),a
;		ret
;		
;
; Check if STOP key is pressed
;		
;stopselect:
;		ld a,7
;		call MSX_SNSMAT
;		ld e,a
;	ifdef NOBIOS
;		ld a,(biosvars+MSX_MSXVER)      	; version del MSX
;	else
;		ld a,(MSX_MSXVER)      	; version del MSX
;	endif		
;		or a
;		; push de
;		call nz,chkselect
;		; pop de
;		bit 4,e
;		ret nz
;.loop1
;		ld a,7
;		call MSX_SNSMAT
;		and $10
;		jr z,.loop1
;
;.loop2
;		ld a,7
;		call MSX_SNSMAT
;		and $10
;		jr nz,.loop2
;.loop3
;		ld a,7
;		call MSX_SNSMAT
;		and $10
;		jr z,.loop3
;		ret
	
; Joystick and keyboard reading routines.
; A/E/joyval = result bits: 0,fire3,fire2,fire,up,down,left,right

joykey:
;		call stopselect

		ifdef DEBUG
		BORDER 7
		endif

		ld a,(contrl)       ; control flag.
		dec a               ; is it the keyboard?
		jr z,joyjoy1        ; no, it's joystick 1
		dec a               ; joystick 2?
		jr z,joyjoy2        ; read joystick 2

; Control was keyboard (CONTROL=0)

		ld hl,keys+13       ; address of last key.
		jr readkeys

; Control was joystick 1 (CONTROL=1)

joyjoy1:
		ld hl,joykey1+13    ; address of last key.
		jr readkeys

; Control was joystick 2 (CONTROL=2)

joyjoy2:
		ld hl,joykey2+13    ; address of last key.

readkeys:
		ld e,0              ; zero reading.
		ld b,7              ; keys to read.
.loop:
		ld d,(hl)           ; get key from table.
		dec hl
		ld a,(hl)	    ; get row
		dec hl
		call ktest          ; is key pressed (C=0)?
		ccf                 ; complement the result (0=not pressed,1=pressed).
		rl e                ; rotate into reading.
		djnz .loop          ; repeat for all keys.

		ld a,e              ; copy e register to accumulator.
		ld (joyval),a       ; remember value.

		ifdef DEBUG
		BORDER 14
		endif

		ret

joykey1:
	dw $0302,$0308,$0304,$0301	; Direction buttons
	dw $0240,$0540,$060b		; Fire buttons

joykey2:
	dw $0802,$0808,$0804,$0801	; Direction buttons
	dw $0740,$0a40,$0b0b		; Fire buttons


; Display message.

dmsg:	
		ld hl,msgdat        ; pointer to messages.
		call getwrd         ; get message number.
dmsg3:
		call preprt         ; pre-printing stuff.
		call checkx         ; make sure we're in a printable range.
		
		ex de,hl
		call pradd			; find scrmap pointer from dispx,dispy
		push hl				; preserves buffer pointer
		ex de,hl
		push hl				; preserves start of string
		
		ld a,(prtmod)       ; print mode.
		and a               ; standard size?
		jp nz,bmsg1         ; no, double-height text.
dmsg0:	
		push hl             ; store string pointer.
		ld a,(hl)           ; fetch byte to display.
		and 127             ; remove any end marker.
		cp 13               ; newline character?
		jr z,dmsg1
		call ptxt           ; display character.		
		
		call nexpos         ; display position.
		jr nz,dmsg2         ; not on a new line.
		
		call nexlin         ; next line down.
dmsg2:	
		pop hl				
		ld a,(hl)           ; fetch last character.
		rla                 ; was it the end?
		jp nc,.nxtchr

		pop de				; restores start of string
		or a
		sbc hl,de			
		jr nz,.btzero
		ld hl,scrmap
		pop de				; restores scrmap buffer pointer
		add hl,de			; start of string in scrmap
		ld (hl),255                     ; mark as dirty in scrmap
		jp dscor2
.btzero:

		ld b,h
		ld c,l				; get string lenght in BC
		pop de				; restores scrmap buffer pointer
		add hl,de
		ld a,h
		cp 3				; check if end of string is higher than length of map
		jr nc,.wrapped
.strseg:
		ld hl,scrmap
		add hl,de			; start of string in scrmap
		ld d,h
		ld e,l
		inc e
		ld (hl),255                     ; mark as dirty in scrmap
		ldir		
		jp dscor2         	; job done.
.wrapped:	; half of the message is in the bottom and the rest wraps to coord 0,0
		; upper segment
		ld a,l
		or a
		jr z,.bottom
		push hl
		push de
		push bc
		ld c,l
		ld hl,scrmap
		ld de,scrmap+1
		ld (hl),255                     ; mark as dirty in scrmap
		ldir	
		pop bc
		pop de
		pop hl
.bottom:
		; bottom segment
		ld a,c
		sub l
		ld c,a
		inc e
		dec c
		dec c
		jr .strseg
		
.nxtchr:
		inc hl              ; next character to display.
		jp dmsg0
dmsg1:
		ld hl,dispx         ; y coordinate.
		inc (hl)            ; newline.
		ld a,(hl)           ; fetch position.
		cp MSX_MAXROWS		; past screen edge?
		jr c,dmsg4          ; no, it's okay.
		ld (hl),0           ; restart at top.
dmsg4:	inc hl              ; x coordinate.
		ld (hl),0           ; carriage return.
		jr dmsg2
	   


; Display message in big text.

bmsg1:
		ld a,(hl)           ; get character to display.
		push hl             ; store pointer to message.
		and 127             ; only want 7 bits.
		cp 13               ; newline character?
		jr z,.bmsg2
		call bchar          ; display big char.
.bmsg3:
		pop hl              ; retrieve message pointer.
		ld a,(hl)           ; look at last character.
		inc hl              ; next character in list.
		rla                 ; was terminator flag set?
		jr nc,bmsg1         ; no, keep going.

		pop de				; restores start of string
		or a
		sbc hl,de			
		jr nz,.btzero
		ld hl,scrmap
		pop de				; restores scrmap buffer pointer
		add hl,de			; start of string in scrmap
		ld (hl),255			; 1st half
		ld de,32
		add hl,de
		ld (hl),255			; 2nd half
		ret
.btzero:
		; upper half
		ld b,h
		ld c,l				; get string lenght in BC
		ld hl,scrmap
		pop de				; restores scrmap buffer pointer
		add hl,de			; start of string in scrmap
		ld d,h
		ld e,l
		inc de
		ld (hl),255
		push hl
		push bc
		ldir
		; bottom half
		pop bc
		pop hl
		ld de,32
		add hl,de
		ld d,h
		ld e,l
		inc de
		ld (hl),255
		ldir
		ret
.bmsg2:
		ld hl,charx         ; y coordinate.
		inc (hl)            ; newline.
		inc (hl)            ; newline.
		ld a,(hl)           ; fetch position.
		cp MSX_MAXROWS-1		; past screen edge?
		jr c,.bmsg3          ; no, it's okay.
		ld (hl),0           ; restart at top.
		inc hl              ; y coordinate.
		ld (hl),0           ; carriage return.
		jr .bmsg3


; Big character display.

bchar:
		rlca                ; multiply char by 8.
		rlca
		rlca
		ld e,a              ; store shift in e.
		and 7               ; only want high byte bits.
		ld d,a              ; store in d.
		ld a,e              ; restore shifted value.
		and $F8             ; only want low byte bits.
		ld e,a              ; that's the low byte. DE=CHAR*8
		ld hl,(grbase)      ; address of graphics.
		add hl,de           ; add displacement.
		call gprad          ; get screen address (in DE)

/*		
		dec d	
		ld b,2
.nxtchar:		
		inc d
		SETWRT de
		ld c,4
.nxtrow:
		ld a,(hl)
		out (MSX_VDPDRW),a
		inc hl
		dec c
		nop					; VDP slowdown		
		out (MSX_VDPDRW),a
		jr nz,.nxtrow
		djnz .nxtchar
*/

		ld b,2
.nxtchar:		

		ld a,e
		di
		out (MSX_VDPCW),a
		ld a,d
		or $40
		out (MSX_VDPCW),a
		ei	

		ld c,4
.nxtrow:
		ld a,(hl)
		out (MSX_VDPDRW),a
		inc hl
		dec c
		nop					; VDP slowdown		
		out (MSX_VDPDRW),a
		jr nz,.nxtrow
		inc d
		djnz .nxtchar
		
		dec d
		dec d
		ld a,d
		or $60
		ld d,a

		ld a,(clratt)
		ld c,MSX_VDPCW
		ld l,2
nxtchar2:		
        di
        out (c),e
        ei		
        out (c),d
		ld b,8
nxtfile2:
		out (MSX_VDPDRW),a
		djnz nxtfile2
		inc d
		dec l
		jr nz,nxtchar2

/*
		ld b,2
nxtchar2:		

		ld a,e
        di
        out (MSX_VDPCW),a
        ld a,d
		ld c,8
        or 64       		;for write, set bit 6 high
        out (MSX_VDPCW),a
        ei		

		ld a,(clratt)
nxtfile2:
		out (MSX_VDPDRW),a
		dec c
		jr nz,nxtfile2
		inc d
		djnz nxtchar2	
*/

		
bchar1 call nexpos         ; display position.
       jp nz,bchar2        ; not on a new line.
bchar3 inc (hl)            ; newline.
       call nexlin         ; next line check.
bchar2 jp dscor2           ; tidy up line and column variables.

; Display a character. (MSX:OK)

achar:
		ld b,a              ; copy to b.
		call preprt         ; get ready to print.
		ld a,(prtmod)       ; print mode.
		and a               ; standard size?
		ld a,b              ; character in accumulator.
		jp nz,bchar         ; no, double-height text.
		call ptxt           ; display character.
	   
		call nexpos         ; display position.
		jp z,bchar3         ; next line down.
		jp bchar2           ; tidy up.

; Get next print column position.(MSX:OK)

nexpos:
		ld hl,dispy         ; X display position.
		ld a,(hl)           ; get coordinate.
		inc a               ; move along one position.
		and MSX_MAXCOLS-1   ; reached edge of screen?
		
		ld (hl),a           ; set new position.
		dec hl              ; point to y now.
		ret                 ; return with status in zero flag.

; Get next print line position. (MSX:OK)

nexlin inc (hl)            ; newline.
       ld a,(hl)           ; vertical position.
       cp MSX_MAXROWS      ; past screen edge?
       ret c               ; no, still okay.
       ld (hl),0           ; restart at top.
       ret

; Pre-print preliminaries.

preprt: 
		ld de,font-256		; font pointer, skipping first 32 ASCII codes
		ld (grbase),de      ; set up graphics base.
prescr:
		ld de,(charx)       ; display coordinates.
		ld (dispx),de       ; set up general coordinates.
		ret

; On entry: hl points to word list
;           a contains word number.
; Modifies: b,a,hl

getwrd:	; (MSX:OK)
		and a               ; first word in list?
		ret z               ; yep, don't search.
		ld b,a
getwd0:
		ld a,(hl)
		inc hl
		cp 128              ; found end?
		jr c,getwd0         ; no, carry on.
		djnz getwd0         ; until we have right number.
		ret

; Process sprites.
		
pspr:
		ld a,(highslot)
		and a
		ret z				; no sprites, nothing to do
		ifdef DEBUG
		BORDER 6
		endif
		ld b,a
		ld ix,sprtab        ; sprite table.
.loop:
		push bc
		ld a,(ix+0)         ; fetch sprite type.
		cp 9                ; within range of sprite types?
		call c,pspr2        ; yes, process this one.
		ld de,TABSIZ        ; distance to next odd/even entry.
		add ix,de           ; next sprite.
		pop bc
		djnz .loop
		ifdef DEBUG
		BORDER 9
		endif
		ret
pspr2:
		ld (ogptr),ix       ; store original sprite pointer.
		ld h,a
		ld a,(ix+3)			; saves sprite coordinates as backup
		ld (ix+8),a
		ld a,(ix+4)
		ld (ix+9),a
		ld a,h
		call pspr3          ; do the routine.
; rtorg:
		ld ix,(ogptr)       ; restore original pointer to sprite.
; rtorg0:
		ret
pspr3:
		ld hl,evtyp0        ; sprite type events list.
pspr4:
		add a,a             ; double accumulator.
		ADD_HL_A
;
; Makes an indirect jump based on the contents of HL
;
jumphl:	
		ld a,(hl)
		inc hl
		ld h,(hl)
		ld l,a
		jp (hl)

; Address of each sprite type's routine.

evtyp0:	dw evnt00
evtyp1:	dw evnt01
evtyp2:	dw evnt02
evtyp3:	dw evnt03
evtyp4:	dw evnt04
evtyp5:	dw evnt05
evtyp6:	dw evnt06
evtyp7:	dw evnt07
evtyp8:	dw evnt08

; Look for sprites not mapped yet and map them
; Input:
;	None
; Output:
;	None. Sprites mapped
;
chkimg:
		ld a,(highslot)
		and a
		ret z				; no sprites, nothing to do
		ifdef DEBUG
		BORDER 3
		endif
		ld b,a
		ld de,TABSIZ				
.loop:		
		ld a,(ix+0)			; get sprite type
		inc a
		jr z,.nxtspr		; is the sprite active?		
		ld a,(ix+1)		
 		ld c,a
		call gfrm
		ld l,(hl)
		ld h,mapspr>>8		
		ld a,(hl)
		inc a				; has already been mapped?
		jr nz,.nxtspr
		ld a,c
		ex de,hl
 		call mapsprite		; the sprite has not been mapped ($FF), do it now
		ex de,hl
.nxtspr:		
		add ix,de           ; next sprite.
		djnz .loop          ; repeat for remaining sprites.
		ifdef DEBUG
		BORDER 14
		endif
		ret
 
disscreen:
		jp MSX_DISSCR

enascreen:
		jp MSX_ENASCR
		
dissprs:
		ld a,MSX_HIDE_SPRITES	; disable all sprites
		ld hl,MSX_SPRATR
		jp MSX_WRTVRM

;
; Copy data from RAM to VRAM
; Input:
; 	HL: Source in RAM
; 	DE: VRAM address to copy to
;	B: bytes to copy (0-255, 0 is 256 bytes)
; Output:
;	None. 


;		 
ram2vram:
		ld c,MSX_VDPCW
        di
        out (c),e
        set 6,d			; high byte set for write
        ei	
        out (c),d
		dec c 
.loop:		
		[8] outi
		jp nz,.loop
		ret

;
; Copy data from RAM to VRAM
; Input:
; 	HL: Source in RAM
; 	DE: VRAM address to copy to
;	B: bytes to copy (0-255, 0 is 256 bytes)
; Output:
;	None. 
;		 
ram2vram_slow:
		ld c,MSX_VDPCW
        di
        out (c),e
        set 6,d			; high byte set for write
        ei	
        out (c),d
		dec c 
.loop:		
		outi
		jp nz,.loop
		ret

 
buildspr:
		ld a,(highslot)		; max number of sprites being instantiated
		and a
		ret z				; no sprites, nothing to do
		ifdef DEBUG
		BORDER 12
		endif
		ld ix,sprtab
		ld b,a
		ld hl,spratr
		ld (sprptr),hl
.loop:		
		ld a,(ix+0)			; get sprite type
		inc a
		jr nz,.ison			; is the sprite active?
		ld a,MSX_HIDE_SPRITE	; not active
		ld (hl),a			; Y
		inc l
		inc l
		inc l
		jr .nxtspr		
.ison:		
		ld a,(ix+3)			
		dec a				; corrects y MSX sprite coordinate		
		ld (hl),a			; Y
		inc l		
		
		ld a,(ix+4)				
		ld (hl),a			; X	
		inc l

		ex de,hl
		ld a,(ix+1)
		call gfrm
		ld l,(hl)
		ld h,mapspr>>8				
		ld a,(hl)			; gets real frame from mapspr table
		add a,(ix+2)
		add a,a
		add a,a
		ex de,hl
		ld (hl),a			; image number * 4
		inc l
		
		ld a,(ix+5)
		ld (hl),a
.nxtspr:
		inc l		
		ld de,TABSIZ		
		add ix,de           ; next sprite.
		djnz .loop          ; repeat for remaining sprites.
		ld a,MSX_HIDE_SPRITES	; no more sprite from here
		ld (hl),a

; ----------------------------------

sprflick:	
		ld hl,spratr
		ld a,(MSX_STATFL)
		bit 6,a
		jr nz,.flick
		ld a,colltab&$FF
		ld (offset),a
		jr .no5th
.flick:
		; sort sprites into two separate lists (aligned with 5th & not aligned)
		and 31				; get 5th sprite plane number
		ld e,a
		ld a,(highslot)
		cp e
		jr c,.no5th			; 5th has been removed?, no flicker then...
		;
		ex af,af			; save number of sprites in screen
		ld a,e
		ld de,spratr2		; new sprite attribute table
		push de
		ld d,h
		ld e,l
		add a,a
		add a,a				; 5th sprite plane * 4
		add a,e				; DE now points to 5th sprite plane attributes
		ld e,a
		;
		ex af,af			; restores number of sprites in screen
		ld b,a				; number of sprites to check
		ld a,(de)			; 
		ld c,a				; get C=Y-coord of 5th sprite
		ld de,colltab		; aligned with 5th list
.lp:
		ld a,(hl)			; get Y coord of sprite from master sprite attribute table
		sub c				 
		jr nc,.bottom		; compare both Y coords
		neg					; if 5th Y coord is greater, negate the difference
.bottom:		
		cp MSX_SPRVS		; compare the difference with sprite vertical size
		jr nc,.noovlp		; if diff > sprite vertical size, there's no vertical overlapping
		push bc					
		ldi
		ldi
		ldi
		ldi					; store sprite attributes in colltab
		pop bc
		jr .nxt
.noovlp:
		EX_SP_DE			; swaps lists colltab<>spratr2
		push bc
		ldi
		ldi
		ldi
		ldi					; now store sprite attributes in spratr2
		pop bc
		EX_SP_DE			; restores lists pointers
.nxt:
		djnz .lp
		; rotate SAT segments (only 5th related sprites)
		ld c,e
		ld a,(offset)
		add a,16
		cp c
		jr c,.noreset 
		ld a,colltab&$FF
		ld (offset),a		; store offset to split SAT
		ld a,e
		pop de
		jr .fullsat			; SAT is not splitted, only one copy needed		
.noreset:		
		ld (offset),a		; store offset to split SAT
		ld h,d
		ld l,a
		ld a,c
		sub l
		ld c,a
		pop de
		ldir				; copy first half 
		ld a,(offset)
.fullsat:
		sub colltab&$FF
		ld c,a
		ld hl,colltab
		ldir				; copy 2nd half
		ld a,MSX_HIDE_SPRITES	; no more sprite from here
		ld (de),a
		ld hl,spratr2
.no5th:
		ld (sprptr),hl

		ifdef DEBUG
		BORDER 14
		endif

		ret


/*
 ; Could be reworked
		ld hl,spratr
		ld a,(MSX_STATFL)
		bit 6,a
		jp z,.NO5TH
		
		ld e,a
		ld a,(offset)
		or a
		jr z,.NOLDIR
		cp 255
		jr nz,.NOINIT
		ld a,e
		and $3C
		add a,a
		add a,a		
.NOINIT:	
		ld b,0
		ld c,a
		ld de,spratr2
		ldir
.NOLDIR:	
		add a,16
		and $3F
		jp .NORESET
		
.NO5TH:	
		ld a,255
.NORESET:	
		ld (offset),a
		ld (sprptr),hl
*/

dumpspr:
		ld a,(highslot)
		and a
		ret z				; no sprites, nothing to do
		ifdef DEBUG
		BORDER 10
		endif		
		add a,a
		add a,a		
		add a,8
		and $F8				; only send to VRAM multiples of 8 
		ld b,a
		ld hl,(sprptr)
		ld de,MSX_SPRATR
		ifdef FASTVRAMDUMP
		call ram2vram
		else
		call ram2vram_slow
		endif
		ifdef DEBUG
		BORDER 14
		endif
		ret
		
; Drop into screen address routine. (MSX:OK)
; This routine returns in HL a screen address for (dispx, dispy). Must not modify DE

scadd:
		ld a,(dispx)	; 14
		ld l,a			; 5
		and $F8			; 7
		rrca			; 5
		rrca			; 5
		rrca			; 5
		ld h,a			; 5
		ld a,l			; 5
		and $07			; 7
		ld l,a			; 5 HL= ((y/8)*256+y%8)
		ld a,(dispy)	; 14
		and $F8			; 7 A = (x/8)*8
		ADD_HL_A		; 25
		ret	
		
		
; Animates a sprite.

animsp:
		ld hl,frmno         ; game frame.
		and (hl)            ; is it time to change the frame?
		ret nz              ; not this frame.
		ld a,(ix+1)         ; sprite image.
		call gfrm           ; get frame data.
		inc hl              ; point to frames.
		ld a,(ix+2)         ; sprite frame.
		inc a               ; next one along.
		cp (hl)             ; reached the last frame?
		jr c,anims0         ; no, not yet.
		xor a               ; start at first frame.
anims0:
		ld (ix+2),a         ; new frame.
		ret
animbk:
		ld hl,frmno         ; game frame.
		and (hl)            ; is it time to change the frame?
		ret nz              ; not this frame.
		ld a,(ix+1)         ; sprite image.
		call gfrm           ; get frame data.
		inc hl              ; point to frames.
		ld a,(ix+2)         ; sprite frame.
		and a               ; first one?
		jr nz,.rtanb0        ; yes, start at end.
		ld a,(hl)           ; last sprite.
.rtanb0:
		dec a               ; next one along.
		jr anims0           ; set new frame.

; Check for collision with other sprite, strict enforcement.
; Input:
;	C = NUmber of sprite to check for collision
sktyp:  
		ld a,(highslot)
		and a
		ret z				; no sprites, nothing to do
		ifdef DEBUG
		BORDER 4
		endif
	
	if HCFLAG=1
		ld a,(MSX_STATFL)
		and 00100000b		; check hardware sprites collision
		jr z,.nocoll		; no collisions, skip routine
	endif
	
		; There's a collision, find it
		
		ld hl,sprtab        ; sprite table.
.loop: 
		ex af,af            ; store loop counter.
		ld (skptr),hl       ; store pointer to sprite.
		ld a,(hl)           ; get sprite type.
		cp c                ; is it the type we seek?
		jr z,coltyp         ; yes, we can use this one.
.sktyp1: 
		ld hl,(skptr)       ; retrieve sprite pointer.
		
		ld de,TABSIZ        ; size of each entry.
		add hl,de           ; point to next sprite in table.
		
		ex af,af           ; restore loop counter.
		dec a               ; one less iteration.
		jp nz,.loop        ; keep going until we find a slot.
		
		ld hl,0             ; default to ROM address - no sprite.
		ld (skptr),hl       ; store pointer to sprite.
		or h                ; don't return with zero flag set.
.nocoll:
		ifdef DEBUG
		BORDER 6
		endif
		ret                 ; didn't find one.

coltyp:
		ld a,(ix+0)         ; current sprite type.
		cp c                ; seeking sprite of same type?
		jr z,.colty1        ; yes, need to check we're not detecting ourselves.
.colty0:
		ld de,X             ; distance to x position in table.
		add hl,de           ; point to coords.
		
		ld e,(hl)           ; fetch x coordinate.
		inc hl              ; now point to y.
		ld d,(hl)           ; that's y coordinate.

; Drop into collision detection.
;colc16:
		ld a,(ix+X)         ; x coord.
		sub e               ; subtract x.
		jr nc,.colc1a        ; result is positive.
		neg                 ; make negative positive.
.colc1a:
		cp 16               ; within x range?
		jr nc,sktyp.sktyp1        ; no - they've missed.
		ld c,a              ; store difference.
		ld a,(ix+Y)         ; y coord.
		sub d               ; subtract y.
		jr nc,.colc1b        ; result is positive.
		neg                 ; make negative positive.
.colc1b:
		cp 16               ; within y range?
		jr nc,sktyp.sktyp1        ; no - they've missed.
		add a,c             ; add x difference.
		cp 26               ; only 5 corner pixels touching?
		ret c               ; carry set if there's a collision.
		jp sktyp.sktyp1           ; try next sprite in table.
.colty1:
		push ix             ; base sprite address onto stack.
		pop de              ; pop it into de.
		ex de,hl            ; flip hl into de.
		sbc hl,de           ; compare the two.
		ex de,hl            ; restore hl.
		jr z,sktyp.sktyp1   ; addresses are identical.
		jp .colty0

; Display number.
;
disply:
		ld bc,displ0        ; display workspace.
		call num2ch         ; convert accumulator to string.
displ1:
		dec bc              ; back one character.
		ld a,(bc)           ; fetch digit.
		or 128              ; insert end marker.
		ld (bc),a           ; new value.
		ld hl,displ0        ; display space.
		jp dmsg3            ; display the string.

; Initialise screen.
;
initsc:
		ld a,(roomtb)       ; whereabouts in the map are we?
		call tstsc          ; find displacement.
		cp 255              ; is it valid?
		ret z               ; no, it's rubbish.
		ld (scno),a         ; store new room number.
		ret

; Test screen.
;
tstsc:
       ld hl,mapdat-MAPWID ; start of map data, subtract width for negative.
       ld b,a              ; store room in b for now.
       add a,MAPWID        ; add width in case we're negative.
       ld e,a              ; screen into e.
       ld d,0              ; zeroise d.
       add hl,de           ; add displacement to map data.
       ld a,(hl)           ; find room number there.
       ret

; Screen left.
;
scrl:
		ld a,(roomtb)       ; present room table pointer.
		dec a               ; room left.
scrl0:
		call tstsc          ; test screen.
		inc a               ; is there a screen this way?
		ret z               ; no, return to loop.
		ld a,b              ; restore room displacement.
		ld (roomtb),a       ; new room table position.
scrl1:
		call initsc         ; set new screen.
		ld hl,restfl        ; restart screen flag.
		ld (hl),2           ; set it.
		ret
scrr:
		ld a,(roomtb)       ; room table pointer.
		inc a               ; room right.
		jr scrl0
scru:
		ld a,(roomtb)       ; room table pointer.
		sub MAPWID          ; room up.
		jr scrl0
scrd:
		ld a,(roomtb)       ; room table pointer.
		add a,MAPWID        ; room down.
		jr scrl0
		
; Jump to new screen.
;
nwscr:
		ld hl,mapdat        ; start of map data.
		ld bc,256*80        ; zero room count, 80 to search.
nwscr0:
		cp (hl)             ; have we found a match for screen?
		jr z,nwscr1         ; yes, set new point in map.
		inc hl              ; next room.
		inc c               ; count rooms.
		djnz nwscr0         ; keep looking.
		ret
nwscr1:
		ld a,c              ; room displacement.
		ld (roomtb),a       ; set the map position.
		jr scrl1            ; draw new room.


; Gravity processing.
;
grav:
 		ld a,(frmno)
		rrca
		ret c				; only 1/2 of frames		
		ld a,(ix+13)        ; in-air flag.
		and a               ; are we in the air?
		ret z               ; no we are not.
		inc a               ; increment it.
		jp z,ogrv           ; set to 255, use old gravity.
		ld (ix+13),a        ; write new setting.
		rra                 ; every other frame.
		jr nc,grav0         ; don't apply gravity this time.
		ld a,(ix+14)        ; pixels to move.
		cp 16               ; reached maximum?
		jr z,grav0          ; yes, continue.
		inc (ix+14)         ; slow down ascent/speed up fall.
grav0:
		ld a,(ix+14)        ; get distance to move.
		sra a               ; divide by 2.
		and a               ; any movement required?
		ret z               ; no, not this time.
		cp 128              ; is it up or down?
		jr nc,gravu         ; it's up.
gravd:
		ld b,a              ; set pixels to move.
gravd0:
		call cangd          ; can we go down?
		jr nz,gravst        ; can't move down, so stop.
		inc (ix+3)          ; adjust new y coord.
		djnz gravd0
		ret
gravu:
		neg                 ; flip the sign so it's positive.
		ld b,a              ; set pixels to move.
gravu0:
		call cangu          ; can we go up?
		jp nz,ifalls        ; can't move up, go down next.
		dec (ix+3)          ; adjust new y coord.
		djnz gravu0
		ret
gravst:
		ld a,(ix+14)        ; jump pointer high.
		ld (ix+13),0        ; reset falling flag.
		ld (ix+14),0        ; store new speed.
		cp 8                ; was speed the maximum?
evftf:
		jp z,evnt15         ; yes, fallen too far.
		ret

; Old gravity processing for compatibility with 4.6 and 4.7.
;
ogrv:   
		ld e,(ix+14)        ; get index to table.
		ld d,0              ; no high byte.
		ld hl,jtab          ; jump table.
		add hl,de           ; hl points to jump value.
		ld a,(hl)           ; pixels to move.
		cp 99               ; reached the end?
		jr nz,ogrv0         ; no, continue.
		dec hl              ; go back to previous value.
		ld a,(hl)           ; fetch that from table.
		jr ogrv1
ogrv0  inc (ix+14)         ; point to next table entry.
ogrv1  and a               ; any movement required?
       ret z               ; no, not this time.
       cp 128              ; is it up or down?
       jr nc,ogrvu         ; bigger than 128, it's up.	   
ogrvd  ld b,a              ; less than 128, go down. Set pixels to move.
ogrvd0 call cangd          ; can we go down?
       jr nz,ogrvst        ; can't move down, so stop.
       inc (ix+3)          ; adjust new y coord.
       djnz ogrvd0
       ret	   
ogrvu  neg                 ; flip the sign so it's positive.
       ld b,a              ; set pixels to move.
ogrvu0 call cangu          ; can we go up?
       jr nz,ogrv2         ; can't move up, go down next.
       dec (ix+3)          ; adjust new y coord.
       djnz ogrvu0
       ret	   
ogrvst ld e,(ix+14)        ; get index to table.
       ld d,0              ; no high byte.
       ld hl,jtab          ; jump table.
       add hl,de           ; hl points to jump value.
       ld a,(hl)           ; fetch byte from table.
       cp 99               ; is it the end marker?
       ld (ix+13),0        ; reset jump flag.
       ld (ix+14),0        ; reset pointer.
       jp evftf	   
ogrv2  ld hl,jtab          ; jump table.
       ld b,0              ; offset into table.
ogrv4  ld a,(hl)           ; fetch table byte.
       cp 100              ; hit end or downward move?
       jr c,ogrv3          ; yes.
       inc hl              ; next byte of table.
       inc b               ; next offset.
       jr ogrv4            ; keep going until we find crest/end of table.
ogrv3  ld (ix+14),b        ; set next table offset.
       ret

; Initiate fall check.
;
ifall:
		ld a,(ix+13)        ; jump pointer flag.
		and a               ; are we in the air?
		ret nz              ; if set, we're already in the air.
		ld h,(ix+4)         ; y coordinate.
		ld a,16             ; look down 16 pixels.
		add a,(ix+3)        ; add x coordinate.
		ld l,a              ; coords in hl.
		ld (dispx),hl       ; set up test coordinates.
		call tstbl          ; get map address.
		call plchk          ; block, platform check.
		ret nz              ; it's solid, don't fall.
		inc hl              ; look right one cell.
		call plchk          ; block, platform check.
		ret nz              ; it's solid, don't fall.
		ld a,(dispy)        ; x coordinate.
		and 7               ; position straddling block cells.
		jr z,ifalls         ; no more checks needed.
		inc hl              ; look to third cell.
		call plchk          ; block, platform check.
		ret nz              ; it's solid, don't fall.
ifalls:
		inc (ix+13)         ; set in air flag.
		ld (ix+14),0        ; initial speed = 0.
		ret

tfall:
		ld a,(ix+13)        ; jump pointer flag.
		and a               ; are we in the air?
		ret nz              ; if set, we're already in the air.
		call ifall          ; do fall test.
		ld a,(ix+13)        ; get falling flag.
		and a               ; is it set?
		ret z               ; no.
		ld (ix+13),255      ; we're using the table.
		jr ogrv2            ; find position in table.


; Get frame data for a particular sprite.
;
gfrm:
		rlca                ; multiple of 2.
		ld hl,(frmptr)      ; table of sprite frames used by game.
		ADD_HL_A
		ret

; Find sprite list for current room.
;
sprlst:
		ld a,(scno)         ; screen number.
		ld hl,(nmeptr)      ; pointer to enemies.
		ld b,a              ; loop counter in b register.
		and a               ; is it the first screen?
		ret z               ; yes, don't need to search data.
		ld de,NMESIZ        ; bytes to skip.
.loop:
		ld a,(hl)           ; fetch type of sprite.
		inc a               ; is it an end marker?
		jr z,.nxtscr        ; yes, end of this room.
		add hl,de           ; point to next sprite in list.
		jr .loop            ; continue until end of room.
.nxtscr:
		inc hl              ; point to start of next screen.
		djnz .loop          ; continue until room found.
		ret

; Clear all but a single player sprite.
;
nspr:
		ld b,NUMSPR         ; sprite slots in table.
		ld ix,sprtab        ; sprite table.
		ld de,TABSIZ        ; distance to next odd/even entry.
.loop:
		ld a,(ix+0)         ; fetch sprite type.
		and a               ; is it a player?
		jr z,.loop1         ; yes, keep this one.
		ld (ix+0),255       ; remove next type.
.loop1:
		add ix,de           ; next sprite.
		djnz .loop          ; one less space in the table.
		ret
		
; Two initialisation routines.

; HL is already pointing to start of sprites for this screen (nmedat / SPRITEPOSITIONS)
; Initialise sprites - copy everything from list to table.
;
ispr:	
		xor a
		ld (nsprite),a		; reset first sprite frame number in VRAM
		ld b,NUMSPR         ; sprite slots in table.
		ld ix,sprtab        ; sprite table.
.loop2:
		ld a,(hl)
		inc a
		jr z,.exit
.loop1:  
		ld a,(ix+0)         ; next type.
		inc a
		jr z,.copyspr       ; no, process this one.
		ld de,TABSIZ        ; distance to next entry.
		add ix,de           ; next sprite.
		djnz .loop1         ; repeat for remaining sprites.
		jr .exit
.copyspr:
		call cpsp           ; initialise a sprite.
		djnz .loop2         ; one less space in the table.
.exit:
		jp hslot

; HL is already pointing to start of sprites for this screen (nmedat)		
; Initialise sprites - but not player, we're keeping the old one.
;
kspr:	
		xor a
		ld (nsprite),a		; reset first sprite frame number in VRAM		
		ex de,hl
		call dissprs		; hide all sprites
		ex de,hl		
		ld b,NUMSPR         ; sprite slots in table.
		ld ix,sprtab        ; sprite table.
.loop2:  
		ld a,(hl)           ; fetch byte.
		cp 255              ; is it an end marker?
		jr z,.exit          ; yes, no more to do.
		and a               ; is it a player sprite?
		jr nz,.loop1        ; no, add to table as normal.		
		inc hl
		ld a,(hl)			; sprite image number from SPRITEPOSITIONS
		call mapsprite		; no player set but sprite pattern mapped to VRAM
		dec hl		
		ld de,NMESIZ        ; distance to next item in list.
		add hl,de           ; point to next one.
		jr .loop2
.loop1:
		ld a,(ix+0)         ; next type.
		inc a               ; is it enabled yet?
		jr z,.copyspr       ; no, process this one.
		ld de,TABSIZ        ; distance to next odd/even entry.
		add ix,de           ; next sprite.
		djnz .loop1         ; repeat for remaining sprites.
		jr .exit            ; no more room in table.
.copyspr:
		call cpsp           ; copy sprite to table.
		djnz .loop2         ; one less space in the table.
.exit:
		jp hslot

; Copy sprite from list to table.

cpsp:
		ld a,(hl)           ; fetch byte from table.
		ld (ix+0),a         ; set up type.
		inc hl              ; move to next byte.
		ld a,(hl)           ; fetch byte from table.
		ld (ix+1),a         ; set up sprite number.		
		inc hl              ; move to next byte.
		call mapsprite		; remaps RAM sprite number in A to a new VRAM sprite
		ld a,(hl)           ; fetch byte from table (color).
		ld (ix+5),a         ; set up color.
		inc hl              ; move to next byte.
		ld a,(hl)           ; fetch byte from table.
		ld (ix+3),a         ; set up coordinate.
		inc hl              ; move to next byte.
		ld a,(hl)           ; fetch byte from table.
		ld (ix+4),a         ; set up coordinate.
		inc hl		
		xor a               ; zeroes in accumulator.
		ld (ix+2),a         ; reset frame number.
		ld (ix+10),a        ; reset direction.
		ld (ix+13),a        ; reset jump pointer low.
		ld (ix+14),a        ; reset jump pointer high.
		ld (ix+16),255      ; reset data pointer to auto-restore.
		push ix             ; store ix pair.
		push hl             ; store hl pair.
		push bc
		call evnt09         ; perform event.
		pop bc
		pop hl              ; restore hl.
		pop ix              ; restore ix.
		ld de,TABSIZ        ; distance to next entry.
		add ix,de           ; next sprite.
		ret

		; A=image number from SPRITEPOSITION
mapsprite:					; initialize mapspr table
		push hl
		push bc
		call gfrm			; HL = real sprite frames pointer in RAM for sprite number A
		ld a,(hl)			; get real frame in RAM
		and 127				; maximum 128 frames in RAM (correct?)
		ld e,a
		ld d,mapspr>>8		
		ld a,(de)
		inc a
		jr nz,nomap
		ld a,(nsprite)		; gets available sprite frame pointer
		ld (de),a			; maps this to the old image from SPRITEPOSITION
		inc hl
		add a,(hl)			; next sprite frame available after adding frames size
		ld (nsprite),a		; stores it as new available sprite frame
		dec hl				; restore HL pointer to start of frmlst
		call spradr			; HL = sprite frame list position, DE = pointer to actual sprite frame in VRAM, BC = lenght of data		
		call MSX_SETWRT
		ex de,hl			; HL = sprite RAM data address, DE = spriVte RAM data address, BC = lenght of data
nxtsprbyt:		
		ld a,(hl)
		out (MSX_VDPDRW),a
		cpi					; 18
		jp pe,nxtsprbyt		; 11 = 29
nomap:		
		pop bc
		pop hl
		ret
		
; Inputs
; HL = sprite frame list position
; DE = pointer to actual sprite frame in VRAM
spradr:
		ld a,(hl)			; get initial image frame in RAM
		call mult32			; BC= A * 32
		inc hl				; next frmlst position (num framesS)
		ld a,(hl)			; get num frames		
		ex af,af			; saves num frames
		ld hl,sprgfx
		add hl,bc			; HL = sprite RAM data address
		ld a,(de)			; gets destination VRAM sprite frame
		ex de,hl			; DE = now sprite RAM source data address
		call mult32		
		ld hl,MSX_SPRTBL
		add hl,bc			; HL = sprite VRAM destination data address
		ex af,af			; restore num frames		
mult32:		
		rrca                
		rrca
		rrca
		ld c,a              
		and $1F              
		ld b,a              
		ld a,c              
		and $E0             
		ld c,a				; BC = A * 32		
		ret

	if OFLAG
	
clrobjlst:
		ld hl,objlist
		ld c,1     			; 1 * 256 bytes
		ld a,255			; fill value
		jp fastfill
	
	endif
		
clrscrmap:
		ld hl,scrmap
		ld c,3     			; 3 * 256 bytes
		ld a,255			; fill value
;
; fast fills RAM areas starting in addresses multiple of 4 
; Input:	C=number of 256 bytes blocks to fill
;			HL=starting address
;			A=byte for fill			
;
fastfill:
		ld b,64              ;set B to 64 (64 * 4 sets = 256 bytes initiaized)
.loop1:
		ld (hl), a           ;set byte to 255
		inc l                ;move to the next byte
		ld (hl), a
		inc l
		ld (hl), a
		inc l
		ld (hl), a
		inc hl               ;this time we are not sure that inc l will not cause overflow
		djnz .loop1          ;repeat for next 4 bytes
		dec c
		jr nz,fastfill       ;outer loop. repeat for next c*256 bytes.
		ret		
	 
; Clear the play area window.

clw:
	if PFLAG
	
		call inishr
		
	endif
	
		ld hl,(wintop)
		ld (dispx),hl
		call gprad          ; get print address in DE.
		ex de,hl
		ld a,(winhgt)       ; height of window.
		ld b,a
		ld a,(winwid)
		add a,a
		add a,a
		add a,a
		ld c,a
.loop3   
		call MSX_SETWRT
		push bc
		xor a
.loop1:
		out (MSX_VDPDRW),a
		dec c
		jr nz,.loop1
		set 5,h
		call MSX_SETWRT
		pop bc
		push bc
		ld a,(clratt)
.loop2:
		out (MSX_VDPDRW),a
		dec c
		jr nz,.loop2
		pop bc
		res 5,h
		inc h
		djnz .loop3
		ld hl,(wintop)      ; get coordinates of window.
		ld (charx),hl       ; put into display position.
		call clrscrmap
		jp dissprs


	if SFLAG
	
; Effects code.
; Ticker routine is called 25 times per second (MSX:50fps).

scrly:
 	ifdef DEBUG
		BORDER 7
	endif
		ld a,(scrlyoff)
		or a
		ret nz
		ld hl,scrbuf
		ld de,(txtbeg)         ; get screen address.
		ld a,(txtwid)       
		add a,a
		add a,a
		add a,a					; characters*8 wide.
		ld b,a
		ifdef FASTVRAMDUMP
		call ram2vram
		else
		call ram2vram_slow
		endif
 	ifdef DEBUG
		BORDER 14
	endif
		ret
		
scrltxt:
 	ifdef DEBUG
		BORDER 2
	endif
		ld a,(scrlyoff)
		or a
		ret nz
		
		ld a,(txtbit)
		rlca
		jr nc,.nonewchr
		
		ld hl,(txtpos)      ; get text pointer.
		ld a,(hl)           ; find character we're displaying.
		push hl
		and 127             ; remove end marker bit if applicable.
		cp 13               ; is it newline?
		jr nz,.scrly5       ; no, it's okay.
		ld a,32             ; convert to a space instead.
.scrly5:
		rlca
		rlca
		rlca                ; multiply by 8 to find char.
		ld b,a              ; store shift in b.
		and 3               ; keep within 768-byte range of font.
		ld d,a              ; that's our high byte.
		ld a,b              ; restore the shift.
		and 248
		ld e,a
		ld hl,font-256      ; font.
		add hl,de           ; point to image of character.
		ld de,(txtend)
		ld bc,8
		ldir
		pop hl
		ld a,(hl)
		inc hl
		rla
		jr nc,.scrly6        ; not yet - continue.
.scrly4:
		ld hl,(txtini)      ; start of scrolling message.		
.scrly6:
		ld (txtpos),hl      ; new text pointer position.
		ld a,1
.nonewchr:
		ld (txtbit),a

		; Scroll a char row
		ld hl,(txtend)
		ld d,254
		ld c,8
		ld a,(txtwid)       ; characters wide.
		inc a
		ld b,a              ; put into the loop counter.
.rowloop:
		push bc
		push hl
		ld c,0
.colloop:	   
		ld a,(hl)
		rlca
		ld e,a
		and d
		or c
		ld (hl),a
		ld a,e
		and 1
		ld c,a
		
		ld a,l
		sub 8
		jr nc,$+3
		dec	h
		ld l,a

		djnz .colloop
		pop hl
		inc l
		pop bc
		dec c
		jr nz,.rowloop
		
 		ifdef DEBUG
		BORDER 14
		endif
		ret
				
	   ; bc= width*256+msg.number
iscrly: 
		call prescr         ; set up display position.
		ld a,b              ; width.
		dec a               ; subtract one.
		cp MSX_MAXCOLS      ; is it between 1 and 32?
		ret nc              ; TODO:no, disable messages.
		ld d,b
		ld a,c              ; message number.
		ld hl,msgdat        ; text messages.
		call getwrd         ; find message start.
		ld (txtini),hl      ; set initial text position.
		ld (txtpos),hl      ; set initial text position.
		ld a,d
		ld (txtwid),a
		add a,a
		add a,a
		add a,a				; *8
		ld c,a
		ld b,0
		jr nc,.nocarry
		inc b
.nocarry:		
		call gprad          ; get hires print address in DE.
		ld (txtbeg),de
		ld hl,scrbuf
		ex de,hl
		call MSX_LDIRMV
		ld (txtend),de      ; set text screen address.
        ld a,128
        ld (txtbit),a
		xor a	
		ld (scrlyoff),a 
        ret

	endif


	if DFLAG

dig:
       and 3
       jr z,digl
       dec a
       jr z,digr
       dec a
       jr z,digu
       ld h,(ix+4)
       ld a,16
       add a,(ix+3)
       ld l,a
       jr digv
digu   ld a,(ix+3)
       ld h,(ix+4)
       sub 2
       ld l,a
digv   ld (dispx),hl
       call tstbl
       call fdchk
       inc hl
       call fdchk
       ld a,(dispy)
       and 7
       ret z
       inc hl
       jp fdchk
digl   ld l,(ix+3)
       ld a,(ix+4)
       sub 2
       ld h,a
digh   ld (dispx),hl
       ld a,l
       and 7
       ld a,3
       jr nz,digh1
       dec a
digh1  ld b,a
       call tstbl
digh0  push bc
       call fdchk
       ld de,MSX_MAXCOLS
       add hl,de
       pop bc
       djnz digh0
       ret
digr   ld l,(ix+3)
       ld a,(ix+4)
       add a,16
       ld h,a
       jr digh 

	endif

	if CRFLAG

;
; Crumbling blocks routine
; Input:	None
; Output:	None
; Modifies: AF,BC,HL,DE
;

crumble:	
 		ld a,(frmno)
		and CRUMBLING_SPEED
		ret nz				; executed only every 1/8 of frames		
		ld h,(ix+4)			; x coordinate
		ld a,(ix+3)			; y coordinate
		add a,16
		ld l,a
		ld (dispx),hl		
		and 6
		ret nz
		call gp2tp			; dispx/y now has text coords
		call pradd
		ld de,scrmap
		add hl,de	
		ex de,hl
		ld hl,dispy
		ld a,(de)
		cp 9
		call nc,.crumb
		inc (hl)
		inc de
		ld a,(de)
		cp 9
		call nc,.crumb
		inc (hl)
		inc de
		ld a,(ix+4)			; get x coord
		and 7				; multiple of 8?
		ret z				; return (only two blocks crumb) 
		ld a,(de)
		cp 9
		ret c
.crumb:	
		push de
		inc a
		cp 17
		jr c,.noblank		; if block < 17, update it 
		xor a				; else, empty block
.noblank:
		call pattr
		dec (hl)			; undo x+1 position
		pop de
		ret

	endif

	if RTFLAG
	
; User routine for rotational controls.
; To use, set up the angle (0-255) of travel in DIRECTION, then call THRUST with a single parameter for speed (eg THRUST 4).
; This routine uses AIRBORNE and JUMPHEIGHT to store fractional coordinates but leaves SETTINGA and SETTINGB free. 
; Jonathan Cauldwell, 22nd October 2020.

thrust:
		ld b,a                      ; speed in b for now.
		ld (usrspd),a               ; store speed.
		ld l,(ix+13)                ; y fraction.
		ld h,(ix+14)                ; x fraction.
		push hl                     ; store old fractions.

		/*
		ld h,(sintab>>8)&$FF
		ld l,(ix+10)
		ld a,(hl)
		*/
		
		ld hl,sintab                ; sine table.
		ld e,(ix+10)                ; direction.
		ld d,0                      ; no high byte.
		add hl,de                   ; point to entry.
		ld a,(hl)                   ; get the sine.

		ld (usrsgn),a               ; store sign.
		and 127                     ; remove sign.
		ld h,a                      ; copy to first multiplier.
		ld d,b                      ; get speed.
		call imul                   ; multiply together.
		ld e,(ix+13)                ; y fraction.
		ld d,(ix+3)                 ; y integer.
		ld a,(usrsgn)               ; get sign.
		rla                         ; is it negative?
		jr nc,thrust0               ; yes.
		add hl,de                   ; just add.
		jr thrust1                  ; skip subtraction.
thrust0:
		ex de,hl                    ; inertia in hl, force in de.
		sbc hl,de                   ; subtract force.
thrust1:
		ld (ix+3),h                 ; set integer.
		ld (ix+13),l                ; set fraction.
		ld a,(ix+10)                ; direction.
		add a,64                    ; shift 90 degrees to get cosine.
		
		
		/*
		ld h,(sintab>>8)&$FF
		ld l,a
		ld a,(hl)
		*/
		
		ld e,a                      ; displacement to value.
		ld d,0                      ; no high byte.
		ld hl,sintab                ; sine table.
		add hl,de                   ; point to entry.
		ld a,(hl)                   ; get the cosine.
		
		ld (usrsgn),a               ; store sign.
		and 127                     ; remove sign.
		ld h,a                      ; copy to first multiplier.
		ld a,(usrspd)               ; get speed.
		ld d,a                      ; second multiplier.
		call imul                   ; multiply together.
		ld e,(ix+14)                ; x fraction.
		ld d,(ix+4)                 ; x integer.
		ld a,(usrsgn)               ; get sign.
		rla                         ; is it negative?
		jr nc,thrust2               ; yes.
		add hl,de                   ; just add.
		jr thrust3                  ; skip subtraction.
thrust2:
		ex de,hl                    ; inertia in hl, force in de.
		sbc hl,de                   ; subtract force.
thrust3:
		ld (ix+4),h                 ; x set integer.
		ld (ix+14),l                ; x set fraction.
		ld a,4                      ; displacement.
		add a,h                     ; add to integer.
		ld h,a                      ; set horizontal.
		ld a,(ix+3)                 ; get y.
		add a,4                     ; add displacement.
		ld l,a                      ; copy to second coordinate register.
		ld (dispx),hl               ; set coordinates to find.
		call tstbl                  ; check block.
		ld b,2                      ; cells to test vertically.
		ld de,MSX_MAXCOLS-1         ; distance between cell lines minus one.
thrust5:
		ld a,(hl)                   ; get block there.
		cp WALL                     ; is it a wall?
		jr z,thrust4                ; yes, can't move there.
		inc l                       ; next cell.
		ld a,(hl)                   ; get block there.
		cp WALL                     ; is it a wall?
		jr z,thrust4                ; yes, can't move there.
		add hl,de                   ; next row down.
		djnz thrust5                ; repeat for all rows.
		pop hl                      ; restore old fractions.
		ret
thrust4:
		pop hl                      ; restore old fractions.
		ld (ix+13),l                ; reset y.
		ld (ix+14),h                ; reset x.
		ld a,(ix+8)                 ; previous y.
		ld (ix+3),a                 ; restore it.
		ld a,(ix+9)                 ; previous x.
		ld (ix+4),a                 ; restore that too.
		ret
	   
sintab:
		db 0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45
		db 48,51,54,57,59,62,65,67,70,73,75,78,80,82,85,87
		db 89,91,94,96,98,100,102,103,105,107,108,110,112,113,114,116
		db 117,118,119,120,121,122,123,123,124,125,125,126,126,126,126,126
		db 127,126,126,126,126,126,125,125,124,123,123,122,121,120,119,118
		db 117,116,114,113,112,110,108,107,105,103,102,100,98,96,94,91
		db 89,87,85,82,80,78,75,73,70,67,65,62,59,57,54,51
		db 48,45,42,39,36,33,30,27,24,21,18,15,12,9,6,3
		db 128,131,134,137,140,143,146,149,152,155,158,161,164,167,170,173
		db 176,179,182,185,187,190,193,195,198,201,203,206,208,210,213,215
		db 217,219,222,224,226,228,230,231,233,235,236,238,240,241,242,244
		db 245,246,247,248,249,250,251,251,252,253,253,254,254,254,254,254
		db 255,254,254,254,254,254,253,253,252,251,251,250,249,248,247,246
		db 245,244,242,241,240,238,236,235,233,231,230,228,226,224,222,219
		db 217,215,213,210,208,206,203,201,198,195,193,190,187,185,182,179
		db 176,173,170,167,164,161,158,155,152,149,146,143,140,137,134,131
	
	endif
	
	if PFLAG

; some aligned data (256+88 bytes)

	   ALIGN 256
	
dots:		db 128,64,32,16,8,4,2,1   
shrptr:		dw laser          ; laser.
			dw trail          ; vapour trail.
			dw shrap          ; shrapnel from explosion.
			dw dotl           ; horizontal starfield left.
			dw dotr           ; horizontal starfield right.
			dw dotu           ; vertical starfield up.
			dw dotd           ; vertical starfield down.
			dw ptcusr         ; user particle.			
shrsin: 	dw 0,1024,391,946,724,724,946,391
			dw 1024,0,946,65144,724,64811,391,64589
			dw 0,64512,65144,64589,64811,64811,64589,65144
			dw 64512,0,64589,391,64811,724,65144,946


	endif


; User routine.  Put your own code inside user.asm file to be called with USER instruction.
; if USER has an argument it will be passed in the accumulator.
	if UFLAG
	
		include "User.asm"

	endif
	
	include "Pletter_unpack.asm"
	; Music & SFX routines
	include "PT3-ROM.asm"
	include "ayFX-ROM.asm"

	if XFLAG
	
sfxbank:	incbin "..\resources\sfx.afb"
	
	endif	

; Game-specific data and events code generated by the compiler ------------------

; ======================================================================================
;
; BEGINNING OF RAM AREA: The following data needs to be located in RAM!!!
;
; ======================================================================================

; Variables that NEED to be initialized and when in RAM mode can be autoinitialized for free

	if DISTYPE!=ROM

score:		db "000000" 		; player's score  000000 .
hiscor:		db "000000" 		; high score  000000 .
bonus:		db "000000" 		; bonus  000000 .
displ0:		db 0,0,0,13+128

	if EFLAG

sndtyp:		db 0

	endif

	if PFLAG

shrplot:	dw prosh1

	endif

	if SFLAG
	
scrlyoff:	db 1
	
	endif
	
	if MFLAG
	
mod0:	db $C3,0,0
mod1:	db $C3,0,0
mod2:	db $C3,0,0

	endif

	ifdef DATA00
rptr00:		dw rdat00
	endif
	ifdef DATA01
rptr01:		dw rdat01
	endif
	ifdef DATA02
rptr02:		dw rdat02
	endif
	ifdef DATA03
rptr03:		dw rdat03
	endif
	ifdef DATA04
rptr04:		dw rdat04
	endif
	ifdef DATA05
rptr05:		dw rdat05
	endif
	ifdef DATA06
rptr06:		dw rdat06
	endif
	ifdef DATA07
rptr07:		dw rdat07
	endif
	ifdef DATA08
rptr08:		dw rdat08
	endif
	ifdef DATA09
rptr09:		dw rdat09
	endif
	ifdef DATA10
rptr10:		dw rdat10
	endif
	ifdef DATA11
rptr11:		dw rdat11
	endif
	ifdef DATA12
rptr12:		dw rdat12
	endif
	ifdef DATA13
rptr13:		dw rdat13
	endif
	ifdef DATA14
rptr14:		dw rdat14
	endif
	ifdef DATA15
rptr15:		dw rdat15
	endif
	ifdef DATA16
rptr16:		dw rdat16
	endif
	ifdef DATA17
rptr17:		dw rdat17
	endif
	ifdef DATA18
rptr18:		dw rdat18
	endif
	ifdef DATA19
rptr19:		dw rdat19
	endif
	ifdef DATA20
rptr20:		dw rdat20
	endif

; Don't change the order of these four.  Menu routine relies on winlft following wintop.

wintop		db WINDOWTOP		; top of window.
winlft		db WINDOWLFT		; left edge.
winhgt		db WINDOWHGT		; window height.
winwid		db WINDOWWID		; window width.

	endif

	if DISTYPE=ROM		

endprogram:	equ $

	else
	
endprogram:	equ main + ::0

	endif
	
; Fill the rest of the page

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	include "CV_BIOS.asm"
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
/*
	if DISTYPE=ROM

	output rom_filler.bin

	org endprogram
	

		if ($ & $8000)!=0
			block $4000-($-8000h),255
		else
			block $4000-($-4000h),255
		endif
		
	endif
	*/
;
;
;
	output ram_vars.tmp

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;	defpage 0, $8080	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	if DISTYPE=ROM	

		phase $4000 ; ROM model variables that need to be initialized. Minimum 8KB RAM needed

varbegin: equ $	

; Don't change the order of these 5 variables.
score:		ds 6		; player's score  000000 .
hiscor:		ds 6		; high score  000000 .
bonus:		ds 6		; bonus  000000 .
displ0:		ds 4

	if EFLAG

sndtyp:		ds 1		; sound type. don't move!

	endif

	if PFLAG

shrplot:	ds 2

	endif

	if SFLAG
	
scrlyoff:	ds 1
	
	endif

	if MFLAG
	
mod0:	ds 3
mod1:	ds 3
mod2:	ds 3

	endif

	ifdef DATA00
rptr00:		ds 2
	endif
	ifdef DATA01
rptr01:		ds 2
	endif
	ifdef DATA02
rptr02:		ds 2
	endif
	ifdef DATA03
rptr03:		ds 2
	endif
	ifdef DATA04
rptr04:		ds 2
	endif
	ifdef DATA05
rptr05:		ds 2
	endif
	ifdef DATA06
rptr06:		ds 2
	endif
	ifdef DATA07
rptr07:		ds 2
	endif
	ifdef DATA08
rptr08:		ds 2
	endif
	ifdef DATA09
rptr09:		ds 2
	endif
	ifdef DATA10
rptr10:		ds 2
	endif
	ifdef DATA11
rptr11:		ds 2
	endif
	ifdef DATA12
rptr12:		ds 2
	endif
	ifdef DATA13
rptr13:		ds 2
	endif
	ifdef DATA14
rptr14:		ds 2
	endif
	ifdef DATA15
rptr15:		ds 2
	endif
	ifdef DATA16
rptr16:		ds 2
	endif
	ifdef DATA17
rptr17:		ds 2
	endif
ifdef DATA18
rptr18:		ds 2
	endif
	ifdef DATA19
rptr19:		ds 2
	endif
	ifdef DATA20
rptr20:		ds 2
	endif

	else
	
		phase endprogram ; ; if DISTYPE=ROM RAM model variables	
		
varbegin: equ $	
	
	endif 

; RAM variables (initialization not needed)

loopa:		ds 1			; loop counter system variable. (23681)
loopb:		ds 1			; loop counter system variable. (23728)
loopc:		ds 1			; loop counter system variable. (23729)	
vara:		ds 1			; general-purpose variable.
varb:		ds 1			; general-purpose variable.
varc:		ds 1			; general-purpose variable.
vard:		ds 1			; general-purpose variable.
vare:		ds 1			; general-purpose variable.
varf:		ds 1			; general-purpose variable.
varg:		ds 1			; general-purpose variable.
varh:		ds 1			; general-purpose variable.
vari:		ds 1			; general-purpose variable.
varj:		ds 1			; general-purpose variable.
vark:		ds 1			; general-purpose variable.
varl:		ds 1			; general-purpose variable.
varm:		ds 1			; general-purpose variable.
varn:		ds 1			; general-purpose variable.
varo:		ds 1			; general-purpose variable.
varp:		ds 1			; general-purpose variable.
varq:		ds 1			; general-purpose variable.
varr:		ds 1			; general-purpose variable.
vars:		ds 1			; general-purpose variable.
vart:		ds 1			; general-purpose variable.
varu:		ds 1			; general-purpose variable.
varv:		ds 1			; general-purpose variable.
varw:		ds 1			; general-purpose variable.
varz:		ds 1			; general-purpose variable.
contrl:		ds 1            ; control, 0 = keyboard, 1 = Kempston, 2 = Sinclair, 3 = Mouse.
charx:		ds 1            ; cursor y position.
chary:		ds 1            ; cursor x position.
colpat:		ds 1	
prtmod:		ds 1			; print mode, 0 = standard, 1 = double-height.	
clratt:		ds 1			; color attributes
	
; Scrolly text and puzzle variables.

	if SFLAG
txtbit:		ds 1			; bit to write.
txtwid:		ds 1			; width of ticker message.
txtpos:		ds 2			; 
txtini:		ds 2			; 
txtend:		ds 2			; 
txtbeg:		ds 2			; 
	endif

; beeper variable
	if EFLAG
snddelay:	ds 1
	endif
	
spptr:		ds 2			; spawned sprite pointer.
seed:		ds 1			; seed for random numbers.
grbase:		ds 2			; graphics base address.
joyval:		ds 1			; joystick reading.		
scno:		ds 1            ; present screen number.
ogptr:		ds 2            ; original sprite pointer.
nsprite:	ds 1
numlif:		ds 1            ; number of lives.
curobj:		ds 1
dirthig:	ds 2		
skptr:  	ds 2            ; search pointer.
highslot:	ds 1            ; highest free sprite number
roomtb:		ds 1 	        ; room number.

	if MFLAG
bwid:		ds 1            ; box/menu width.
blen:		ds 1            ; box/menu height.
btop:		ds 1            ; box coordinates.
blft:		ds 1
	endif
	
frmno:		ds 1            ; current game frame.
combyt:		ds 1			; byte type compressed.
;comcnt: 	ds 1            ; compression counter.

seed3:		ds 1
nexlev:		ds 1			; db 0               next level flag.
restfl:		ds 1			; db 0               restart screen flag.
deadf:		ds 1			; db 0              dead flag.
gamwon:		ds 1			; db 0               game won flag.
dispx:		ds 1			; db 0              cursor y position.
dispy:		ds 1			; db 0              cursor x position.
varrnd:		ds 1			; db 255             last random number.
varobj:		ds 1			; db 254             last object number.
varopt:		ds 1			; db 255             last option chosen from menu.
varblk:		ds 1			; db 255             block type.
offset:		ds 1
select:		ds 1			; frames to wait until next SELECT key is accepted
ticks:		ds 1			; PAL=50, NTSC=60
; nohide:		ds 1

	if RTFLAG
usrsgn:		ds 1            ; sign.
usrspd:		ds 1            ; speed.
	endif
	
varend:		equ $

	include "PT3-RAM.asm"
	include "ayFX-RAM.asm"

sprptr:		ds 2
pblkptr:	ds 2
stack:		ds 2
time:		ds 1


	if DISTYPE=ROM

keys:		ds 22

; Don't change the order of these four.  Menu routine relies on winlft following wintop.
wintop		ds 1		; top of window.
winlft		ds 1		; left edge.
winhgt		ds 1		; window height.
winwid		ds 1		; window width.

	endif

CONTROLLER_BUFFER:
	ds 12
	

; Sprite table.
;
; ix+0  = type.	(TYPE)
; ix+1  = sprite image number. (IMAGE)
; ix+2  = frame. (FRAME)
; ix+3  = y coord. (Y)
; ix+4  = x coord. (X)

; ix+5  = color
; ix+6  = Not used
; ix+7  = Not used
; ix+8  = y coord backup
; ix+9  = x coord backup

; ix+10 = direction.
; ix+11 = parameter 1. (SETTINGA)
; ix+12 = parameter 2. (SETTINGB)
; ix+13 = jump pointer low. (AIRBORNE)
; ix+14 = jump pointer high. (JUMPSPEED)
; ix+15 = data pointer low.
; ix+16 = data pointer high.

ssprit:		ds TABSIZ
sprtab:		ds SPRBUF	   
		
	if (MAPSIZE > 128)
mapbuf:		ds MAPSIZE - 128	; spratr2+unaligned bytes are recycled
	else
mapbuf:		equ $				; spratr2 is enough
	endif
;
; aligned tables
;
; move wisely!
;
		ALIGN 256
		
spratr2:	ds 128			; secondary sprite attribute table
spratr:		ds 128			; full sprite attribute table. Cannot cross a 256 byte boundary
MAP:		ds 768			; main attributes map. Stores tile attributes		
	
	if OFLAG
objlist:	ds 256			; Objects coords list (max. 128 objects). Needs exact 256 alignment
	endif

scrmap:		ds 768			; Blocks map. Keeps tile codes

mapspr:		ds 128			; Sprite mapping list (max. 64 sprites). Needs exact 256 alignment		

colltab:	ds 16*4			; Support till 16 Y-aligned sprites. Must not cross a 256 byte boundary

; end of aligned tables or data areas

	if SFLAG
scrbuf:		ds 256+8
	endif
	
	if PFLAG
shraddr:	ds 2
SHRAPN:		ds NUMSHR*SHRSIZ
	endif
		
	if (OFLAG and DISTYPE=ROM)
objatr:		ds NUMOBJ*3
	endif

	; if (DISTYPE=ROM and DISSIZE=48) or (DISTYPE!=ROM and DISSIZE=64)
	ifdef NOBIOS
biosvars:	ds $38	
	endif
	
frames_passed:
	db 0

eop:		equ $

	dephase

;
; Extra binary. Loaders for disk/tape versions
;

	if (DISTYPE!=ROM and DISSIZE>32)
	
		output loader.bin

		db $FE
		dw slots
		dw endslots-1
		dw slots

		org $F41F				; KBUF F41F-F55C(318 bytes available)
		
slots:	equ $
	
mvpage0:
		di
		call saveslots
		push de
		call enapage1
		call enapage0
		ld de,$0000
		jr putram
mvpage1:  
		di
		call saveslots
		push de
		call enapage1
		ld de,$4000
putram:
		ld hl,$8080
		ld bc,$4000
		ldir 
		pop de
		call loadslots
		ei
		ret

runpage0:
		jp runpage0a

runpage1:
		jp runpage1a
				
saveslots:
		ld a,(MSX_SSSREG)
		cpl			; reverse all bits
		ld d,a		; Store the current secondary slots register
		in a,(MSX_PPIA)
		ld e,a		; Store the current primary slots register
		ret
		
loadslots:		
		ld a,e
		out	(MSX_PPIA),a	; Restore the register as at start
		ld a,d
		ld (MSX_SSSREG),a	; Restore the register as at start				
		ret

runpage1a:
		di
		call inipage1
		jr run				
		
runpage0a:
		di
		call inipage1
	if DISSIZE=64
		call cpbiosvars
	endif
		call enapage0
run:		
		jp $4000

turboon:		
		ld a,(MSX_CHGCPU)
		cp $C3
		ld a,$81
		jp z,MSX_CHGCPU
		ret
		
	if DISTYPE=DISK
drvmotoff:
		ld a,(MSX_MSLOT)	; motor off entry present?
		ld hl,MSX_MTOFF
		call MSX_RDSLT
		and	a
		ret	z				; no, no way....
		ld iy,(MSX_MSLOT-1)	; we have it! call it now
		ld ix,MSX_MTOFF
		jp MSX_CALSLT
	endif

	if DISSIZE=64
cpbiosvars:		
		ld hl,0
		ld de,biosvars
		ld bc,$0038
		ldir
		ret		
	endif

enapage0:
		ld d,$00
		ld hl,MSX_ENASLT
		jr setcall

inipage1:
	if DISTYPE=DISK
		call drvmotoff
	endif
		call turboon
		; falls through to enapage1
enapage1:
		ld d,$40
		ld hl,($0025)
setcall:
		ld (VEC_ENASLT+1),hl

	
;	find a valid RAM page with the aid of BIOS
;	Input:
;		D = MSB of page address
;
putRAMpgX:
		ld b,4
sl_loop:
		ld c,b
		dec	c
		push de
		push bc
		call chkExp	;modifies B,AF,HL
		jp p,isNotExp
		call sub_chk
		jr nz,found
		jr sl_end
isNotExp:            	
		;ld	h,#80
		ld	h,d
		ld	a,c
		push	hl
		push	af	
		call	VEC_ENASLT	;select unexpanded slot
		pop	de	;D contains the slot/subslot/expn bit
		pop	hl
		call	chkWrite
		jr	nz,found	;is RAM
sl_end:	
		pop	bc
		pop	de
		djnz	sl_loop
		;if nothing jumped to "found", then A must be -1
		ld	a,-1
		jr	found2

found:
		pop	hl	;balance stack
		pop	hl
		;D = slot/sub/slot/expand bit
found2:			;exit if stack is balanced
		ret

sub_chk:
		ld	a,c
		or	#80	;set expanded bit
		ld	b,4
		ld	h,d	;prepare page address in H
sub_loop:
		push	bc
		ld	c,b
		dec	c
		rl	c
		rl	c
		or	c
		;ld	h,#80
		push	hl
		push	af
		call	VEC_ENASLT
		pop	af
		ld	d,a	;save slot/subslot/exp on D register
		and	#f3	;clean subslot bits for next iteration
		ld	e,a
		pop	hl
		call	chkWrite
		jr	nz,sub_end	;is RAM
		ld	a,e
		pop	bc
		djnz	sub_loop
		jr 	sub_end2

sub_end:
		pop	hl; 	balance stack
	;	pop	hl

sub_end2:	;exit if stack is balanced
		ret

chkWrite:
		;**********************************************		
		;chkWrite
		;
		;Checks whether address WRTTST is writable or not
		;
		;Input: none
		;Output: flag Z if non writable
		;Modified: AF
		;

		ld	a,(hl)
		inc	(hl)
		cp	(hl)
		ld (hl),a
		ret
	

chkExp:
		;**********************************************	
		;chkExp

		;Checks whether slot C is expanded or not
		;Result is returned in S flag (jp M or jp P)
		;
		;Input registers:
		;
		; C = primary slot
		;
		;Output:
		;
		; S flag
		;
		;Modified:
		;
		; B,HL,AF
		
		ld	b,0
		ld	hl,MSX_EXPTBL
		add	hl,bc
		ld	a,(hl)          ;see if this slot is expanded or not
		and	#80             
		ret
	
VEC_ENASLT:
		db $C3
		ds 2
		
		
endslots:	equ $
		
	endif


		end
