# furday.ch
Website for furry related stuff in Switzerland. It is actually hosted at:

[furday.duckdns.org](https://furday.duckdns.org)
[goto.ninja/furday](https://goto.ninja/furday)

There is a stupid reCaptcha to try and fend off bots while keeping
links to Telegram groups in the calendar.

## Install

```
apt install ruby-sinatra ruby-slim
cp config_template.json config.json
# Add your reCaptcha sitekey and calendar IDs there

ruby index.rb
```
