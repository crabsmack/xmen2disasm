; ---------------------------------------------------------------------------
; Pause_LoadSprite - load the PAUSE text sprite tiles into VRAM tile $794
; In:  none
; Out: none
; Evidence: Spr_Init(local instance, 1, def $112FD8, 0, 1, $794, 1); called by Pause_Check
; ---------------------------------------------------------------------------
Pause_LoadSprite:
	link.w	a6,#$FFEC
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($794).w
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	lea.l	$2B82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
