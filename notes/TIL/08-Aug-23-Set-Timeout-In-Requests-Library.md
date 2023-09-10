# TIL - Set Timeout In Requests Library                              - 08/Aug/23

```python3
# timeout = (connect timeout, read timeout)
requests.get('https://github.com', timeout=(3, 27))
```

> By default, requests do not time out unless a timeout value is set
> explicitly. Without a timeout, your code may hang for minutes or more.
> It’s a good practice to set connect timeouts to slightly larger than a
> multiple of 3, which is the default TCP packet retransmission window.
> Doc from requests
