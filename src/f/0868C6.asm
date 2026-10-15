; ---------------------------------------------------------------------------
; BroodBoss_SpawnRecInView - vtable +$2A override: never report a BROODBOSS spawn record as in the spawn window; just clear its bit 0
; In:  8(a6) = class descriptor, $C(a6) = spawn record
; Out: d0 = 0 always
; Evidence: slot +$2A of the BROODBOSS descriptor $088D6E; if record +4 bit 0 is set it is cleared, both paths return 0, so the spawn pass never creates the boss (CloneA5_SpawnBoss does); TAS 51133
; ---------------------------------------------------------------------------
BroodBoss_SpawnRecInView:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	moveq	#$0,d0
	move.b	$4(a4),d0
	moveq	#$1,d1
	and.b	d0,d1
	bne.s	loc_0868E0
	moveq	#$0,d0
	bra.s	loc_0868E8
loc_0868E0:
	andi.b	#$FE,$4(a4)
	moveq	#$0,d0
loc_0868E8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
