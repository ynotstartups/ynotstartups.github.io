# TIL - python wheel                                                 - 31/Aug/23

**output for installing source distribution (not wheel)**

downloading tar.gz and building wheel

```
❯ python -m pip install 'uwsgi==2.0.*'

Collecting uwsgi==2.0.*
  Downloading uwsgi-2.0.22.tar.gz (809 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 809.7/809.7 kB 13.4 MB/s eta 0:00:00
  Preparing metadata (setup.py) ... done
Building wheels for collected packages: uwsgi
  Building wheel for uwsgi (setup.py) ... done
  Created wheel for uwsgi: filename=uWSGI-2.0.22-cp311-cp311-macosx_13_0_arm64.whl size=400536 sha256=a79b882b505a3093feed13f859dfa01e1ce04651abd125d418509505bc861d94
  Stored in directory: /Users/yuhao.huang/Library/Caches/pip/wheels/93/59/2d/d21852a9f9607e9494b5d3c96d11f348d11039f7c47223c9ce
Successfully built uwsgi
Installing collected packages: uwsgi
Successfully installed uwsgi-2.0.22
```

**output for installing wheel**

there’s no build stage when pip finds a compatible wheel on PyPI.

```
❯ python -m pip install 'chardet==3.*'
Collecting chardet==3.*
  Downloading chardet-3.0.4-py2.py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.4/133.4 kB 4.8 MB/s eta 0:00:00
Installing collected packages: chardet
Successfully installed chardet-3.0.4

```

A Python .whl file is essentially a ZIP (.zip) archive with a specially crafted
filename that tells installers what Python versions and platforms the wheel will
support.

`{dist}-{version}(-{build})?-{python}-{abi}-{platform}.whl`

`cryptography-2.9.2-cp35-abi3-macosx_10_9_x86_64.whl`
