 - There are lots of different rules pertaining to how an item is treated based on its three properties:
    - name
    - sell_in
    - quantity

  Rather than this complex set of nested ifs, lets extract each of these items to their own classes,
  each with a common interface. That way we can ask the items various questions and get back an
  expected answer (polymophism!). The work being done by this program is to update an `item`'s
  `quality`. As long as our wrapper objects can do that, we're fine!

# My solution

It would be amazing if we could refactor the program to look like this

```ruby
def update_quality(items)
  items.each do |item|
    wrapped_item = ItemBuilder.build(item)
    wrapped_item.update_quality
  end
end
```

Basically, I want to
 - pass the item to a builder class and get back an object. That object will encapsulate the
   business rules related to the item's type
 - calling `update_quality` will update the `item`'s quality and sell_in fields

The goblin in the corner is left unbothered!

Next I am going to define a base class called `ItemWrapper`. This base class will take care of the
functionality that every instance will need to be able to do. Namly:

 - store the wrapped `data` struct in an ivar
 - delegate calls to `quality` and `sell_in` to the wrapped `data`, preserving the existing interface
 - Provide private methods for 
   - setting the items quality (encapsulating system with logic)
   - decreasing the `sell_in` value

Finally, each item type will have its own class. That class implements `update_quality` which
encapsulate's business logic for how that item determines its updated quality