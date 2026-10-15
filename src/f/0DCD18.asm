; ---------------------------------------------------------------------------
; Blast_OutsideActiveWindow - vtable +$42: is a BLAST outside its active window
; In:  8(a6) = this
; Evidence: slot +$42 of the BLAST descriptor $0DD0E8; TAS frames 2783-7280 (1682 frames active); calls parent ACTOR slot +$42
; ---------------------------------------------------------------------------
Blast_OutsideActiveWindow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$96(a4),d0
	btst	#$0,d0
	beq.s	loc_0DCD30
	moveq	#$0,d0
	bra.s	loc_0DCD46
loc_0DCD30:
	move.l	a4,-(a7)
	lea.l	$24CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0DCD46:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
