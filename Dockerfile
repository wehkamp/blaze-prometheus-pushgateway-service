FROM prom/pushgateway:v0.4.0
ARG tag
USER nobody
EXPOSE 5000
CMD ["-web.listen-address", ":5000", "-log.format", "logger:stdout?json=true"]
LABEL blaze.service.id="prometheus-pushgateway" \
      blaze.service.name="blaze-prometheus-pushgateway-service" \
      blaze.service.version="${tag}" \
      blaze.service.team="Tooling" \
      blaze.service.description="Prometheus pushgateway, wrapped in a service." \
      blaze.service.features.health-check.enabled="true" \
      blaze.service.features.health-check.endpoint="/static/functions.js" \
      blaze.service.features.metrics.enabled="true" \
      blaze.service.deployment.cpu="1" \
      blaze.service.deployment.memory="1024" \
      blaze.service.deployment.minimum-instances="1" \
      blaze.service.deployment.internal-port="5000" \
      blaze.service.deployment.promotion.accept.manual-step="false" \
      blaze.service.deployment.promotion.prod.manual-step="false" \
      blaze.service.routing.consumer.exposed="false" \
      blaze.service.routing.trusted.exposed="true"
