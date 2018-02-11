defmodule Hightopics.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hightopics.Users.User


  schema "users" do
    field :email, :string
    field :username, :string
    has_many :topics, Hightopics.Topics.Topic
    has_many :comments, Hightopics.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
  end
end
