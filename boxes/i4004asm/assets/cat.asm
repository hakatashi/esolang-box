start:
	jms $3f0
	ld r2
	jcn az end
	jms $3e0
	jun start
end:
