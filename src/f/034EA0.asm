; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes_part2 - part 2 of AvalonA4_AnimatePalettes: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of AvalonA4_AnimatePalettes
; Out: continues in AvalonA4_AnimatePalettes
; Evidence: only reached by branches from AvalonA4_AnimatePalettes
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes_part2:
	move.w	-$3B3A(a5),d0
	bmi.w	AvalonA4_AnimatePalettes_part4
	cmpi.w	#$5,d0
	bgt.w	AvalonA4_AnimatePalettes_part4
	add.w	d0,d0
	move.w	Sw_034EA0(pc,d0.w),d0
	jmp	Sw_034EA0-2(pc,d0.w)
