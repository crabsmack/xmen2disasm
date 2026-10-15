; ---------------------------------------------------------------------------
; BaniMazaA1_SwitchTileHook - map tile hook: a switch tile toggles (bit 9), redraws, moves the blocks of that row and plays sounds $DE/$E7; 40-frame cooldown
; In:  8(a6) = word column, $C(a6) = word row
; Out: d0 = 0
; Evidence: cooldown -$3C94; sub_15D7D8 redraw; RollingDiscs_ReverseAtY(row*32); Snd_Play/Snd_Stop $DE, 3, $E7; installed in -$3AF4 by BaniMazaA1_InstallTileHooks
; ---------------------------------------------------------------------------
BaniMazaA1_SwitchTileHook:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$A(a6),d6
	move.w	$E(a6),d7
	tst.w	-$3C94(a5)
	bne.s	loc_0387C4
	ext.l	d7
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	eori.w	#$200,(a4)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FD2(a5)	; -> sub_15D7D8
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	jsr	$8C2(a5)	; -> RollingDiscs_ReverseAtY
	pea.l	($DE).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($DE).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E7).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E7).w
	jsr	$521A(a5)	; -> Snd_Play
	move.w	#$28,-$3C94(a5)
	lea.l	$20(a7),a7
loc_0387C4:
	moveq	#$0,d0
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
