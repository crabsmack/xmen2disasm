; ---------------------------------------------------------------------------
; CloneA5_LoadResources - CloneA5: load the scene's four resource sets
; In:  none
; Out: none
; Evidence: SprDef_Add for jt[$2E0A]/[$3648]/[$2A92]/[$15AE] -> -$3B04, -$3B08, -$3C4C; two passed to sub_13F486 for the effect pools -$3B1C/-$3B14; called via sub_15B0E6 by CloneA5_FrameHook; TAS 49271
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_LoadResources:
	link.w	a6,#$0
	move.l	d7,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$155A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3B04(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$1562(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3B08(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$1552(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C4C(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$1542(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,d7
	move.w	-$3B08(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	-$3B1C(a5),-(a7)
	jsr	$3B52(a5)	; -> sub_13F486
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$3B14(a5),-(a7)
	jsr	$3B52(a5)	; -> sub_13F486
	move.l	-$4(a6),d7
	unlk	a6
	rts
