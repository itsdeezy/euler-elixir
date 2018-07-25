defmodule EulerElixir do
  use Mix.Project

  def project do
    [
      app: :euler_elixir,
      version: "1.0.0",
      elixir: "~> 1.6",
      elixirc_paths: ["solutions"],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application, do: [extra_applications: [:logger]]

  defp deps do
    [
      apex: "1.2.0",
      benchee: "~> 0.11",
      elixir_uuid: "~> 1.2",
      libgraph: "0.12.0"
    ]
  end
end
