# TIL - What Errors To Catch For Requests?                           - 07/Aug/23

TLDR; `requests.HTTPError & requests.Timeout`

```python
import requests

try:
    # TIL: https://httpstat.us/ is a nice website to tried out different error
    # set timeout to be really small to trigger timeout error
    res = requests.get("https://httpstat.us/200?sleep=100", timeout=0.1) # the ConnectTimeout is throwed at this line
    res.raise_for_status()
except requests.HTTPError, request.Timeout as e:
    pass
```

- [requests library doc](https://requests.readthedocs.io/en/latest/user/quickstart/#errors-and-exceptions)
- [stack overflow related question](https://stackoverflow.com/questions/16511337/correct-way-to-try-except-using-python-requests-module)
