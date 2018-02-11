alias Hightopics.Repo
alias Hightopics.Themes
alias Hightopics.Themes.Theme
alias Hightopics.Topics
alias Hightopics.Topics.Topic
alias Hightopics.Users
alias Hightopics.Users.User
alias Hightopics.Comments

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
    Comments.create_comment (list_to_map list)
  end

  defp list_to_map(list) do
    Enum.into(list, %{})
  end
end

Repo.delete_all(User)
Populate.add_user! username: "Maria", email: "1@gmail.pt"
Populate.add_user! username: "bertinho", email: "asdsad@protonmail.pt"

Repo.delete_all(Topic)

Populate.add_topic! name: "Last Shadow Puppets", description: "Banda Inglesa", rating: 10

Populate.add_topic! name: "Submarine", description: "2011 film", rating: 10
Populate.add_topic! name: "Politics", description: "2011 film", rating: 10
Populate.add_topic! name: "Submarine", description: "2011 film", rating: 10
Populate.add_topic! name: "Submarine", description: "2011 film", rating: 10
Populate.add_topic! name: "Submarine", description: "2011 film", rating: 10
Populate.add_topic! name: "Submarine", description: "2011 film", rating: 10
Populate.add_topic! name: "Submarine", description: "2011 film", rating: 10

Repo.delete_all(Theme)
Populate.add_theme! name: "Music", description: "Music is a form of art; an expression of emotions through harmonic frequencies."

Populate.add_theme! name: "Films", description: "a series of still images that when shown on a screen create an illusion of motion images."

Populate.add_theme! name: "Politics", description: "The process of making decisions that apply to members of a group."

Populate.add_theme! name: "Philosophy", description: "Philosophy is the study of general and fundamental problems concerning matters such as existence, knowledge, values, reason, mind, and language"

Populate.add_theme! name: "TV show", description: "A música é uma forma de arte que se constitui na combinação de vários sons e ritmos, seguindo uma pré-organização ao longo do tempo."

Populate.add_theme! name: "Book", description: "Series of pages assembled for easy portability and reading, as well as the composition contained in it."

Populate.add_theme! name: "Food", description: "Food is what people and animals eat"

Populate.add_theme! name: "Sports", description: "All forms of competitive physical activity or games which, through casual or organised participation, aim to use, maintain or improve physical ability and skills while providing enjoyment to participants, and in some cases, entertainment for spectators"

Populate.add_theme! name: "Current Events", description: "Information provided through many different media: word of mouth, printing, postal systems, broadcasting, electronic communication, and also on the testimony of observers and witnesses to events. It is also used as a platform to manufacture opinion for the population"

Populate.add_theme! name: "Family", description: "Group of people affiliated either by consanguinity (by recognized birth), affinity (by marriage or other relationship), or co-residence "

for a <-  Repo.all(Topic) do
  Populate.add_comment!(content: "Pretty Beautiful", rating: 20)
  Populate.add_comment!(content: "Things to do", rating: 20)
  Populate.add_comment!(content: "WoW!", rating: 20)
  Populate.add_comment!(content: "Cool", rating: 20)
  Populate.add_comment!(content: "Fomented an incredible discussion!", rating: 20)
  Populate.add_comment!(content: "Could not ask for better!", rating: 20)
  Populate.add_comment!(content: "Without doubt a great topic and a great WebApp", rating: 20)
  Populate.add_comment!(content: "Incredible !!!!!!!", rating: 20)
end

#Topics.link_topic_and_comment(Topics.get_topic!(1), Comments.get_comment!(1))


for a <- Repo.all(Topic) do
  for b <- Repo.all(Theme) do
    Topics.link_topic_and_theme(a,b)
  end
end

for {a,b} <- Enum.with_index(Repo.all(Topic)) do
  for x <- 0..7, do: Topics.link_topic_and_comment(a, Comments.get_comment!((x+1)+ (b*8)))
end
#IO.puts Themes.random.name

#for a <- Repo.all(Topic) do
#  x = Repo.preload(a, :themes)
#  for b <- x.themes do
#    IO.puts b.name
#  end
#end
