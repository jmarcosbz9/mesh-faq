FROM nginx:alpine

# Remove config padrão do nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia nossa config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia o site
COPY index.html /usr/share/nginx/html/index.html

# Railway usa PORT dinâmica — nginx já escuta na 8080 (via nginx.conf)
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
