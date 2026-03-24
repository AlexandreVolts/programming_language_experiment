defmodule Tokenizer do
  @type token :: String.t()
  @type base :: String.t()
  @type operators :: String.t()

  @spec is_operator_valid?(token(), operators()) :: boolean()
  defp is_operator_valid?(token, operators) do
    String.length(token) === 1 and String.contains?(operators, token)
  end

  @spec is_number_valid?(token(), base()) :: boolean()
  defp is_number_valid?(token, base) do
    codepoints_base = base |> String.codepoints()

    token
    |> String.codepoints()
    |> Enum.all?(fn digit -> Enum.member?(codepoints_base, digit) end)
  end

  @spec merge_tokens(list(String.t()), list(operators())) :: list(token())
  defp merge_tokens(numbers, operators) do
    if (length(numbers) === 1) do
      numbers
    else
      [hd(numbers), hd(operators)] ++ merge_tokens(tl(numbers), tl(operators))
    end
  end

  @spec is_token_list_valid?(list(token()), base(), operators()) :: boolean()
  defp is_token_list_valid?([number], base, _operators), do: is_number_valid?(number, base)

  defp is_token_list_valid?([number, operator | rest], base, operators) do
    IO.puts("nbr: #{number} #{base} #{is_number_valid?(number, base)}")
    IO.puts("op: #{operator} #{operators} #{is_operator_valid?(operator, operators)}")
    IO.puts("tokens: #{rest |> Enum.join()} #{is_token_list_valid?(rest, base, operators)}")
    is_number_valid?(number, base) and
      is_operator_valid?(operator, operators) and
      is_token_list_valid?(rest, base, operators)
  end

  defp is_token_list_valid?(_, _, _), do: false

  @spec run(String.t(), base(), operators()) :: list(token()) | nil
  def run(expression, base, operators) do
    numbers = String.split(expression, operators |> String.codepoints(), trim: true)
    extacted_operators = String.split(expression, base |> String.codepoints(), trim: true)
    tokens = merge_tokens(numbers, extacted_operators)
    if !is_token_list_valid?(tokens, base, operators), do: nil, else: tokens
  end
end
