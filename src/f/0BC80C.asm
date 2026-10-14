; ---------------------------------------------------------------------------
; sub_0BC80C	[jt 1018]
; ---------------------------------------------------------------------------
sub_0BC80C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$33AA(a5)	; -> sub_11F4C0
	move.w	#$FFE0,$A0(a4)
	lea.l	$33CA(a5),a0
	move.l	a0,$A2(a4)
	clr.w	$A6(a4)
	move.w	#$600,$A8(a4)
	ori.w	#$100,$98(a4)
	move.w	#$96,$6E(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_0BC7A2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
