; ---------------------------------------------------------------------------
; Cam_LookUp - CAMERA slot +$26: start looking up (unless already looking down)
; In:  8(a6) = this
; Out: d0 = 1 started, 0 refused
; Evidence: if +$4A bit 8 clear: speeds +$5E/+$60 = 2, +$18 = Cam_StepLookUp, +$4A |= 4, clears bit $10
; ---------------------------------------------------------------------------
Cam_LookUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$8,d0
	and.w	$4A(a4),d0
	bne.s	loc_160E04
	move.w	#$2,$60(a4)
	move.w	#$2,$5E(a4)
	lea.l	Cam_StepLookUp(pc),a0
	move.l	a0,$18(a4)
	ori.w	#$4,$4A(a4)
	andi.w	#$FFEF,$4A(a4)
	moveq	#$1,d0
	bra.s	loc_160E06
loc_160E04:
	moveq	#$0,d0
loc_160E06:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
