default := "help"
help:
    @just --list

build:
    cd backend && chmod +x gradlew && ./gradlew assemble

test:
    cd backend && chmod +x gradlew && ./gradlew test

run-backend:
    cd backend && chmod +x gradlew && ./gradlew bootRun

docker-build:
    cd backend && docker build -t backend:latest .

docker-run:
    cd backend && docker run -d --name backend-container -p 8080:8080 backend:latest

docker-clean:
    cd backend &&  docker stop backend-container || true
    cd backend &&  docker rm backend-container || true

verify: build test docker-build docker-clean docker-run
    @echo "⏳ Attendo che il servizio sia pronto (polling su /actuator/health)..."
    @bash -c '\
        for i in {1..60}; do \
            if curl -s -f http://localhost:8080/actuator/health > /dev/null; then \
                echo -e "\n✅ Servizio pronto e in salute!"; \
                exit 0; \
            fi; \
            echo -n "."; \
            sleep 1; \
        done; \
        echo -e "\n❌ Timeout: Il servizio non ha risposto in tempo utile."; \
        exit 1; \
    '
    @echo "🩺 Verifica completata con successo! Pulisco l'ambiente..."
    just docker-clean