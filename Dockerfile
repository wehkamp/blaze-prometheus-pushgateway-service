FROM prom/pushgateway:v1.5.1
EXPOSE 9091
RUN mkdir -p /pushgateway && chown nobody:nobody /pushgateway
WORKDIR /pushgateway
USER 65534
ENTRYPOINT [ "/bin/pushgateway" ]
LABEL blaze.service.id="prometheus-pushgateway" \
      blaze.service.name="blaze-prometheus-pushgateway-service" \
      blaze.service.version="${tag}" \
      blaze.service.team="Tooling" \
      blaze.service.description="Prometheus pushgateway, wrapped in a service." \
      blaze.service.features.health-check.enabled="true" \
      blaze.service.features.health-check.endpoint="/static/functions.js" \
      blaze.service.features.metrics.enabled="true" \
      blaze.service.deployment.cpu="0.1" \
      blaze.service.deployment.memory="100" \
      blaze.service.deployment.minimum-instances="1" \
      blaze.service.deployment.internal-port="9091" \
      blaze.service.deployment.promotion.accept.manual-step="false" \
      blaze.service.deployment.promotion.prod.manual-step="false" \
      blaze.service.routing.consumer.exposed="false" \
      blaze.service.routing.trusted.exposed="true"
