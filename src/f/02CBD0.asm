; ---------------------------------------------------------------------------
; sub_02CBD0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02CBD0:
	link.w	a6,#$0
	pea.l	sub_02CBBE(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	unlk	a6
	rts
