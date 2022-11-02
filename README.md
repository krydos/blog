# codelearn.me
My blog made with [jekyll](http://jekyllrb.com) and hosted with Github Pages.

## how to run

Install all the deps
`bundle config --local path ./vendor; bundle install`

Run jekyll
`bundle exec jekyll serve`

If on windows use `--force_polling` option to make `watch` working properly

## Gemini

This repo contains one custom plugin in `_plugins` folder.

The plugin generates `.gmi` files from `.md` posts on every build/serve.

Those `.gmi` files aren't handled by github pages and I deploy those manually
to my gemini server at the moment.

Tool that is used to convert md to gmi is called `md2gemini` and it's python lib that can be installed with pip
