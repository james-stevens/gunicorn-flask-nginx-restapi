# gunicorn-flask-nginx-restapi
REST/API running for Python/Flask applications using Gunicorn &amp; nginx

This is a shell container & probably won't run stand-alone. It is also
designed to run read-only, but if you want to run it read only, you
should run add `RUN python3 -m compileall /opt/python/` to your `Dockerfile`
*after* you have copied all the code into `/opt/python` so the byte-code
can be created & stored, as this can't be done at run-time when read-only!!!

You'll need to add (at least)

- /etc/inittab

And install your python/flask application into `/opt/python` with a tiny program called
`wsgi.py` that looks something like this

You may also want to customise `nginx.conf`

```
#! /usr/bin/python3

from you_app_main_file import application

if __name__ == "__main__":
    application.run()
```

If you have a few python/flask micro-services, putting all the common parts
into a parent container should be more efficient.
