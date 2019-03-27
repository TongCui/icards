<!-- 
title: Ruby Constant Nesting
from: work
create: 2019-03-26
tags: ruby,work
-->

## Ruby Constant Nesting
```ruby
module A
  A_CONSTANT = 'I am defined in module A'
  module B
    module C
      def self.inspect_nesting

        puts Module.nesting.inspect
        puts A_CONSTANT
      end
    end
  end
end

A::B::C.inspect_nesting
# => [A::B::C, A::B, A]
# => I am defined in module A
```

