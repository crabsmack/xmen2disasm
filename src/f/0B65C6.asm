; ---------------------------------------------------------------------------
; sub_0B65C6	[jt 912]
; ---------------------------------------------------------------------------
sub_0B65C6:
	link.w	a6,#$FFF8
	lea.l	-$8(a6),a0
	move.l	a0,-$3B14(a5)
	jsr	$1CCA(a5)	; -> sub_0B66DC
	jsr	sub_0B6322(pc)
	jsr	sub_0B626E(pc)
	jsr	sub_0B62F2(pc)
	jsr	sub_0B6322(pc)
	lea.l	$1CAA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> sub_1FDAEC
	moveq	#$0,d0
	move.l	d0,-$3B20(a5)
	pea.l	sub_0B65A0(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,-$35B6(a5)
	jsr	$2E8A(a5)	; -> sub_1190D6
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$3382(a5)	; -> sub_11F1A6
	jsr	$5242(a5)	; -> sub_1FE5F2
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	$5242(a5)	; -> sub_1FE5F2
	unlk	a6
	rts
