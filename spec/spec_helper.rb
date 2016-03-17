RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

require "rspec/expectations"

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
