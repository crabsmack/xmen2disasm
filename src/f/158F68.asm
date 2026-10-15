; ---------------------------------------------------------------------------
; FluxBomb_StateBurst - burst in progress: remove the bomb when the burst ends (phase 4)
; In:  8(a6) = bomb
; Out: none
; Evidence: +$100 == 4 -> vtable +$52 Kill
; ---------------------------------------------------------------------------
FluxBomb_StateBurst:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$100(a4),d0
	cmpi.w	#$4,d0
	bne.s	loc_158F8A
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_158F8A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
