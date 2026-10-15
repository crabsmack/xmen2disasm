; ---------------------------------------------------------------------------
; Pad_P1StartDown - test whether Start is held on pad 1 right now
; In:  none
; Out: d0 = long: $80 if Start held, else 0
; Evidence: Z80_BusRequest, Pad_GetP1Clean, Z80_BusFree, & $80 (Start bit)
; ---------------------------------------------------------------------------
Pad_P1StartDown:
	link.w	a6,#$0
	move.l	d7,-(a7)
	jsr	$51F2(a5)	; -> Z80_BusRequest
	jsr	$51A2(a5)	; -> Pad_GetP1Clean
	ext.l	d0
	move.l	d0,d7
	jsr	$51FA(a5)	; -> Z80_BusFree
	move.l	#$80,d0
	and.l	d7,d0
	move.l	-$4(a6),d7
	unlk	a6
	rts
