# Imagem base oficial da Frappe com ERPNext v15
FROM frappe/erpnext-worker:version-15

# Define variáveis de ambiente (essas são sobrescritas pelo .env se estiver no Render)
ENV SITE_NAME=site1.local \
    DB_ROOT_PASSWORD=root \
    ADMIN_PASSWORD=admin \
    INSTALL_APPS=erpnext

# Diretório de trabalho
WORKDIR /home/frappe/frappe-bench

# Comando de inicialização padrão para garantir que o site seja criado apenas uma vez
CMD ["/bin/bash", "-c", "if [ ! -d sites/${SITE_NAME} ]; then \
      bench new-site ${SITE_NAME} --mariadb-root-password=${DB_ROOT_PASSWORD} --admin-password=${ADMIN_PASSWORD} --install-app ${INSTALL_APPS}; \
    fi && \
    bench start"]