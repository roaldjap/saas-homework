class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name + "_history"
    class_eval %{
def #{attr_name}
@#{attr_name}
end
def #{attr_name}=(val)
@#{attr_name} = val
if @#{attr_name}_history == nil
@#{attr_name}_history = [nil]
end
@#{attr_name}_history.push(val)
end
}
  end
end

class Foo
  attr_accessor_with_history :bar
end

class SomeOtherClass
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

class WrongCurrency < StandardError; end

class Numeric
  @@currencies = {
    'yen' => 0.013,
    'euro' => 1.292,
    'rupee' => 0.019,
    'dollar' => 1.0}

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if ! @@currencies.has_key?(singular_currency)
      raise WrongCurrency
    end
    if @in_dollars == nil
      return self
    else
      raw = @in_dollars / @@currencies[singular_currency]
      rounded = (raw*10000).round / 10000.0
      return rounded
    end
  end

  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      @in_dollars = self * @@currencies[singular_currency]
      return self
    else
      super
    end
  end
end

def palindrome(seq)
  if seq.kind_of? String
    normalized = seq.strip().downcase().gsub(/\W/, '')
  else
    normalized = seq
  end
  return normalized == normalized.reverse()
end

class String
  def palindrome?
    palindrome(self)
  end
end

module Enumerable
  def palindrome?
    return palindrome(to_a())
  end
end