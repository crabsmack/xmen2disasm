; ---------------------------------------------------------------------------
; Ninja_ActStartCombat - NINJA script action: switch to the combat script and start it at step 0
; In:  8(a6) = this
; Out: none
; Evidence: AiScript_Set(+$96, Tbl_NinjaCombatScript), +$5C = first thunk, +$6C = 0; second step of the intro script ($13D8BC, set by Ninja_Init); TAS SiberiaB1 frames 203-4658
; ---------------------------------------------------------------------------
Ninja_ActStartCombat:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3AAA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	bne.s	loc_13D320
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D33C
loc_13D320:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_13D33C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
