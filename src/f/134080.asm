; ---------------------------------------------------------------------------
; FireWall_StateWaitFlame - FIREWALL: wait until its flame effect (+$92) has finished, then wait to be on screen
; In:  8(a6) = this
; Out: d0
; Evidence: effect +4 bit $10; TAS 9725-10023 (SentinelsB2)
; ---------------------------------------------------------------------------
FireWall_StateWaitFlame:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$92(a4)
	beq.s	loc_1340B6
	movea.l	$92(a4),a0
	moveq	#$10,d0
	and.w	$4(a0),d0
	bne.s	loc_1340B6
	moveq	#$0,d0
	move.l	d0,$92(a4)
	clr.w	$6C(a4)
	lea.l	FireWall_StateWaitOnScreen(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1340C8
loc_1340B6:
	clr.w	$6C(a4)
	lea.l	FireWall_StateWaitFlame(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1340C8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
