; ---------------------------------------------------------------------------
; Hologram_ExplodeWhenReady - Hologram dying script end: when the +$6E timer has run out, explode, then open the exit after 30 frames
; In:  8(a6) = this
; Out: none
; Evidence: Hologram_Explode; next Hologram_StateOpenExit; TAS frame 9172
; ---------------------------------------------------------------------------
Hologram_ExplodeWhenReady:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_0E9F50
	move.l	a4,-(a7)
	jsr	Hologram_Explode(pc)
	addq.w	#$4,a7
	move.w	#$1E,$6C(a4)
	lea.l	Hologram_StateOpenExit(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0E9F50:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
