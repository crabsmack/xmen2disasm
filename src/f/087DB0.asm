; ---------------------------------------------------------------------------
; BroodBoss_StateDeathSink - BROODBOSS death: lower the boss offset by $A0 (x2 at half rate) per frame to below $1A9
; In:  8(a6) = this
; Out: d0
; Evidence: next BroodBoss_StateExplode; TAS 50693-50708
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateDeathSink:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$A0,d7
	tst.b	-$38DE(a5)
	beq.s	loc_087DC8
	lsl.w	#$1,d7
loc_087DC8:
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$1A8,d0
	ble.s	loc_087DF0
	ext.l	d7
	sub.l	d7,-$3C44(a5)
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateDeathSink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_087E02
loc_087DF0:
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateExplode(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_087E02:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
