# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hightopics.Repo.insert!(%Hightopics.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Hightopics.Repo
alias Hightopics.Themes
alias Hightopics.Themes.Theme
alias Hightopics.Topics
alias Hightopics.Topics.Topic
alias Hightopics.Users
alias Hightopics.Users.User
alias Hightopics.Comments
alias Hightopics.Comments.Comment
alias Ecto.Changeset

Repo.delete_all(Theme)

defmodule Populate do
  def fresh_start! do
  end

  def add_user!(list) do
    Users.create_user list_to_map list
  end

  def add_theme!(list) do
    Themes.create_theme list_to_map list
  end

  def add_topic!(list) do
    Topics.create_topic list_to_map list
  end

  def add_comment!(list) do
    Comments.create_comment list_to_map list
  end

  defp list_to_map(list) do
    Enum.into(list, %{})
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
end

Repo.delete_all(User)
Populate.add_user! username: "resende", email: "1@123.pt"
Populate.add_user! username: "bertinho", email: "asdsad@qasd.pt"

Repo.delete_all(Topic)
Populate.add_topic! name: "Last Shadow Puppets", description: "Banda inglesa", rating: 10
Populate.add_topic! name: "Submarine", description: "Filme de 2011", rating: 10

Repo.delete_all(Theme)
Populate.add_theme! name: "Musica", description: "A música é uma forma de arte que se constitui na combinação de vários sons e ritmos, seguindo uma pré-organização ao longo do tempo."
Populate.add_theme! name: "Filme", description: "É um produto audiovisual finalizado, com uma certa duração, para ser exibido no cinema, na televisão ou em algum outro veículo"


for a <- Repo.all(Topic) do
  for b <- Repo.all(Theme) do
    Populate.link_topic_and_theme(a,b)
  end
end

#for a <- Repo.all(Topic) do
#  x = Repo.preload(a, :themes)
#  for b <- x.themes do
#    IO.puts b.name
#  end
#end
