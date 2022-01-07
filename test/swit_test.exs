defmodule SwitTest do
  use ExUnit.Case
  doctest Swit

  test "greets the world" do
    assert Swit.hello() == :world
  end
end
