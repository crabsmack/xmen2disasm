; ---------------------------------------------------------------------------
; BioSentinel_StateHurt - BIOSENTINEL hurt state: dead -> Explode; badly hurt (< 3) or lightly hurt animation, 40-frame invulnerability, then think
; In:  8(a6) = this
; Out: d0
; Evidence: health +$68, vtable +$7E; set by BioSentinel_TakeDamage
; ---------------------------------------------------------------------------
BioSentinel_StateHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$2,d0
	cmp.w	$68(a4),d0
	bge.s	loc_121452
	lea.l	$344A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$28,$6A(a4)
	addq.w	#$8,a7
	move.w	#$28,$6C(a4)
	lea.l	BioSentinel_StateThink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1214AA
loc_121452:
	tst.w	$68(a4)
	ble.s	loc_121484
	lea.l	$3452(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$28,$6A(a4)
	addq.w	#$8,a7
	move.w	#$28,$6C(a4)
	lea.l	BioSentinel_StateThink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1214AA
loc_121484:
	move.w	#$2710,$6A(a4)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	move.w	#$FF,$6C(a4)
	lea.l	BioSentinel_StateHurt(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1214AA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
