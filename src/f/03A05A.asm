; ---------------------------------------------------------------------------
; BanimazaDoor_StateWaitPlayer - BANIMAZADOOR: wait until the nearest player is within $82 px horizontally
; In:  8(a6) = this
; Out: d0
; Evidence: Player_Nearest; +6 |= $1000; next BanimazaDoor_StateStartRise
; ---------------------------------------------------------------------------
BanimazaDoor_StateWaitPlayer:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a0
	move.l	$8(a4),d7
	sub.l	$8(a0),d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_03A082
	move.l	d7,d0
	bra.s	loc_03A086
loc_03A082:
	move.l	d7,d0
	neg.l	d0
loc_03A086:
	cmpi.l	#$8200,d0
	addq.w	#$4,a7
	bge.s	loc_03A0A0
	ori.w	#$1000,$6(a4)
	lea.l	BanimazaDoor_StateStartRise(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_03A0A0:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
