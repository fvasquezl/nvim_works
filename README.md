# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

### Instalacion de paquetes necesarios.

#### Usando "LazyExtras" instalar
```
PHP, Coding.nvim-cmp, lang.tailwind 
```
### phpactor
```
composer global require phpactor/phpactor
```

### Para trabajar con Laravel, necesitas algunos paquetes adicionales que complementen la funcionalidad de Phpactor:
```
composer require --dev barryvdh/laravel-ide-helper
php artisan ide-helper:generate
php artisan ide-helper:meta
php artisan ide-helper:models -N
```

### Si usas Pest para pruebas, instálalo en tu proyecto:
```
composer require pestphp/pest --dev
```
### Formatear con Pint
```
composer remove friendsofphp/php-cs-fixer --dev
composer require laravel/pint --dev
./vendor/bin/pint
```

### Crea un archivo pint.json en raiz del proyecto
```
{
  "preset": "laravel",
  "rules": {
    "single_quote": true,
    "trailing_comma_in_multiline": true
  }
}
```
