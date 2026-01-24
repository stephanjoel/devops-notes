FROM ubuntu:22.04

WORKDIR /app

# Instalamos bash (ya viene) y lo mínimo. Esto es ejemplo.
RUN apt update && apt install -y ca-certificates && rm -rf /var/lib/apt/lists/*

# Creamos un script dentro de la imagen
RUN printf '#!/bin/bash\n'\
'echo "Contenedor DevOps activo"\n'\
'echo "Modo: ${MODO:-dev}"\n'\
'echo "Fecha: $(date)"\n'\
'echo "Archivos en /app:"\n'\
'ls -la\n' > /app/run.sh && chmod +x /app/run.sh

CMD ["/app/run.sh"]

