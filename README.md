# Reraises

It's a good idea to reraise exceptions from third-party libraries as your own so
you're not leaking implementation details all over your codebase. For example,
I would rather deal with my own `Facebook::Page::Inaccessible` exception than
`FbGraph::NotFound` outside of my Facebook adapter.

If your adapter has lots of places that could leak exceptions, however, reraising
them everywhere gets old really fast. That's where reraises comes in.

## Usage

```ruby
class Foo
  extend Reraises

  reraise FbGraph::NotFound, as: Facebook::Page::Inaccessible, in: "bar"

  def bar
    raise FbGraph::NotFound, "This will be reraised as Facebook::Page::Inaccessible"
  end
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'reraises'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reraises

## I love you

Johannes Gorset made this. You should [tweet me](http://twitter.com/jgorset) if you can't get
it to work. In fact, you should tweet me anyway.
