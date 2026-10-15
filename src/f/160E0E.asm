; ---------------------------------------------------------------------------
; Cam_LookDown - CAMERA slot +$2A: start looking down (unless already looking up)
; In:  8(a6) = this
; Out: d0 = 1 started, 0 refused
; Evidence: if +$4A bit 4 clear: speeds 5, +$18 = Cam_StepLookDown, +$4A |= 8, clears bit $10
; ---------------------------------------------------------------------------
Cam_LookDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	and.w	$4A(a4),d0
	bne.s	loc_160E44
	move.w	#$5,$60(a4)
	move.w	#$5,$5E(a4)
	lea.l	Cam_StepLookDown(pc),a0
	move.l	a0,$18(a4)
	ori.w	#$8,$4A(a4)
	andi.w	#$FFEF,$4A(a4)
	moveq	#$1,d0
	bra.s	loc_160E46
loc_160E44:
	moveq	#$0,d0
loc_160E46:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
