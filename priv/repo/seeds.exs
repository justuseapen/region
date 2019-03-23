# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Region.Repo.insert!(%Region.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Region.Docs
alias Region.LocationDocs

{:ok, doc1} = Docs.create_doc(%{title: "hello world", body: "hellooooooooo BIA BIA"})
{:ok, doc2} = Docs.create_doc(%{title: "foo", body: "foo body"})
{:ok, doc3} = Docs.create_doc(%{title: "bar", body: "bar body"})

LocationDocs.create_location_doc(%{doc_id: doc1.id, latitude: 39.305246, longitude: -76.616582})
LocationDocs.create_location_doc(%{doc_id: doc2.id, latitude: 39.274070, longitude: -76.590790})
LocationDocs.create_location_doc(%{doc_id: doc3.id, latitude: 39.286830, longitude: -76.609320})
