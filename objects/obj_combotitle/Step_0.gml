image_yscale = lerp(image_yscale, 1, 0.25)
image_xscale = lerp(image_xscale, 1, 0.1)
bob1 = wave(-0.6, 0.6, 3, 0)
bob2 = wave(-0.2, 0.3, 2, 0)

y += bob1
x += bob2