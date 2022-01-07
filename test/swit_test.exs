defmodule SwitTest do
  use ExUnit.Case
  doctest Swit

  @generic_input_1 %{id: "x", tags: ["type", "category"], data: {"simple", "tuple"}}
  @generic_input_2 %{id: "y", tags: ["type"], data: %{content: "simple map"}}
  @generic_input_3 %{id: "z", tags: ["type", "list"], data: ["short", "list"]}

  test "store and retrieve" do
    assert :ok = Swit.store(@generic_input_1)
    assert @generic_input_1 == Swit.recall("x")
  end

  test "list tagged by y" do
    Swit.store(@generic_input)

    assert ["x", "y", "z"] == Swit.list_of("type")
    assert ["z"] == Swit.list_of("list")
    assert [] == Swit.list_of("failure")
  end
end
