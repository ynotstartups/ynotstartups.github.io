# TIL - Open Errors in Quickfix List For Vim                         - 17/Aug/23

1. in Vim, run command `:cexpr system('command that returns quickfix format')`
1. in Terminal, `vim -q <(command that returns quickfix error format)`

Example for quickfix format

```vim
./lambdas/atr_notification/__init__.py:1:1: F401 'json' imported but unused
./lambdas/atr_notification/__init__.py:2:1: F401 'boto3' imported but unused
./lambdas/atr_notification/__init__.py:4:1: F401 'lambdas.common.config.oneview.SNS_TARGET_ARN' imported but unused
```

Example quick hack of loading output into vim quickfix

```bash
alias ,a='docker compose run --rm serverless python -m mypy run.py lambdas/ tests/ > quickfix.vim ; cat quickfix.vim'
alias ,s='vim -q quickfix.vim'
```
