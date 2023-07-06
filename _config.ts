import lume from "lume/mod.ts";
import tailwindcss from "lume/plugins/tailwindcss.ts";
import postcss from "lume/plugins/postcss.ts";
import imagick from "lume/plugins/imagick.ts";
import date from "lume/plugins/date.ts";

const site = lume({
    src: "./src",
});
site.ignore("flake.nix", "flkae.lock");
site.use(tailwindcss());
site.use(postcss());
site.use(imagick());
site.use(date());
site.loadAssets([".svg"]);

export default site;
