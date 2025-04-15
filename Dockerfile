FROM directus/directus:latest

# Основні налаштування
ENV NODE_ENV=production

# Додаткові налаштування для українського перекладу
ENV ADMIN_LOCALE=uk-UA

# Копіюємо розширення, якщо вони є
COPY ./extensions/ /directus/extensions/

# Директорії для роботи Directus
RUN mkdir -p /directus/uploads

# Не використовуємо chown під час збірки, 
# оскільки образ directus/directus вже має правильні права доступу
# Dockerfile з базового образу вже встановлює права для користувача node

# Використовуємо непривілейованого користувача
USER node