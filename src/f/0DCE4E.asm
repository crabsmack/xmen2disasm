; ---------------------------------------------------------------------------
; Blast_SetFlags - BLAST slot +$6E: set bits in the flag word it points at (+$8C)
; In:  8(a6) = this, $E(a6) = word bits
; Out: none
; Evidence: TAS 2858-7239
; Found: jt 1171
; ---------------------------------------------------------------------------
Blast_SetFlags:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	$8C(a0),a4
	move.w	$E(a6),d0
	or.w	d0,(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
