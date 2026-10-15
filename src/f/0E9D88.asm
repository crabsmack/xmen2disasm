; ---------------------------------------------------------------------------
; Hologram_StateStart - Hologram first state: wait 10 frames, then StateSetup
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: TAS frame 7580
; ---------------------------------------------------------------------------
Hologram_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$A,$6C(a4)
	lea.l	Hologram_StateSetup(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
