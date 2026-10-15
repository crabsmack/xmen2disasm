; ---------------------------------------------------------------------------
; sub_1F97DE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F97DE:
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
