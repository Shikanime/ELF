defmodule ElvenGardBastion.Endpoint do
  use Supervisor

  def start_link(init_args) do
    Supervisor.start_link(__MODULE__, init_args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    children = [
      :ranch.child_spec(
        ElvenGardBastion.GateEndpoint,
        10,
        :ranch_tcp,
        [port: 4123],
        ElvenGardBastion.LoginProtocol,
        []
      ),
      :ranch.child_spec(
        ElvenGardBastion.WorldEndpoint,
        10,
        :ranch_tcp,
        [port: 4124],
        ElvenGardBastion.WorldProtocol,
        []
      ),
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end