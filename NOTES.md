 - There are lots of different rules pertaining to how an item is treated based on its three properties:
    - name
    - sell_in
    - quantity

  Rather than this complex set of nested ifs, lets extract each of these items to their own classes,
  each with a common interface. That way we can ask the items various questions and get back an
  expected answer (polymophism!). The work being done by this program is to update an `item`'s
  `quality`. As long as our wrapper objects respond to `quality` we're fine.

