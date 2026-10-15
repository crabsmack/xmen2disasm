; ---------------------------------------------------------------------------
; Blast_Latch - BLAST: latch onto the object it hit - leave the attacker list, $1E zaps, sound $D5
; In:  8(a6) = this
; Out: d0
; Evidence: caller Blast_Attack (which stores the target in +$90); next Blast_StateZap
; Found: link-after-rts
; ---------------------------------------------------------------------------
Blast_Latch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_HitListEnemyAtk(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	clr.w	$6E(a4)
	move.w	#$1E,$9A(a4)
	pea.l	($D5).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D5).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	Blast_StateZap(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
