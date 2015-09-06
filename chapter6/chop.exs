defmodule Chop do
  def guess(actual, range) do
    lower..upper = range
    guess(actual, div(lower + upper, 2), range)
  end 

  defp guess(actual, current_guess, _) when actual == current_guess do
    IO.puts "Yay! You found it! #{actual}"
  end 

  defp guess(actual, current_guess, _..upper) when actual > current_guess do
    IO.puts "Is it #{current_guess}? Too low."
    guess(actual, div(current_guess + upper, 2), current_guess..upper) 
  end 

  defp guess(actual, current_guess, lower.._) when actual < current_guess do
    IO.puts "Is it #{current_guess}? Too high."
    guess(actual, div(lower + current_guess, 2), lower..current_guess) 
  end 
end


# Algorithm/pattern
#273, 1..1000

#actual, current_guess, range
#273,    500,           1..500
#273,    250,           250..500
#273,    375,           250..375  actual < guessed
#273,    312,           250..312
#273,    265,           265..312
#273,    288,           265..288
#273,    276,           265..276
#273,    270,           270..276  actual > guessed

#273, 273 *** found ***


#actual, guessed, low..(high/2)
