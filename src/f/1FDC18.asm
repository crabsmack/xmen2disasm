; ---------------------------------------------------------------------------
; Scroll_UpdateParallax - per-frame parallax: recompute band scroll values and upload them
; In:  none
; Out: none
; Evidence: if descriptor -$3A44(a5) set: Scroll_ComputeParallax; for line scroll, VDP_QueueDma($380 bytes from -$BC6(a5) to VRAM $F400) + Scroll_RequestVsram; for column scroll Scroll_RequestColumnVs; jt 2589, every TAS frame from 168
; ---------------------------------------------------------------------------
Scroll_UpdateParallax:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	-$BC6(a5),a4
	tst.l	-$3A44(a5)
	beq.s	loc_1FDC54
	jsr	$416A(a5)	; -> Scroll_ComputeParallax
	movea.l	-$3A44(a5),a0
	moveq	#$32,d0
	cmp.b	(a0),d0
	beq.s	loc_1FDC50
	pea.l	($380).w
	move.l	#$F400,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	jsr	$4DF2(a5)	; -> Scroll_RequestVsram
	lea.l	$C(a7),a7
	bra.s	loc_1FDC54
loc_1FDC50:
	jsr	$4DFA(a5)	; -> Scroll_RequestColumnVs
loc_1FDC54:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
