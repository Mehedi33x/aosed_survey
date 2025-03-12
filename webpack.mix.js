const mix = require("laravel-mix");

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

// Mix core script...
mix.js("resources/js/app.js", "public/js")
    .js("resources/js/login_app.js", "public/js")
    .vue()
    .options({
        processCssUrls: false,
    });

// SASS CSS
mix.sass(
    "resources/js/assets/admin/sass/style.scss",
    "public/admin/css"
).sourceMaps(true, "source-map");

// Copy directory...
mix.copyDirectory("resources/js/assets/public", "public")
    .copyDirectory("resources/js/assets/datepicker", "public/datepicker")
    .copyDirectory("resources/js/assets/admin/css", "public/admin/css")
    .copyDirectory("resources/js/assets/admin/js", "public/admin/js")
    .copyDirectory("resources/js/assets/admin/images", "public/admin/images");

// Create chunk...
let config = {
    output: {
        publicPath: process.env.MIX_VUE_ROUTER_BASE
            ? "/" + process.env.MIX_VUE_ROUTER_BASE + "/public/"
            : "/",
        chunkFilename: "js/chunks/[name].js",
    },
    stats: {
        children: true,
    },
};

// Mix Config...
mix.webpackConfig(config);
