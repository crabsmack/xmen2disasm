; ---------------------------------------------------------------------------
; CloneA2_StartCamera - start the CloneA2 camera: alternate mode, zone 0, then camera +$36 at the start position
; In:  none
; Out: none
; Evidence: reads start x (& $FE00) and y from the record at -$1860; calls CloneA2_StartCamAltMode, CloneA2_SetCameraZone(0), g_Camera slot +$36(x, y, 1000, 1000, 1, 0); TAS frame 47901
; ---------------------------------------------------------------------------
CloneA2_StartCamera:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	moveq	#$1,d4
	clr.b	d5
	movea.l	-$1860(a5),a0
	move.w	$2(a0),d7
	move.w	$4(a0),d6
	andi.w	#$FE00,d7
	jsr	CloneA2_StartCamAltMode(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	CloneA2_SetCameraZone(pc)
	moveq	#$0,d0
	move.b	d5,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	d4,d0
	move.l	d0,-(a7)
	pea.l	($3E8).w
	pea.l	($3E8).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
