defmodule EndlistBack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EndlistBackWeb.Telemetry,
      EndlistBack.Repo,
      {DNSCluster, query: Application.get_env(:endlist_back, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EndlistBack.PubSub},
      # Start a worker by calling: EndlistBack.Worker.start_link(arg)
      # {EndlistBack.Worker, arg},
      # Start to serve requests, typically the last entry
      EndlistBackWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EndlistBack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EndlistBackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
