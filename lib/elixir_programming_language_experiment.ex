defmodule ElixirProgrammingLanguageExperiment do
  use Application

  def start(_type, _args) do
    base = IO.gets("Please enter a base (default: 0123456789): ")

    IO.gets("Please enter an expression: ")
    |> String.trim()
    |> ShuttingYardAlgo.compute(
      if base === "\n",
      do: "0123456789",
      else: base
    )
    |> IO.puts()

    Supervisor.start_link([], strategy: :one_for_one)
  end
end
