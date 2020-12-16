FROM php:7.4-cli

RUN apt-get update && \
    apt-get -y --no-install-recommends install libxml2-utils && \
    apt-get autoremove -y && \
    apt-get clean

COPY entrypoint.sh /entrypoint.sh
COPY csv-translation-validator.php /csv-translation-validator.php

RUN chmod +x /entrypoint.sh
RUN chmod +x /csv-translation-validator.php

ENTRYPOINT ["/entrypoint.sh"]
