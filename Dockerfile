FROM clemenshuebner/amos-ss16-proj8-ionic-build:1.0

RUN phonegap create TestApp
RUN cd TestApp
ENTRYPOINT phonegap serve -p 80