# CHECKOUT
This Ruby code implements a checkout system with promotion rules on products.

Here is a sample of some of the products available: 
<pre>
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25
002           | Personalised cufflinks | £45.00
003           | Kids T-shirt           | £19.95
</pre>

These are the discount rules to apply:
<pre>
If you spend over £60, then you get 10% of your purchase.
If you buy 2 or more lavender hearts then the price drops to £8.50.
</pre>

## Implementation
The implementation is based on several Ruby classes:
- `Promotion` superclass that implements common behaviour to specialized discount classes.

- `LavenderPair` promotion subclass implements the computation and discount applicable to each pair of Lavander products.

- `Over60` promotion subclass implements the computation and discount applicable totals over 60 pounds.

- `Item` class implements a basic item concept with name and price.

- `Checkout` class implements the checkout process. Scan of items and computation of total price with promotions applied.

## Installation

#### Clone the code from [Checkout](https://github.com/ltello/checkout)

#### Install Ruby 2.6.4

If Ruby runtime is not installed in your machine, please install it first.
Some popular ruby version managers might be helpful: [rbenv](https://github.com/rbenv/rbenv), [rvm](https://rvm.io/)

#### Install  dependencies

You will need [Bundler](https://github.com/bundler/bundler) gem to install Ruby dependencies.
In the root directory where you the code is installed check it is installed and accessible typing: 
```shell
bundle install
```

## Run the code

```shell
irb
require "./co" 
item1 = Item.new(name: "Lavender heart", price: 9.25)
item2 = Item.new(name: "Personalised cufflinks", price: 45.00)
item3 = Item.new(name: "Kids T-shirt", price: 19.95)
```           

Now you try the following checkout example:
```shell  
co = Checkout.new([LavenderPair, Over60])
co.scan(item1)
co.scan(item2)
co.scan(item3)
co.total
```           
You should get `66.78`

Other examples: 
<pre>
Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76
</pre>
## Run the test suite

In the root folder where you installed the code, type: 
```shell
rspec
```

You can check test coverage if you type this after running rspec:
 ```shell
 open coverage/index.html
 ```
