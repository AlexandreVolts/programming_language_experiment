defmodule ElixirProgrammingLanguageExperimentTest do
  use ExUnit.Case
  doctest ElixirProgrammingLanguageExperiment

  test "greets the world" do
    assert ElixirProgrammingLanguageExperiment.hello() == :world
  end
end
