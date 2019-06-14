FROM java:8
MAINTAINER ezv.admin.ch
USER eets:eets
COPY ./eets-provider-interface-service.jar /opt/eets/lib/
ENV SPRING_APPLICATION_JSON=''
ENTRYPOINT ["/usr/bin/java", "-Dspring.profiles.active=testsupport"]
CMD ["-jar", "/opt/eets/lib/eets-provider-interface-service.jar"]
#VOLUME /var/lib/spring-cloud/config-repo
#EXPOSE 8089
