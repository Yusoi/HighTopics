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


#Themes
Alias Hightopics.Themes.Theme
Alias Hightopics.Topics.Topics
Alias Hightopics.Users.User
Alias Hightopics.Comments.Comment
Repo.delete_all(Theme)


