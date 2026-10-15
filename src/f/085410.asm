; ---------------------------------------------------------------------------
; TeleportReceiver_InitSpawnRec - vtable +$0A: initialise a TELEPORTRECEIVER spawn record from level data
; In:  8(a6) = class descriptor, $C(a6) = spawn record
; Evidence: slot +$A of the TELEPORTRECEIVER descriptor $085300; TAS frames 47898-47898 (1 frames active); calls parent ACTOR slot +$A
; ---------------------------------------------------------------------------
TeleportReceiver_InitSpawnRec:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	a4,a3
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$12CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	clr.b	$4(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
