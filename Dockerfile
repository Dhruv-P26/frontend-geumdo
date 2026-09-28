# ---- Geumdo High School: Frontend (Tier 1 - Presentation) ----
FROM nginx:1.27-alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy our static site into nginx's web root
COPY . /usr/share/nginx/html

# Copy custom nginx config (proxies /api/* to the backend service on the docker network)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
