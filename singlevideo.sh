ffmpeg \
  -r 59.97 \
  -f image2 \
  -i out/denoised_rgb%04d.png \
  -c:v libx264 \
  -crf 1 \
  -preset veryfast \
  $@

 # data/evaluate/in/%04d.png
 # data/evaluate/out/%04d.png
