defmodule ExCrypto.Mixfile do
  use Mix.Project

  @source_url "https://github.com/awesome-elixir/awesome_ex_crypto"
  @version "0.10.0"

  def project do
    [
      app: :awesome_ex_crypto,
      name: "AwesomeExCrypto",
      version: @version,
      elixir: "~> 1.11",
      package: package(),
      deps: deps(),
      aliases: aliases(),
      docs: docs()
    ]
  end

  def application do
    [
      applications: applications(Mix.env())
    ]
  end

  defp applications(:test) do
    applications(:prod)
  end

  defp applications(_) do
    [:logger, :crypto, :public_key]
  end

  defp deps do
    [
      {:poison, ">= 2.0.0"},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"],
      test: ["test --trace"],
    ]
  end

  defp package do
    [
      description:
        "A wrapper around the Erlang Crypto module with sensible defaults " <>
          "for common tasks.",
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      maintainers: ["Raul Zavaczki", "Josh Austin"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://hexdocs.pm/awesome_ex_crypto/changelog.html",
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md": [],
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end
end
