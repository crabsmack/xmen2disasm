; ---------------------------------------------------------------------------
; Barbarian_StateAttackEnd - BARBARIAN state: attack over - pose Tbl_BarbarianAnim4 (jt $2092), idle
; In:  8(a6) = this
; Out: d0
; Evidence: TAS 28483-33097
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateAttackEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2092(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Barbarian_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
