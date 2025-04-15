FROM directus/directus:latest

# Основні налаштування
ENV NODE_ENV=production

# Додаткові налаштування для українського перекладу
ENV ADMIN_LOCALE=uk-UA

# Копіюємо розширення, якщо вони є
COPY ./extensions/ /directus/extensions/

# Директорії для роботи Directus
RUN mkdir -p /directus/uploads

# Необхідно для запуску як не root користувач
RUN chown -R node:node /directus/extensions /directus/uploads

# Використовуємо непривілейованого користувача
USER node