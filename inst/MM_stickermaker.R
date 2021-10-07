library("hexSticker")

imgurl <- "MM_pmf.png"
sticker(imgurl, package="MM", p_size=48, s_x=1, s_y=.85,
s_width=0.97, asp=sqrt(3)/2, white_around_sticker=TRUE, h_fill="#7733FF",
h_color="#000000", filename="MM.png")
