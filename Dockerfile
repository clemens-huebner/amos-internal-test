FROM osrgroup/amos-downloader-base-image:1.0

ENV HTML_INDEX_FILE android-debug.apk
ADD assets/$HTML_INDEX_FILE /var/www/html/$HTML_INDEX_FILE