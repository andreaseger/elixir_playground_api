defmodule ApiPlayground.Mixfile do
  use Mix.Project

  def project do
    [ app: :api_playground,
      version: "0.0.1",
      elixir: "~> 0.14.0",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { ApiPlayground, [] },
      applications: [:phoenix, :plug, ]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:phoenix, "0.2.9"},
      {:cowboy, "~> 0.10.0", github: "extend/cowboy", optional: true},
      {:ecto, github: "elixir-lang/ecto" },
      {:postgrex, github: "ericmj/postgrex", override: true }
    ]
  end
end
