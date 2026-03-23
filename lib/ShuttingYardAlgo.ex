defmodule ShuttingYardAlgo do
  @spec compute(String.t(), String.t()) :: integer()
  def compute(expression, base \\ "0123456789", operators \\ "/*+-") do
    Tokenizer.run(expression, base, operators) |> Enum.each(fn x -> IO.puts(x) end)
    0
  end
end
