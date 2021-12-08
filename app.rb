require 'sinatra'

get '/' do
  "BOUNTY?"
end

get '/binary_to_decimal' do
  binary = params[:binary]
  if binary.to_i.to_s == binary
    binary_to_decimal(binary)
  else
    binary_to_decimal(decimal_to_binary(binary.to_i))
  end
end

get '/decimal_to_binary' do
  decimal = params[:decimal]
  decimal_to_binary(decimal.to_i)
end

def binary_to_decimal(binary)
  binary.reverse.each_char.with_index.inject(0) do |sum, (char, index)|
    sum + char.to_i * 2**index
  end
end

def decimal_to_binary(decimal)
  binary = ''
  return '0' if decimal == 0

  while decimal > 0
    binary = (decimal % 2).to_s + binary
    decimal = decimal / 2
  end
  binary
end

def longest_palindrome(string)
  longest = ''
  string.each_char.with_index do |char, index|
    string.each_char.with_index do |char2, index2|
      if index2 > index
        if string[index..index2] == string[index..index2].reverse
          if string[index..index2].length > longest.length
            longest = string[index..index2]
          end
        end
      end
    end
  end
end

