; ---------------------------------------------------------------------------
; Gambit_HardLanding - GAMBIT slot +$EA: XPLAYER HardLanding, then Gambit_StateHardLanding (a charged throw can fire on landing)
; In:  8(a6) = player
; Out: none
; Evidence: parent +$EA via the GAMBIT descriptor, +$5C = Gambit_StateHardLanding
; ---------------------------------------------------------------------------
Gambit_HardLanding:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2BC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$EA(a0),a1
	jsr	(a1)
	lea.l	Gambit_StateHardLanding(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_StateHardLanding(pc)
	addq.w	#$8,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
