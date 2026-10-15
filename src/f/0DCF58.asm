; ---------------------------------------------------------------------------
; Blast_StateStick - BLAST state: stuck in a wall - stop, impact animation, leave the attacker list, set flag bit 2 for $3C frames
; In:  8(a6) = this
; Out: d0
; Evidence: slot +$6E Blast_SetFlags(2); next Blast_StateUnstick
; Found: link-after-rts
; ---------------------------------------------------------------------------
Blast_StateStick:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$3F5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	pea.l	g_HitListEnemyAtk(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	move.w	#$3C,$6C(a4)
	lea.l	Blast_StateUnstick(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
