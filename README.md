# world-check-orchestrator


dbtapp:
  target: dev
  outputs:
    dev:
      type: clickhouse
      schema: worldcheck
      host: localhost
      port: 8123
      user: default
      password: ''
      secure: False