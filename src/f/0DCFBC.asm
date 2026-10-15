; ---------------------------------------------------------------------------
; Blast_StateUnstick - BLAST state: clear flag bit 2, then remove itself
; In:  8(a6) = this
; Out: d0
; Evidence: slot +$72 Blast_ClearFlags(2)
; Found: link-after-rts
; ---------------------------------------------------------------------------
Blast_StateUnstick:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Blast_StateKill(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
