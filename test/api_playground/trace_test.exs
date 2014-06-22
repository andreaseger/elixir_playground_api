defmodule ApiPlayground.TraceTest do
  use ApiPlaygroundTest.Case
  alias ApiPlayground.Trace

  test "validate data" do
    trace = struct(Trace, data: "[{ \"latitude\": 32.9377784729004, \"longitude\": -117.230392456055 }]")
    assert Trace.validate(trace) == []

    trace = struct(Trace, data: nil)
    assert Trace.validate(trace) == [{:data, "missing data"}]

    trace = struct(Trace, data: "")
    assert Trace.validate(trace) == [{:data, "missing data"}]

    trace = struct(Trace, data: "[{ \"latitude\": 32.9377784729004, \"longitude\": -117.23039")
    assert Trace.validate(trace) == [{:data, "malformed json"}]
  end
end