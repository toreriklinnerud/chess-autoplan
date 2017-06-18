## Chess Autoplan

Automatically adjust the plan size depending on current usage.

It selects the smallest plan that has at least 0.5 GB to spare.

To run:
```sh
  CHESS_USERNAME=<123> CHESS_PASSWORD=<zyz> crystal src/autoplan.rb
```

You should see something like this:
```text
Current usage is 2.1 GB
The 5 GB Plan is still the best plan
```

Note that the password but be URI encoded (replace spaces with a plus)

To run test:
```sh
crystal spec
```

