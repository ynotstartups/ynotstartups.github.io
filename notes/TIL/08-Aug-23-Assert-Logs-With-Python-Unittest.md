# TIL - Assert Logs With Python Unittest                             - 08/Aug/23

```python3
with self.assertLogs('foo', level='INFO') as cm:
    logging.getLogger('foo').info('first message')
    logging.getLogger('foo.bar').error('second message')
self.assertEqual(cm.output, ['INFO:foo:first message',
                             'ERROR:foo.bar:second message'])
```

https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertLogs
