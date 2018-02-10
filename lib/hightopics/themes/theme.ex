defmodule Hightopics.Themes.Theme do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hightopics.Themes.Theme


  schema "themes" do
    field :description, :string
    field :name, :string
    many_to_many :topics , Post, join_through: "themes_topics"

    timestamps()
  end

  @doc false
  def changeset(%Theme{} = theme, attrs) do
    theme
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
