fizzbuzz = fn
  {0,0,_} -> "FizzBuzz"
  {0,_,_} -> "Fizz"
  {_,0,_} -> "Buzz"
  {_,_,num} -> num
end

IO.puts "FizzBuzz"
IO.puts "-----------"
IO.puts fizzbuzz.({0,0,1})
IO.puts fizzbuzz.({0,1,1})
IO.puts fizzbuzz.({1,0,1})
IO.puts fizzbuzz.({1,1,99})
IO.puts "\n"



fizzbuzz_tester = fn num ->
  fizzbuzz.({rem(num,3), rem(num,5), num})
end


IO.puts "FizzBuzz Tester"
IO.puts "-----------"
IO.puts fizzbuzz_tester.(10)
IO.puts fizzbuzz_tester.(11)
IO.puts fizzbuzz_tester.(12)
IO.puts fizzbuzz_tester.(13)
IO.puts fizzbuzz_tester.(14)
IO.puts fizzbuzz_tester.(15)
IO.puts fizzbuzz_tester.(16)
