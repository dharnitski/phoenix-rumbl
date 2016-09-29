defmodule Rumbl.CounterTest do
  use ExUnit.Case
  alias Rumbl.Counter

  test "set initial value" do
    {:ok, pid} = Counter.start_link(1)
    assert Counter.val(pid) == 1
  end

  test "increment" do
    {:ok, pid} = Counter.start_link(1)
    Counter.inc(pid)
    assert Counter.val(pid) == 2
  end

  test "decrement" do
    {:ok, pid} = Counter.start_link(1)
    Counter.dec(pid)
    assert Counter.val(pid) == 0
  end

end
