## Урок 42
### Devise

Devise - гем для авторизации

Добавим в Gemfile:

```ruby
gem 'devise'
```

```bash
bundle
```

**Вывести в терминал список генераторов в системе:**

```bash
rails g
```

```text
Devise:
  devise
  devise:controllers
  devise:install
  devise:views
```

Введём:

```bash
rails g devise:install
```

План, как подключать devise:

1. gem 'devise' в Gemfile
2. rails g devise:install

Проверить есть ли строка в файле config/environments/development.rb:

```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Проверить, что в  /config/routes.rb указано:

```ruby
root to: "home#index"
```

Добавить в app/views/layouts/application.html.erb для флеш-сообщений:

```html
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```

Для кастомизации форм:

```bash
rails g devise:views
```

**Далее, создадим модель пользователя:**

```bash
rails g devise User
```

Devise создал параметры: e-mail, зашифрованный пароль, токен для сброса пароля.

**Наберём:**

```bash
rake db:migrate
```

И, запустим:

```bash
rails s
```

### Задача: чтобы мы могли просматривать статьи, но не могли их создавать.

- http://localhost:3000/articles
- http://localhost:3000/articles/new

Откроем /app/controllers/articles_controller.rb и добавим:

> Примечание: начиная с Rails 5 синтаксис before_filter устарел и заменён на before_action

```ruby
before_action :authenticate_user!
```

Добавим в /app/views/layouts/application.html.erb:

```html
<p><a href="/users/sign_in">Sign In</a> | <a href="/users/sign_out" data-method="delete">Sign Out</a></p>
```

Далее, мы заменим эти ссылки на ссылки с именноваными маршрутами.

> Документация по гему devise - https://github.com/plataformatec/devise

> Статья на Хабре по devise - https://habr.com/ru/post/208056/

> Посмотреть примеры - https://github.com/plataformatec/devise/wiki/Example-applications

---