ffmpeg \
  -r 60 \
  -f image2 \
  -i in/%04d.png \
  -r 60 \
  -f image2 \
  -i test/denoised_rgb%04d.png \
  -filter_complex '[0:v]pad=iw*2:ih[int];[int][1:v]overlay=W/2:0[vid]' \
  -map [vid] \
  -c:v libx264 \
  -crf 1 \
  -preset veryfast \
  $@

 # data/evaluate/in/%04d.png
 # data/evaluate/out/%04d.png
