; ---------------------------------------------------------------------------
; MagnetoBoss_StateIntroStart - MAGNETOBOSS intro: place it inside the left wall, lock camera zone 0, wait 60 frames
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: x = -$28 px, y = $118 px; AvalonA4_SetCameraZone(0, 0, $B0, 2, 2); next MagnetoBoss_StateIntroShake1
; ---------------------------------------------------------------------------
MagnetoBoss_StateIntroStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$FFFFD800,$8(a4)
	move.l	#$11800,$C(a4)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	pea.l	($B0).w
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	jsr	$72A(a5)	; -> AvalonA4_SetCameraZone
	lea.l	$14(a7),a7
	move.w	#$3C,$6C(a4)
	lea.l	MagnetoBoss_StateIntroShake1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
