# gunicorn-flask-nginx-restapi
REST/API running for Python/Flask applications using Gunicorn &amp; nginx

This is a shell container & probably won't run stand-alone

You'll need to add (at least)

- /etc/nginx/nginx.conf
- /etc/inittab

And install your python/flask application into `/opt/python` with a tiny program called
`wsgi.py` that looks something like this

```
#! /usr/bin/python3

from you_app_main_file import application

if __name__ == "__main__":
    application.run()
```

If you have a few python/flask micro-services, putting all the common parts
into a parent container should be more efficient.
