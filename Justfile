default:
  just --list

up:
  bundle config --local path ./vendor; bundle exec jekyll serve --host=0.0.0.0

install:
  bundle config --local path ./vendor; bundle install

new-post name:
  #!/usr/bin/env bash
  POSTPATH="./_posts/`date +%Y-%m-%d`-{{name}}.md"
  echo "---" > $POSTPATH \
  && echo "layout: post" >> $POSTPATH \
  && echo "title:" >> $POSTPATH \
  && echo "description:" >> $POSTPATH \
  && echo "tags:" >> $POSTPATH \
  && echo "---" >> $POSTPATH

# deploy gemini version to my server
capsule-deploy:
  rsync -aP --exclude '_capsule/_header.gmi' --exclude '_capsule/_footer.gmi' _capsule/ vpn-droplet:/home/gemini/gemini-php/hosts/default/
  ssh vpn-droplet 'chown -R gemini:gemini /home/gemini/gemini-php/hosts/default'
