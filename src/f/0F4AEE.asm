; ---------------------------------------------------------------------------
; SentinelsB2_LoadDigits - SentinelsB2: load the countdown digit graphics and remember their first tile in $FFC6FA
; In:  none
; Out: none
; Evidence: sub_1F62C0(thunk $0F4D00, 1); tile base from the resource table $FFC980 + idx*$14
; ---------------------------------------------------------------------------
SentinelsB2_LoadDigits:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2952(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,d7
	move.l	d7,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$6(a4),-$3B06(a5)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
