defmodule ShuttingYardAlgo do
  @spec compute(String.t(), String.t()) :: integer() | nil
  def compute(expression, base \\ "0123456789", operators \\ "/*+-") do
    tokens = Tokenizer.run(expression, base, operators)

    if tokens === nil do
      nil
    else
      tokens |> Enum.each(fn x -> IO.puts("#{x}") end)
      0
    end
  end
end
