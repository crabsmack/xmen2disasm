; ---------------------------------------------------------------------------
; Cyclops_HardLanding - CYCLOPS slot +$EA: XPLAYER HardLanding, then Cyclops_StateHardLanding (a charged beam can fire on landing)
; In:  8(a6) = player
; Out: none
; Evidence: parent +$EA via the CYCLOPS descriptor
; ---------------------------------------------------------------------------
Cyclops_HardLanding:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2BCA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$EA(a0),a1
	jsr	(a1)
	lea.l	Cyclops_StateHardLanding(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_StateHardLanding(pc)
	addq.w	#$8,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
