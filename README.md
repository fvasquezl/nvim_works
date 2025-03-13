# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.



composer require --dev barryvdh/laravel-ide-helper
php artisan ide-helper:generate
php artisan ide-helper:meta
php artisan ide-helper:models -N

Crea un archivo .php-cs-fixer.php en la raiz del proyecto

<?php

return PhpCsFixer\Config::create()
    ->setRules([
        'no_empty_comment' => true, // Elimina comentarios vacíos
        'no_empty_phpdoc' => true,  // Elimina bloques PHPDoc vacíos
        'phpdoc_trim' => true,      // Limpia espacios innecesarios en PHPDoc
        'phpdoc_no_empty_return' => true, // Elimina `@return void` innecesario
        'phpdoc_no_package' => true,      // Elimina `@package`
        'phpdoc_no_useless_inheritdoc' => true, // Elimina `@inheritdoc` innecesario
    ])
    ->setFinder(
        PhpCsFixer\Finder::create()
            ->in(__DIR__)
    );

Y ejecutar
vendor/bin/php-cs-fixer fix

Otra option es usar Pint
<?php

$files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator('.'));

foreach ($files as $file) {
    if ($file->isDir() || $file->getExtension() !== 'php') {
        continue;
    }

    $content = file_get_contents($file->getPathname());
    $content = preg_replace('/\/\*\*.*?\*\//s', '', $content); // Elimina bloques PHPDoc
    file_put_contents($file->getPathname(), $content);
}
Guarda este script como remove-doc-comments.php y ejecútalo:
php remove-doc-comments.php

