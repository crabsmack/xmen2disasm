; ---------------------------------------------------------------------------
; BigAcolyte_ActStartFight - BIGACOLYTE intro last step: stop sound $34, switch to the fight script (Tbl_BigAcolyteFightScriptLen) and start it
; In:  8(a6) = this
; Out: none
; Evidence: AiScript_Set(+$96, jt $3F2) installs the new script; index 0
; ---------------------------------------------------------------------------
BigAcolyte_ActStartFight:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$34,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	lea.l	$1F2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	bne.s	loc_011382
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01139E
loc_011382:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_01139E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
