# Dockerfile

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=build /app/target/fatjar-0.0.1-SNAPSHOT.jar /app/app.jar
COPY --from=build /app/lib /app/lib
COPY --from=build /app/haarcascades /app/haarcascades

CMD ["java", "-Djava.library.path=lib/", "-jar", "app.jar"]

