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

# All the Little Things

Sandy Metz goes over the solution to this problem in [this talk](https://www.youtube.com/watch?v=8bZh5LMaSmE)

Squint Test: Look for changes in shape in the code (namly nested values, thats a quick indication of
complexity that could be refactored.)

Extending this code is super hard! There's lots of conditionals, magic numbers and magic strings.
_We have to understand everything to add anything_

When we have to add a feature, we look for the code that's closet to what we're doing and put the
code there. _We are afraid to make new objects_

Its like a big snow ball rolling down a hill. The big ones can only keep getting bigger, and nothing
can stop their progress. 

Red/green refactoring: make the tests pass _then_ refactor. not both at same time. This is a
technique in organizing our thoughts as much as anything else.

We are taught the greatest virtue is DRY. But going on a DRY refactor tangent is distracting. Finish
your original goal of refactoring first. _Then_ think about DRY. DRYing up code before you're done
is writing a solution when you don't yet know the problem.

_Duplication is far cheaper than the wrong abstraction_ in other words _don't be clever!_

Review of Open Closed principal. Is my solution open/closed compliant? Could I add a new item
without editing existing code? Yes! I would add a new line to the case statement in
`ItemBuilder.build` and then implement the new object like the others.

When you have a set of methods with a common prefix or suffix, its a good indication you need to
refactor to several classes each with a common interface

Using an inheratance hierarchy should 
 - be shallow
 - be narrow
 - use all methods in their super class

