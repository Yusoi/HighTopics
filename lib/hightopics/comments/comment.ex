defmodule Hightopics.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hightopics.Comments.Comment


  schema "comments" do
    field :content, :string
    field :rating, :integer

    belongs_to :user, User
    belongs_to :topic , Topic

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:content, :rating])
    |> validate_required([:content, :rating])
  end
end
