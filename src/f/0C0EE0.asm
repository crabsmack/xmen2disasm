; ---------------------------------------------------------------------------
; sub_0C0EE0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C0EE0:
	link.w	a6,#$0
	pea.l	($4010).w
	pea.l	($4010).w
	pea.l	($4000).w
	pea.l	($4000).w
	jsr	$8A(a5)	; -> sub_006BD0
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_0C0F42
	andi.b	#$FB,-$172A(a5)
	moveq	#$8,d0
	and.w	-$1752(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1716(a5),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$16D0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> sub_1F91E8
	lea.l	$10(a7),a7
loc_0C0F42:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0C0F84
	andi.b	#$FB,-$181A(a5)
	moveq	#$8,d0
	and.w	-$1842(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1806(a5),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$17C0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> sub_1F91E8
loc_0C0F84:
	unlk	a6
	rts
