; ---------------------------------------------------------------------------
; MagnetoBoss_StateOutro - MAGNETOBOSS outro: play animation Tbl_MagnetoBossAnim16 (jt $474A), then loop jt $4952
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next MagnetoBoss_StateOutroLoop
; ---------------------------------------------------------------------------
MagnetoBoss_StateOutro:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$474A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	MagnetoBoss_StateOutroLoop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
