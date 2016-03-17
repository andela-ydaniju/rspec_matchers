## Creating your own RSpec Matchers

RSpec is a behavior-driven development (BDD) framework for the Ruby programming language. It assists with setting expectations for how exactly one expects ones code to behave. Tests (or specs) are first written and run leading to failures. Code is then written to pass those expectaations earlier set.

RSpec by default provides a handful of matchers that can help you test your code. Matchers are set of expressions which are used to compare between actual and expected values. The actual value is derived from the written code while the expected value is what is specified to be a correct.

Sometimes you may want to express your domain clearly using custom matchers. Here are some default matchers:

### Examples of Default Matchers

####  1. Equality
        expect(actual).to eq(expected)
        expect(actual).to eql(expected)
        expect(actual).not_to eql(not_expected)

####  2. Comparisons
        expect(actual).to be >  expected
        expect(actual).to be >= expected
        expect(actual).to be <= expected

Other examples abound but the above gives a clear picture of what is being discussed.

To build you own matchers, you need to have rspec installed.

  run ```gem install rspec```

Then create the directory for this experiment and name it ```rspec_matchers```

Enter into the new directory  ```cd rspec_matchers``` and run ```rspec --init```.

#### Writing your Matchers

We'll be creating matchers to determine whether a given number is a square.

A ```spec``` directory with ```spec_helper.rb``` file is created by ```rspec --init```.

At the bottom of ```spec_helper.rb```, add ```require "rspec/expectations"``` and paste the following:

```ruby
RSpec::Matchers.define :be_the_square_of do |expected_value|
  match do |actual_value|
    expected_value**2 == actual_value
  end
end

RSpec::Matchers.define :not_be_the_square_of do |expected_value|
  match do |actual_value|
    expected_value**2 != actual_value
  end
end
```

In the above code, we simply opened up the use the `RSpec` method for defining a new matcher ```RSpec::Matchers.define``` which takes two arguments:

1. The name of the matcher to be defined eg :not_to_be_square
2. A block which has another method match with a block wherein the relationship between actual and expected values is described.


#### Writing your tests

Create a file called ```square_spec.rb``` in ```spec``` directory and paste the following tests into it:

```ruby

require 'spec_helper'

describe 'Squares' do
  context 4 do
    it { should be_the_square_of 2 }
  end

  context 9 do
    it { should be_the_square_of 3 }
  end

  context 20 do
    it { should not_be_the_square_of 4 }
  end

  # another way
  context '49' do
    it do
      expect(49).to not_be_the_square_of 8
    end
  end

  context '49' do
    it do
      expect(49).to be_the_square_of 7
    end
  end

  # override the default message

  context '2025' do
    it 'is big but still the square of 45' do
      expect(2025).to be_the_square_of 45
    end
  end
end
```

#### Running your tests

Open the ```.rspec``` in your ```rspec_matchers``` directory. You should find this two commands by default

    --color                    # This adds color to your tests
    --require spec_helper      # requires spec_helper

    Add a third:

    -fd                 # the test will run with full documentation


#### Conclusion

We can do more of this next time. At the moment, enjoy your tests.


Check the test  code on [github](https://github.com/penmuse/testing-ruby/tree/rspec-matchers)