; ---------------------------------------------------------------------------
; XClone_CamSetNormal - camera back to normal bounds ($60, $5A, $E0, $C0 via camera slot +$1E)
; In:  8(a6) = camera
; Out: none
; Evidence: -$3892 := 1; jt 795; callers XClone_UnlockArena and others
; Found: jt 795
; ---------------------------------------------------------------------------
XClone_CamSetNormal:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,g_CamModeSwitched(a5)
	pea.l	($C0).w
	pea.l	($E0).w
	moveq	#$5A,d0
	move.l	d0,-(a7)
	moveq	#$60,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1E(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
