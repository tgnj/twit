defmodule Twit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TwitWeb.Telemetry,
      Twit.Repo,
      {DNSCluster, query: Application.get_env(:twit, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Twit.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Twit.Finch},
      # Start a worker by calling: Twit.Worker.start_link(arg)
      # {Twit.Worker, arg},
      # Start to serve requests, typically the last entry
      TwitWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Twit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TwitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
