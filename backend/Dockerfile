# -- Stage 1: build --
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /workspace

COPY gradlew .
COPY gradle ./gradle
COPY settings.gradle.kts build.gradle.kts ./

RUN chmod +x gradlew

# opzionale: scarica dipendenze prima, così migliori la cache
RUN ./gradlew dependencies --no-daemon -q || true

COPY src ./src

RUN ./gradlew bootJar --no-daemon -q

# -- Stage 2: runtime --
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

RUN addgroup -S spring && adduser -S spring -G spring
USER spring

COPY --from=builder /workspace/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]