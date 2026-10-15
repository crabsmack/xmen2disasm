; ---------------------------------------------------------------------------
; Barbarian_Draw - vtable +$1A: draw a BARBARIAN
; In:  8(a6) = this
; Evidence: slot +$1A of the BARBARIAN descriptor $0BE74E; TAS frames 27992-33098 (1755 frames active); calls parent BIONPC slot +$1A
; ---------------------------------------------------------------------------
Barbarian_Draw:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	lea.l	$211A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
