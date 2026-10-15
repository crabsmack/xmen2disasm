; ---------------------------------------------------------------------------
; SyncActor_IsTriggered - SyncActor slot 29 (+$7A): is bit $100 set in the actor's BBoard entry (+$8B)
; In:  8(a6) = this
; Out: d0.w = $100 if set
; Evidence: board $FFE55A; Synchronizer_SetFlag sets that bit
; ---------------------------------------------------------------------------
SyncActor_IsTriggered:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$8B(a0),d0
	movea.l	-$1CA6(a5),a0
	add.l	d0,d0
	move.w	#$100,d1
	and.w	$6(a0,d0.l),d1
	move.w	d1,d0
	unlk	a6
	rts
