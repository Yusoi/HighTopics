defmodule Hightopics.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hightopics.Users.User
  alias Hightopics.Topics.Topic


  schema "users" do
    field :email, :string
    field :username, :string
    has_many :topics, Topic

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :topics])
    |> validate_required([:username, :email, :topics])
  end
end
