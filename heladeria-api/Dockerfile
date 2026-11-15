
# syntax=docker/dockerfile:1

# Etapa 1: Build con Maven
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app

# Copiar configuración Maven
COPY pom.xml .

# Descargar dependencias y conservar caché
RUN --mount=type=cache,target=/root/.m2 \
    mvn -B dependency:go-offline

# Copiar código fuente
COPY src ./src

# Compilar reutilizando caché
RUN --mount=type=cache,target=/root/.m2 \
    mvn -B clean package -DskipTests

# Etapa 2: Imagen final
FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
