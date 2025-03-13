local ls = require("luasnip")

ls.add_snippets("php", {
  ls.parser.parse_snippet("route", "Route::${1:get}('${2:/path}', [${3:Controller::class}, '${4:method}']);"),
  ls.parser.parse_snippet(
    "model",
    "<?php\n\nnamespace App\\Models;\n\nuse Illuminate\\Database\\Eloquent\\Model;\n\nclass ${1:ModelName} extends Model\n{\n    protected $fillable = [\n        '${2:field}',\n    ];\n}"
  ),
})
