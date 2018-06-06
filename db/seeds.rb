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

pictures = [
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528124009/profile_52.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528124002/profile_51.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123948/profile_50.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123940/profile_49.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123931/profile_48.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123923/profile_47.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123914/profile_46.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123895/profile_44.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123905/profile_45.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123867/profile_41.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123887/profile_43.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123878/profile_42.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123853/profile_39.png',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123824/profile_37.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123844/profile_38.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123809/profile_35.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123797/profile_34.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528123773/profile_33.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122186/profile_32.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122175/profile_31.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122166/profile_30.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122156/profile_29.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122146/profile_28.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122134/profile_27.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122127/profile_26.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122101/profile_25.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122093/profile_24.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122085/profile_23.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122071/profile_22.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122060/profile_21.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122047/profile_20.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122035/profile_19.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122026/profile_18.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122017/profile_17.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528122006/profile_16.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121997/profile_15.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121989/profile_14.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121979/profile_13.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121971/profile_12.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121958/profile_11.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121947/profile_10.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121937/profile_9.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121925/profile_8.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121915/profile_7.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121906/profile_6.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121898/profile_5.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121889/profile_4.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121880/profile_3.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121868/profile_2.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/v1528121858/profile_1.jpg'
]


user_1 = User.new(
    user_name: "James",
    email: "James@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_1.save!
  p user_1

  user_2 = User.new(
    user_name: "Mary",
    email: "Mary@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_2.save!
  p user_2

  user_3 = User.new(
    user_name: "John",
    email: "John@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_3.save!
  p user_3

  user_4 = User.new(
    user_name: "Robert",
    email: "Robert@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_4.save!
  p user_4

  user_5 = User.new(
    user_name: "Michael",
    email: "Michael@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_5.save!
  p user_5

  user_6 = User.new(
    user_name: "Patricia",
    email: "Patricia@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_6.save!
  p user_6

  user_7 = User.new(
    user_name: "William",
    email: "William@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_7.save!
  p user_7

  user_8 = User.new(
    user_name: "Linda",
    email: "Linda@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_8.save!
  p user_8

  user_9 = User.new(
    user_name: "David",
    email: "David@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_9.save!
  p user_9

  user_10 = User.new(
    user_name: "Barbara",
    email: "Barbara@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_10.save!
  p user_10

  user_11 = User.new(
    user_name: "Richard",
    email: "Richard@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_11.save!
  p user_11

  user_12 = User.new(
    user_name: "Charles",
    email: "Charles@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_12.save!
  p user_12

  user_13 = User.new(
    user_name: "Elizabeth",
    email: "Elizabeth@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_13.save!
  p user_13

  user_14 = User.new(
    user_name: "Jennifer",
    email: "Jennifer@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_14.save!
  p user_14

  user_15 = User.new(
    user_name: "Joseph",
    email: "Joseph@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_15.save!
  p user_15

  user_16 = User.new(
    user_name: "Maria",
    email: "Maria@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_16.save!
  p user_16

  user_17 = User.new(
    user_name: "Thomas",
    email: "Thomas@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_17.save!
  p user_17

  user_18 = User.new(
    user_name: "Susan",
    email: "Susan@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_18.save!
  p user_18

  user_19 = User.new(
    user_name: "Margaret",
    email: "Margaret@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_19.save!
  p user_19

  user_20 = User.new(
    user_name: "Dorothy",
    email: "Dorothy@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_20.save!
  p user_20

  user_21 = User.new(
    user_name: "Christopher",
    email: "Christopher@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_21.save!
  p user_21

  user_22 = User.new(
    user_name: "Lisa",
    email: "Lisa@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_22.save!
  p user_22

  user_23 = User.new(
    user_name: "Daniel",
    email: "Daniel@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_23.save!
  p user_23

  user_24 = User.new(
    user_name: "Paul",
    email: "Paul@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_24.save!
  p user_24

  user_25 = User.new(
    user_name: "Mark",
    email: "Mark@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_25.save!
  p user_25

  user_26 = User.new(
    user_name: "Nancy",
    email: "Nancy@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_26.save!
  p user_26

  user_27 = User.new(
    user_name: "Donald",
    email: "Donald@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_27.save!
  p user_27

  user_28 = User.new(
    user_name: "George",
    email: "George@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_28.save!
  p user_28

  user_29 = User.new(
    user_name: "Kenneth",
    email: "Kenneth@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_29.save!
  p user_29

  user_30 = User.new(
    user_name: "Karen",
    email: "Karen@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_30.save!
  p user_30

  user_31 = User.new(
    user_name: "Steven",
    email: "Steven@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_31.save!
  p user_31

  user_32 = User.new(
    user_name: "Edward",
    email: "Edward@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_32.save!
  p user_32

  user_33 = User.new(
    user_name: "Brian",
    email: "Brian@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_33.save!
  p user_33

  user_34 = User.new(
    user_name: "Betty",
    email: "Betty@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_34.save!
  p user_34

  user_35 = User.new(
    user_name: "Helen",
    email: "Helen@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_35.save!
  p user_35

  user_36 = User.new(
    user_name: "Ronald",
    email: "Ronald@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_36.save!
  p user_36

  user_37 = User.new(
    user_name: "Sandra",
    email: "Sandra@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_37.save!
  p user_37

  user_38 = User.new(
    user_name: "Donna",
    email: "Donna@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_38.save!
  p user_38

  user_39 = User.new(
    user_name: "Anthony",
    email: "Anthony@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_39.save!
  p user_39

  user_40 = User.new(
    user_name: "Carol",
    email: "Carol@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_40.save!
  p user_40

  user_41 = User.new(
    user_name: "Kevin",
    email: "Kevin@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_41.save!
  p user_41

  user_42 = User.new(
    user_name: "Jason",
    email: "Jason@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_42.save!
  p user_42

  user_43 = User.new(
    user_name: "Matthew",
    email: "Matthew@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_43.save!
  p user_43

  user_44 = User.new(
    user_name: "Gary",
    email: "Gary@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_44.save!
  p user_44

  user_45 = User.new(
    user_name: "Ruth",
    email: "Ruth@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_45.save!
  p user_45

  user_46 = User.new(
    user_name: "Timothy",
    email: "Timothy@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_46.save!
  p user_46

  user_47 = User.new(
    user_name: "Sharon",
    email: "Sharon@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_47.save!
  p user_47

  user_48 = User.new(
    user_name: "Jose",
    email: "Jose@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_48.save!
  p user_48

  user_49 = User.new(
    user_name: "Michelle",
    email: "Michelle@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_49.save!
  p user_49

  user_50 = User.new(
    user_name: "Laura",
    email: "Laura@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_50.save!
  p user_50

User.all.each do |user|
  user.remote_picture_url = pictures.delete_at(0)
  user.save
  p user

  users << user
end

user_51 = User.new(
    user_name: "Sarah",
    email: "sarah@test.de",
    password: "123456",
    password_confirmation: "123456")
  user_51.save!
  p user_51

  users << user_51

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
  'http://res.cloudinary.com/dy4yxobpa/image/upload/v1527862547/lewagon.jpg',
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
  name: "Le Wagon Kitchen",
  description: "Legendary Cocktail-Nights every second Friday of the month",
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
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


# 50.times do
#   check_in = CheckIn.new(
#     atmosphere_rating: (1..10).to_a.sample,
#     queue_rating: (1..10).to_a.sample,
#     location_id: (1..11).to_a.sample,
#     user_id: users.sample.id)
#   check_in.save!

#   p check_in
#   check_ins << check_in
# end

#1 Tresor
u = 1
3.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#2 Avenue
5.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#3 Berghain
6.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#4 Prince Charles
2.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#5 Kremanski
4.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#6 Neue Odessa Bar
3.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#7 Schmitz
1.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#8 Amano Bar
3.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#9 Sandmann
3.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#10 Le Wagon
12.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#11 Unique Bar
8.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1..11).to_a.sample,
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end








i = 1

30.times do

  friendship = Friendship.new(
  user_id: 51,
  partner_id: i)
  if friendship.user_id != friendship.partner_id
    friendship.save!
  else
    friendship.destroy!
  end

  p friendship
  friendships << friendship
  i += 1
end

# get rid of redundant friendships




















