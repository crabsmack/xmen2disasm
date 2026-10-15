; ---------------------------------------------------------------------------
; AvalonA2_HookEndOnEvent3 - scene event hook in -$3216: event 3 ends the scene after 1 frame
; In:  8(a6) = word event
; Out: d0 = 1 if event 3
; Evidence: Scene_EndAfter(1) on event 3; installed by AvalonA2_InstallEventHooks
; ---------------------------------------------------------------------------
AvalonA2_HookEndOnEvent3:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_022B48
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	moveq	#$1,d0
	addq.w	#$4,a7
	bra.s	loc_022B4A
loc_022B48:
	moveq	#$0,d0
loc_022B4A:
	unlk	a6
	rts
