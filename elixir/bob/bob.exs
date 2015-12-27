defmodule Teenager do
  def hey(input) do
		sentence = String.strip(input)

    cond do
			is_yelling?(sentence) -> "Whoa, chill out!"
			is_question?(sentence) -> "Sure."
			is_empty?(sentence) -> "Fine. Be that way!"
			true -> "Whatever."
			# true -> raise "Your implementation goes here"
		end
  end

	defp is_yelling?(sentence) do
		String.upcase(sentence) == sentence && String.match?(sentence, ~r/\p{L}/)
	end

	defp is_question?(sentence) do
		String.ends_with?(sentence, "?")
	end

	defp is_empty?(""), do: true
	defp is_empty?(_sentence), do: false

end
