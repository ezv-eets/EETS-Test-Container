FROM openjdk:11
LABEL org.opencontainers.image.source="https://github.com/needtoroll/eets-test-container"
MAINTAINER ezv.admin.ch
COPY ./eets-test-support-service.jar /opt/eets/lib/
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV SPRING_APPLICATION_JSON=''
ENTRYPOINT ["java", "-Dspring.profiles.active=testsupport"]
CMD ["-jar", "/opt/eets/lib/eets-test-support-service.jar"]
