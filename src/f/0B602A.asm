; ---------------------------------------------------------------------------
; SavageA4_CyclePalettes - SavageA4: run the three palette cycles (tables $0B664C, $0B667C, $0B66AC)
; In:  none
; Out: none
; Evidence: Pal_CycleStep x3 with the counters reset by SavageA4_ResetPalCycles; TAS 33423-34593
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_CyclePalettes:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1CB2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1CBA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$1CC2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	unlk	a6
	rts
