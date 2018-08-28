defmodule ChunkySVG.Mixfile do
  use Mix.Project

  def project do
    [
      app: :chunky_svg,
      version: "0.0.4",
      elixir: "~> 1.6",
      deps: deps,
      package: package,
      description: """
        A library for drawing things with SVG
      """
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:xml_builder, "~> 2.0"}
    ]
  end

  defp package do
    [
      contributors: ["Michael Ries", "Jevgenij Semionov"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/jegaxd26/chunky_svg"}
    ]
  end
end
