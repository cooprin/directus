# Базовий образ Directus
FROM directus/directus:latest

# Встановлення робочої директорії
WORKDIR /directus

# Встановлення змінних середовища
ENV NODE_ENV=production
ENV ADMIN_LOCALE=uk-UA

# Створення директорій для Directus
RUN mkdir -p /directus/uploads /directus/extensions

# Копіювання користувацьких розширень, якщо є
# Розкоментуйте наступний рядок, якщо у вас є custom extensions
# COPY ./extensions/ /directus/extensions/

# Встановлення прав доступу для користувача node
RUN chown -R node:node /directus/uploads /directus/extensions

# Перемикання на непривілейованого користувача
USER node

# Відкриття порту для Directus
EXPOSE 8055

# Запуск Directus
CMD ["npx", "directus", "start"]