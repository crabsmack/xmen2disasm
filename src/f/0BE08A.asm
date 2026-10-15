; ---------------------------------------------------------------------------
; Barbarian_StateLeapNear - BARBARIAN leap: wait until within 10 px above the target y
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateLeapNear:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$A0(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	moveq	#$A,d1
	cmp.l	d0,d1
	ble.s	loc_0BE0BA
	clr.w	$6C(a4)
	lea.l	Barbarian_StateLeapLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE0BA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
