# Info to seed file
# Seed file is currently only for testin purpose and not optimized for presentation
# The messages model is still missing.
# For the chackin queue value i set a sample size from 1 to 300 for the case we will calculate in minutes.(Should be changed if we decide otherwise)
# Friendship migth have a wired patter due to the choosen sample logic.



require 'faker'
require 'open-uri'

Location.destroy_all
User.destroy_all
CheckIn.destroy_all
Friendship.destroy_all

users = []
locations = []
check_ins = []
friendships = []

50.times do
  user = User.new(
    user_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "yooooooooo",
    password_confirmation: "yooooooooo")
  user.save!

  p user
  users << user
end

photos = [
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172370/sfjvkicspqt9qavou1yk.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172077/nokl2vhwz2jdycuc0per.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527171806/s6apvw0nxiuas03eysii.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527171609/mmwcbhnlk0ugikglvriu.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527169703/deyovi9txmvejfllxx1v.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527170606/xs8crhr5t6nm1jcdzfiy.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527170666/mipctjvfzc9c0luai3ff.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527170737/d9pxyc0unkkt0yzmtgif.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527171480/mvltk3ugbhutnvkj1nfd.jpg',
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527172553/mb19whtgatolc6p6h7fa.jpg',
]

location = Location.create!([{
  name: "Tresor",
  description: "Auferstanden in Ruinen: Nach zweijähriger Pause hat der legendäre Tresor in einem ehemaligen Heizkraftwerk eine neue Heimat gefunden.
  Entstanden ist ein spektakulärer Club-Tempel: Der so genannte „Batterieraum“ ist würdiger Nachfolger des Globus, die „+4 Bar“ bietet einen atemberaubenden Blick in die Kraftwerksruine und in den Tresor Keller gelangt man durch einen 30 Meter langen Tunnel.",
  address: "Köpenicker Str. 70, 10179 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "AVENUE Berlin",
  description: "Vom russischen Spezialitäten-Restaurant zu einem der angesagtesten Clubs der Hauptstadt – fünfzig Jahre komprimierte Berliner Geschichte. Das Café Moskau wurde 1959 von den Architekten Josef Kaiser und Horst Bauer als eines von sieben Nationalitätenrestaurants im Ostteil Berlins geplant und von 1961 bis 1964 in unmittelbarer Nähe zum Alexanderplatz errichtet. Nach längerem Leerstand entdeckte um die Jahrtausendwende die junge Berliner Partyszene das Objekt wieder, und stellte somit die Weichen für die zeitgemäße Nutzung dieser aussergewöhnlichen Location im Herzen Berlins.
  Als integrativer Bestandteil des denkmalgeschützten Café Moskau, eröffnete im Jahr 2013 der Club AVENUE seine Pforten. Konzipiert und umgebaut von dem international renommierten Architekten-Studio karhard (unter anderem bekannt für das Design namhafter Clubs wie das „Pacha“ in München oder die „Panorama Bar“ im Berliner Berghain), zählt das AVENUE heute mit seinem Mix aus schlichter Eleganz, zeitlosen Designelementen und einer wohl dosierten Portion Understatement zu den Top-Clubs der Hauptstadt.",
  address: "Karl-Marx-Allee 34, 10178 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Berghain",
  description: "Das riesige Gebäude ist ein inzwischen legendärer Anziehungspunkt für feierwütige Gäste. Wer trotz der harten Türpolitik rein darf, kann von Samstagabend bis Montagmorgen verweilen, denn so lange hat der vierstöckige Club geöffnet.",
  address: "Am Wriezener Bahnhof, 10243 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Prince Charles",
  description: "Neben den typischen Clubnächten finden sich auch Lesungen, Salonabende und andere kulturelle Veranstaltungen im Veranstaltungskalender des Clubs. Der Blickfang im Innern ist sicherlich die Bar, die im ehemaligen Schwimmbad steht. Ja, richtig gehört! Egal, ob man an der Bar steht oder sitzt, man blickt immer zum Barkeeper herunter. Und auch sonst setzt sich das Extravagante im Club fort. Beim Hauscocktail, der sich „Prince Charles“ nennt, heisst es zurücklehnen und den feinen Elektro-Klängen lauschen.",
  address: "Prinzenstraße 85f, 10969 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Kremanski",
  description: "Kleine Auszeit gefällig? Willkommen im KREMANSKI, direkt am Kotti! Von früh bis spät erwartet Euch im Kremanski ein breites, dennoch besonderes Angebot: Frühstück mit Barista-Kaffee, kreativer Mittagstisch, hausgemachter Kuchen bis hin zum lokal gebrauten Bier oder Cocktail am Abend. Im Sommer gibt´s auch selbstgemachtes Eis. Viele vegane Optionen. Dazu ausgesuchter Sound, je nach Stimmung gefühlvoll, urban-lässig oder tanzbar, manchmal auch live.",
  address: "Adalbertstraße 96, 10999 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Neue Odessa Bar",
  description: "Früher gemütliche Kiezkneipe, heute Treffpunkt für Leute aus Mode und Kunst – die Neue Odessa Bar hat sich um 180 Grad gedreht. Seit der Neueröffnung gibt es Türsteher, eine neue schicke Einrichtung und täglich legen DJs auf. Der Geschäftsführer empfiehlt den Moscow Mule mit Wodka, Ginger Beer, Limettensaft und Gurke",
  address: "Torstraße 89, 10119 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Schmittz",
  description: "In der Torstraße ist das Schmittz für Fußballfans längst eine feste Adresse: Jedes Bundesliga- und Champions-League-Spiel wird übertragen, dann ist allerdings recht frühes Erscheinen angesagt. Wer auch montags nicht ohne die beliebte Sportart kann, sollte ab 20 Uhr vorbeischauen, zum Kickerturnier, an dem man auch sehr gern alleine teilnehmen kann. Die Partner werden ausgelost, und für den Sieger gibt es einen Pokal. Wem das nicht reicht, der vergnügt sich mit Tischtennis und Dart.",
  address: "Gormannstraße 19, 10119 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Amano Bar",
  description: "Mit Blick über die Dächer Berlins kann man seinen Cocktail schlürfen und sich in der Ruhe einfach entspannen. Der perfekte Ort, mit Freunden bei einem Drink in der Sonne zu quatschen und dann später den Sonnenuntergang zu genießen.",
  address: "Auguststraße 43, 10119 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Sandmann",
  description: "Traditionsadresse auf der Neuköllner Reuterstraße. Im Juni 2014 hat der Sandmann seinen 33. Geburtstag gefeiert. Als Musikcafé und Kiezkneipe ist die Location im Neuköllner Nachtleben fest verwurzelt.",
  address: "Reuterstraße 7, 12053 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "The Unique Bar",
  description: "Die 200 verschiedene Variationen der „Liquid Kitchen“-Cocktails auf der Getränkekarte lassen einem die Entscheidung nicht leicht fallen. Dabei handelt es sich um Mixgetränke, bei denen Zutaten verwendet werden, die normalerweise in den Suppentopf kommen - rosa Pfeffer, Rosmarin oder Paprika. Jeden Monat wird vom Barchef ein Monatscocktail kreiert, wie zum Beispiel der Kentucky Gum - eine kreative Version des bekannten Mint Julep.",
  address: "Sheraton Berlin Grand Hotel Esplanade, Lützowufer 15, 10785 Berlin",
  music: ['Techno', 'House', 'Hip-Hop', 'Charts'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  }])

  p location

Location.all.each do |location|
  location.remote_photo_url = photos.delete_at(0)
  location.save
  p location

  locations << location
end

example_user_ids = (1..50).to_a
i = 1
50.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..100).to_a.sample,
    queue_rating: (1..300).to_a.sample,
    location_id: (1..10).to_a.sample,
    user_id: example_user_ids[i])
  check_in.save!

  i += 1

  p check_in
  check_ins << check_in
end

100.times do
  friendship = Friendship.new(
  user_id: (1..50).sample,
  partner_id: (51..100).sample)
  friendship.save!

  p friendship
  friendships << friendship
end






















