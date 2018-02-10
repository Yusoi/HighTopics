defmodule Hightopics.Topics.Topic do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hightopics.Topics.Topic


  schema "topics" do
    field :description, :string
    field :name, :string
    field :rating, :integer
    many_to_many :themes, Theme, join_through: "themes_topics"
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Topic{} = topic, attrs) do
    topic
    |> cast(attrs, [:name, :description, :rating])
    |> validate_required([:name, :description, :rating])
  end
end
