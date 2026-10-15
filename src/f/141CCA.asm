; ---------------------------------------------------------------------------
; TankLeft_Init - TANKLEFT slot +$12: TANK Init, face left, 4 health, its own AI script
; In:  8(a6) = this, $C..$14(a6) = Init args
; Out: none
; Evidence: parent +$12; +$2E |= $10; health 4; AiScript_Set(+$94, jt $3E72), first thunk
; ---------------------------------------------------------------------------
TankLeft_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3C52(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.b	#$10,$2E(a4)
	move.w	#$4,$68(a4)
	lea.l	$3C72(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$94(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$96(a4)
	bne.s	loc_141D22
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_141D3E
loc_141D22:
	clr.w	$94(a4)
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_141D3E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
