defmodule Words do
  @doc """
  Count the number of words in the sentence.
  Words are compared case-insensitively.
  """

  @spec count(String.t) :: map()
  def count(sentence) do
		sentence
		|> String.downcase
		|> spilt_words
		|> count_words
  end

	defp spilt_words(sentence) do
		Regex.scan ~r/(*UTF)[\p{L}0-9-]+/i, sentence
	end

	defp count_words(word_list) do
		Enum.reduce word_list, %{}, &(reducer(&1, &2))
	end

	defp reducer([word], result) do
		Dict.update result, word, 1, &(&1 + 1)
	end
end
