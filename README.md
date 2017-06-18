## Chess Autoplan

Automatically adjust 4G data plan size depending on the current's month usage.

It selects the smallest plan that has at least 0.5 GB to spare. If the current plan already is the best, no action is taken.

To run:
```sh
shards build
CHESS_USERNAME=<123> CHESS_PASSWORD=<zyz> bin/autoplan
```

You should see something like this:
```text
Current usage is 2.1 GB
The 5 GB Plan is still the best plan
```

Note that the password must be URI encoded (replace spaces with a plus)

To run test:
```sh
crystal spec
```

