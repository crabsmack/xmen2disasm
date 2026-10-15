; ---------------------------------------------------------------------------
; Mem_StackAlloc - allocate a block from the top-of-heap stack allocator with an 8-byte header {next top, tag}
; In:  8(a6) = long: size in bytes (rounded up to even)   $C(a6) = tag (C string)
; Out: d0 = pointer to the block after the header
; Evidence: heap top long -$348C(a5) (= $FF0000 at Sys_InitHardware); header +0 = new top, +4 = tag; Sys_GetStackPtr is called first (result unused)
; ---------------------------------------------------------------------------
Mem_StackAlloc:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$8(a6),d6
	jsr	$4172(a5)	; -> Sys_GetStackPtr
	movea.l	d0,a4
	movea.l	-$348C(a5),a4
	moveq	#$8,d7
	moveq	#$1,d0
	and.w	d7,d0
	moveq	#$0,d1
	move.w	d0,d1
	ext.l	d7
	add.l	d7,d1
	movea.l	d1,a3
	adda.l	a4,a3
	moveq	#$1,d0
	and.l	d6,d0
	add.l	d6,d0
	add.l	a3,d0
	move.l	d0,-$348C(a5)
	move.l	d0,(a4)
	move.l	$C(a6),$4(a4)
	move.l	a3,d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
