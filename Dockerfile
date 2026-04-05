FROM nginx:alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy all static files
COPY index.html /usr/share/nginx/html/
COPY manifest.json /usr/share/nginx/html/
COPY sw.js /usr/share/nginx/html/
COPY qr.html /usr/share/nginx/html/
COPY Bending_Arena_v1.13.sb3 /usr/share/nginx/html/
COPY icons/ /usr/share/nginx/html/icons/

# Ensure all files are readable
RUN chmod -R 755 /usr/share/nginx/html && \
    find /usr/share/nginx/html -type f -exec chmod 644 {} +

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
