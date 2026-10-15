; ---------------------------------------------------------------------------
; Deathbird_StateHurt - Deathbird hurt state: leave the hit lists and flash; dead -> stop the burst, sound $63, fall; alive -> sound $AA, recoil
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: set as +$60 by Deathbird_Init; List_Unlink $FFEBAE/$FFEBAA; next Deathbird_StateHurtFlash
; ---------------------------------------------------------------------------
Deathbird_StateHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$2,$6(a4)
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	pea.l	-$1656(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	move.w	#$C,-$3B06(a5)
	tst.w	$68(a4)
	lea.l	$10(a7),a7
	bgt.s	loc_112628
	move.l	$9E(a4),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	lea.l	$14(a7),a7
	bra.s	loc_11264A
loc_112628:
	pea.l	($AA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($AA).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
loc_11264A:
	clr.w	$6C(a4)
	lea.l	Deathbird_StateHurtFlash(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
