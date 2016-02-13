defmodule Mailchimp.Mixfile do
  use Mix.Project

  def project do
    [app: :mailchimp,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:httpoison, "~> 0.8.1"},
     {:poison, "~> 2.0"}]
  end
end
