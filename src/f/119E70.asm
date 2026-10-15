; ---------------------------------------------------------------------------
; SyncActor_MemberSpawnRecOutOfView - SyncActor slot 28 (+$76): ACTOR's SpawnRecOutOfView test for the Synchronizer
; In:  8(a6) = this  $C(a6) = spawn record
; Out: d0.b = 1 if out of view
; Evidence: calls parent +$32; caller Synchronizer_WaitMembers
; ---------------------------------------------------------------------------
SyncActor_MemberSpawnRecOutOfView:
	link.w	a6,#$0
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2F72(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$32(a0),a1
	jsr	(a1)
	unlk	a6
	rts
