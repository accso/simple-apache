FROM debian:bullseye

# Lege im neuen Image Metadaten zum Ersteller ab
MAINTAINER marcus.rickert@accso.de

# Führe mit RUN Befehle aus (&& bewirkt Hintereinanderausführung)
# Hier konkret:
#   apt-get update: aktualisiere Paketverzeichnis
#   apt-get install: installiere das Debian-Paket 'libapache2-mod-php'
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

COPY assets/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
