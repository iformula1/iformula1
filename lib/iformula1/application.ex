defmodule Iformula1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Iformula1Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Iformula1.PubSub},
      # Start Finch
      {Finch, name: Iformula1.Finch},
      # Start the Endpoint (http/https)
      Iformula1Web.Endpoint
      # Start a worker by calling: Iformula1.Worker.start_link(arg)
      # {Iformula1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Iformula1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Iformula1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
