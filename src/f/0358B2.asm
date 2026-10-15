; ---------------------------------------------------------------------------
; AvalonA4_ClearCameraZone_apply - tail of AvalonA4_ClearCameraZone: update -$3B02 and call g_Camera +$3A
; In:  d7 = mask
; Out: none
; Evidence: common exit of the Sw_035872 cases
; ---------------------------------------------------------------------------
AvalonA4_ClearCameraZone_apply:
	tst.w	d7
	seq.b	d3
	neg.b	d3
	ext.w	d3
	and.w	d3,g_SceneVar3B02(a5)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
