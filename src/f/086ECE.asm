; ---------------------------------------------------------------------------
; BroodBoss_StateDropBomb - BROODBOSS state: frame 5 and drop a DROPBOMB near the top-left of the screen
; In:  8(a6) = this
; Out: d0
; Evidence: SetFrame(5), DropBomb_Spawn((g_CameraX+$2D) << 8, (g_CameraY+$B) << 8, 0), next BroodBoss_StateAfterBomb; TAS 49894
; ---------------------------------------------------------------------------
BroodBoss_StateDropBomb:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_CameraY(a5),d1
	ext.l	d1
	moveq	#$B,d2
	add.l	d2,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.w	g_CameraX(a5),d1
	ext.l	d1
	moveq	#$2D,d0
	add.l	d0,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	jsr	$11D2(a5)	; -> DropBomb_Spawn
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateAfterBomb(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
