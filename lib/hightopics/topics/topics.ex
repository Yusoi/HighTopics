defmodule Hightopics.Topics do
  @moduledoc """
  The Topics context.
  """

  import Ecto.Query, warn: false
  alias Hightopics.Repo
  alias Hightopics.Topics.Topic
  alias Hightopics.Comments.Comment
  alias Hightopics.Themes.Theme

  @doc """
  Returns the list of topics.  ## Examples

      iex> list_topics()
      [%Topic{}, ...]

  """
  def list_topics do
    Repo.preload(Repo.all(Topic),:comments)
  end

  @doc """
  Gets a single topic.

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123)
      %Topic{}

      iex> get_topic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topic!(id), do: Repo.preload(Repo.get!(Topic, id),:comments)

  @doc """
  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value})
      {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a topic.

  ## Examples

      iex> update_topic(topic, %{field: new_value})
      {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Topic.

  ## Examples

      iex> delete_topic(topic)
      {:ok, %Topic{}}

      iex> delete_topic(topic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topic changes.

  ## Examples

      iex> change_topic(topic)
      %Ecto.Changeset{source: %Topic{}}

  """
  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end


  def link_topic_and_theme(topic = %Topic{}, theme = %Theme{}) do
      topic = Repo.preload(topic, :themes)
      themes = topic.themes ++ [theme]
                  |> Enum.map(&Ecto.Changeset.change/1)

      topic
      |> Ecto.Changeset.change
      |> Ecto.Changeset.put_assoc(:themes, themes)
      |> Repo.update
  end

  def link_topic_and_comment(topic = %Topic{}, comment = %Comment{}) do
      topic = Repo.preload(topic, :comments)
      comments = topic.comments ++ [comment]
                  |> Enum.map(&Ecto.Changeset.change/1)

      topic
      |> Ecto.Changeset.change
      |> Ecto.Changeset.put_assoc(:comments, comments)
      |> Repo.update
  end
end
