mkdir -p compressed_hq

for f in combined_*_rendered_trajectory__new.mp4; do
  ffmpeg -y -i "$f" \
    -c:v libx264 -preset slow -crf 24 \
    -pix_fmt yuv420p \
    -c:a aac -b:a 128k \
    -movflags +faststart \
    "compressed_hq/$f"
done
