; ---------------------------------------------------------------------------
; sub_03518C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03518C:
	link.w	a6,#$0
	movem.l	d5-d7,-(a7)
	move.w	$E(a6),d6
	move.w	$A(a6),d7
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d5
	and.w	(a0,d0.l),d5
	cmpi.w	#$84,d5
	bne.s	loc_0351EC
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($89).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	$18(a7),a7
loc_0351EC:
	moveq	#$1,d0
	movem.l	-$C(a6),d5-d7
	unlk	a6
	rts
