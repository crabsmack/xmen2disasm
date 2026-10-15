; ---------------------------------------------------------------------------
; Blast_Attack - parent Attack, then stop, drop the animation, frame $FF, latch onto the target (+$90, +$96 bit 0) and switch to Blast_Latch (BLAST override of slot +$22 Attack)
; In:  8(a6) = this, $C(a6) = target object, then hit parameters (see ACTOR +$22 $15E630)
; Out: none
; Evidence: slot +$22 of the BLAST descriptor $0DD0E8; runs in corpus run fuzz-03600-s2 (not the TAS)
; ---------------------------------------------------------------------------
Blast_Attack:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	lea.l	$24CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a3,$90(a4)
	ori.w	#$1,$96(a4)
	lea.l	Blast_Latch(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
