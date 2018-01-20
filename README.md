Implements some `Hash` methods which ruby will undoubtedly add in the future, possibly with different names.

To install run `gem install hash-polyfill`, and then `require "hash-polyfill"` in your code.

## Usage

```ruby
a = {a: 1, b: 2, c: 3, d: 4}

a.select_values(&:even?) # => {b: 2, d: 4}
a.reject_values(&:even?) # => {a: 1, c: 3}
a.transform_values{|v| v * 10} # => {a: 10, b: 20, c: 30, d: 40}
a.slice(:a, :b, :e)  # => {a: 1, b: 2}

b = {a: 1, b: 2, c: nil, d: false}
b.compact # => {a: 1, b: 2, d: false}
```

The gem only adds the methods if they don't already exist.

* In ruby 2.4+, `Hash#transform_values` is already provided.
* In ruby 2.4+, `Hash#transform_values!` is already provided.
* In ruby 2.5+, `Hash#transform_keys` is already provided.
* In ruby 2.5+, `Hash#slice` is already provided.

There are also `!` versions of some of these methods.
