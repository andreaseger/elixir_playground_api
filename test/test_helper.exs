ExUnit.start

# Mix.Task.run "ecto.drop", ["ApiPlayground.Repo"]
# Mix.Task.run "ecto.create", ["ApiPlayground.Repo"]
Mix.Task.run "ecto.migrate", ["ApiPlayground.Repo"]

defmodule ApiPlaygroundTest.Case do
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.Postgres

  setup do
    Postgres.begin_test_transaction(ApiPlayground.Repo)

    on_exit fn ->
      Postgres.rollback_test_transaction(ApiPlayground.Repo)
    end
  end


  using do
    quote do
      import ApiPlaygroundTest.Case
    end
  end
end
