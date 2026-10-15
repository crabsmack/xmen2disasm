; ---------------------------------------------------------------------------
; Spark_StateHit - SPARK hurt state (+$60): explode and disappear
; In:  8(a6) = this
; Out: none
; Evidence: Explosion_Spawn(x, y, 1), vtable +$52 Kill; Spark_Init stores it in +$60
; ---------------------------------------------------------------------------
Spark_StateHit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
