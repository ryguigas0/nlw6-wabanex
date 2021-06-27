# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Wabanex.Repo.insert!(%Wabanex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Wabanex.{Repo, User, Training}

%User{id: user_id} =
  User.changeset(%{
    name: "Sussus Amogus",
    email: "sussy@amongus.sus",
    password: "SussyBaka5723&",
    height: 2.2,
    weight: 88.3,
    fat_index: 0.66,
    muscle_index: 0.99
  })
  |> Repo.insert!()

%Training{id: training_id} =
  Training.changeset(%{
    start_date: "2021-06-28",
    end_date: "2021-12-30",
    user_id: user_id,
    exercises: [
      %{
        name: "Sussy hardbass",
        youtube_video_url: "https://www.youtube.com/watch?v=ywoBSL2_Kq8",
        protocol_description: "hardbass Chekrov!",
        repetitions: "4x20"
      },
      %{
        name: "Sussy synthwave",
        youtube_video_url: "https://www.youtube.com/watch?v=xvoZc8HVFQ4",
        protocol_description: "cool synth vibes",
        repetitions: "6x9"
      }
    ]
  })
  |> Repo.insert!()

IO.puts("\nTest user id: #{user_id}\nTest user training id: #{training_id}\n")
