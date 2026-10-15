; ---------------------------------------------------------------------------
; CloneA5_InitTileHooks - CloneA5 setup step: call XClone_InstallTileHooks (jt 794); result into byte -$33C8
; In:  none
; Out: d0
; Evidence: only caller CloneA5_RunScene; TAS 49258
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_InitTileHooks:
	link.w	a6,#$0
	move.l	d7,-(a7)
	jsr	$18F2(a5)	; -> XClone_InstallTileHooks
	move.b	d0,d7
	move.l	-$4(a6),d7
	unlk	a6
	rts
