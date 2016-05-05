FROM clemenshuebner/amos-ss16-proj8-ionic-build:1.0

RUN ionic start TestApp tabs
RUN cd TestApp
RUN phonegap serve -p 80