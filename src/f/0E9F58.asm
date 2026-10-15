; ---------------------------------------------------------------------------
; Hologram_StateOpenExit - Hologram: open the exit, then wait for the players on the lower lift
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Hologram_OpenExit; TAS frame 9203
; ---------------------------------------------------------------------------
Hologram_StateOpenExit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Hologram_OpenExit(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	Hologram_WaitLowerLiftBoarded2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
