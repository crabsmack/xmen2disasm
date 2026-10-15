; ---------------------------------------------------------------------------
; BanimazaDoor_StateShattered - BANIMAZADOOR after shattering: kill itself, or wait +$9E frames to respawn
; In:  8(a6) = this
; Out: d0
; Evidence: +$9E respawn delay; next BanimazaDoor_StateWaitRespawn
; ---------------------------------------------------------------------------
BanimazaDoor_StateShattered:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$9E(a4)
	beq.s	loc_03A232
	lea.l	BanimazaDoor_StateWaitRespawn(pc),a0
	move.l	a0,$5C(a4)
	move.w	$9E(a4),$6C(a4)
	moveq	#$0,d0
	bra.s	loc_03A23E
loc_03A232:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_03A23E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
