defmodule Tokenizer do
  @spec merge_tokens(list(String.t()), list(String.t())) :: list(String.t())
  defp merge_tokens(numbers, operators) do
    if (length(numbers) === 1) do
      numbers
    else
      [hd(numbers), hd(operators)] ++ merge_tokens(tl(numbers), tl(operators))
    end
  end

  @spec run(String.t(), String.t(), String.t()) :: list(String.t())
  def run(expression, base, operators) do
    numbers = String.split(expression, operators |> String.split("", trim: true), trim: true)
    operators = String.split(expression, base |> String.split("", trim: true), trim: true)
    merge_tokens(numbers, operators)
  end
end
