defmodule ElvenGardUniverse.Society.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :name

    has_many :heros, ElvenGardUniverse.Entity.Hero

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end