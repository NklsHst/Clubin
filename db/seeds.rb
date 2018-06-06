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
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528124009/profile_52.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528124002/profile_51.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123948/profile_50.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123940/profile_49.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123931/profile_48.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123923/profile_47.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123914/profile_46.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123895/profile_44.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123905/profile_45.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123867/profile_41.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123887/profile_43.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123878/profile_42.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123853/profile_39.png',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123824/profile_37.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123844/profile_38.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123809/profile_35.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123797/profile_34.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528123773/profile_33.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122186/profile_32.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122175/profile_31.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122166/profile_30.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122156/profile_29.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122146/profile_28.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122134/profile_27.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122127/profile_26.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122101/profile_25.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122093/profile_24.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122085/profile_23.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122071/profile_22.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122060/profile_21.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122047/profile_20.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122035/profile_19.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122026/profile_18.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122017/profile_17.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528122006/profile_16.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121997/profile_15.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121989/profile_14.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121979/profile_13.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121971/profile_12.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121958/profile_11.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121947/profile_10.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121937/profile_9.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121925/profile_8.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121915/profile_7.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121906/profile_6.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121898/profile_5.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121889/profile_4.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121880/profile_3.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121868/profile_2.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528121858/profile_1.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528275701/28660610_10215553798348300_1701634647123296242_n.jpg',
'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_850/v1528292036/kai.jpg',
'http://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_850/v1528327451/niklas.jpg'
]

user_1 = User.new(
    user_name: "James",
    email: "James@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_1.save!
  p user_1

  user_2 = User.new(
    user_name: "Mary",
    email: "Mary@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_2.save!
  p user_2

  user_3 = User.new(
    user_name: "John",
    email: "John@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_3.save!
  p user_3

  user_4 = User.new(
    user_name: "Robert",
    email: "Robert@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_4.save!
  p user_4

  user_5 = User.new(
    user_name: "Michael",
    email: "Michael@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_5.save!
  p user_5

  user_6 = User.new(
    user_name: "Patricia",
    email: "Patricia@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_6.save!
  p user_6

  user_7 = User.new(
    user_name: "William",
    email: "William@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_7.save!
  p user_7

  user_8 = User.new(
    user_name: "Linda",
    email: "Linda@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_8.save!
  p user_8

  user_9 = User.new(
    user_name: "David",
    email: "David@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_9.save!
  p user_9

  user_10 = User.new(
    user_name: "Barbara",
    email: "Barbara@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_10.save!
  p user_10

  user_11 = User.new(
    user_name: "Richard",
    email: "Richard@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_11.save!
  p user_11

  user_12 = User.new(
    user_name: "Charles",
    email: "Charles@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_12.save!
  p user_12

  user_13 = User.new(
    user_name: "Elizabeth",
    email: "Elizabeth@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_13.save!
  p user_13

  user_14 = User.new(
    user_name: "Jennifer",
    email: "Jennifer@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_14.save!
  p user_14

  user_15 = User.new(
    user_name: "Joseph",
    email: "Joseph@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_15.save!
  p user_15

  user_16 = User.new(
    user_name: "Maria",
    email: "Maria@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_16.save!
  p user_16

  user_17 = User.new(
    user_name: "Thomas",
    email: "Thomas@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_17.save!
  p user_17

  user_18 = User.new(
    user_name: "Susan",
    email: "Susan@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_18.save!
  p user_18

  user_19 = User.new(
    user_name: "Margaret",
    email: "Margaret@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_19.save!
  p user_19

  user_20 = User.new(
    user_name: "Dorothy",
    email: "Dorothy@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_20.save!
  p user_20

  user_21 = User.new(
    user_name: "Christopher",
    email: "Christopher@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_21.save!
  p user_21

  user_22 = User.new(
    user_name: "Lisa",
    email: "Lisa@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_22.save!
  p user_22

  user_23 = User.new(
    user_name: "Daniel",
    email: "Daniel@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_23.save!
  p user_23

  user_24 = User.new(
    user_name: "Paul",
    email: "Paul@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_24.save!
  p user_24

  user_25 = User.new(
    user_name: "Mark",
    email: "Mark@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_25.save!
  p user_25

  user_26 = User.new(
    user_name: "Nancy",
    email: "Nancy@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_26.save!
  p user_26

  user_27 = User.new(
    user_name: "Donald",
    email: "Donald@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_27.save!
  p user_27

  user_28 = User.new(
    user_name: "George",
    email: "George@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_28.save!
  p user_28

  user_29 = User.new(
    user_name: "Kenneth",
    email: "Kenneth@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_29.save!
  p user_29

  user_30 = User.new(
    user_name: "Karen",
    email: "Karen@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_30.save!
  p user_30

  user_31 = User.new(
    user_name: "Steven",
    email: "Steven@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_31.save!
  p user_31

  user_32 = User.new(
    user_name: "Edward",
    email: "Edward@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_32.save!
  p user_32

  user_33 = User.new(
    user_name: "Brian",
    email: "Brian@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_33.save!
  p user_33

  user_34 = User.new(
    user_name: "Betty",
    email: "Betty@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_34.save!
  p user_34

  user_35 = User.new(
    user_name: "Helen",
    email: "Helen@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_35.save!
  p user_35

  user_36 = User.new(
    user_name: "Ronald",
    email: "Ronald@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_36.save!
  p user_36

  user_37 = User.new(
    user_name: "Sandra",
    email: "Sandra@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_37.save!
  p user_37

  user_38 = User.new(
    user_name: "Donna",
    email: "Donna@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_38.save!
  p user_38

  user_39 = User.new(
    user_name: "Anthony",
    email: "Anthony@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_39.save!
  p user_39

  user_40 = User.new(
    user_name: "Carol",
    email: "Carol@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_40.save!
  p user_40

  user_41 = User.new(
    user_name: "Kevin",
    email: "Kevin@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_41.save!
  p user_41

  user_42 = User.new(
    user_name: "Jason",
    email: "Jason@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_42.save!
  p user_42

  user_43 = User.new(
    user_name: "Matthew",
    email: "Matthew@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_43.save!
  p user_43

  user_44 = User.new(
    user_name: "Gary",
    email: "Gary@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_44.save!
  p user_44

  user_45 = User.new(
    user_name: "Ruth",
    email: "Ruth@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_45.save!
  p user_45

  user_46 = User.new(
    user_name: "Timothy",
    email: "Timothy@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_46.save!
  p user_46

  user_47 = User.new(
    user_name: "Sharon",
    email: "Sharon@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_47.save!
  p user_47

  user_48 = User.new(
    user_name: "Jose",
    email: "Jose@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_48.save!
  p user_48

  user_49 = User.new(
    user_name: "Michelle",
    email: "Michelle@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_49.save!
  p user_49

  user_50 = User.new(
    user_name: "Laura",
    email: "Laura@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_50.save!
  p user_50


  user_51 = User.new(
    user_name: "Sarah",
    email: "sarah@test.de",
    about_me:"",
    password: "123456",
    password_confirmation: "123456")
  user_51.save!
  p user_51

  users << user_51

  user_52 = User.new(
  user_name: "Kai",
  email: "kai@test.de",
  about_me:"",
  password: "123456",
  password_confirmation: "123456")
user_52.save!
p user_52

users << user_52

  user_53 = User.new(
  user_name: "Niklas",
  email: "niklas@test.de",
  about_me:"",
  password: "123456",
  password_confirmation: "123456")
user_53.save!
p user_53

users << user_53

User.all.each do |user|
  user.remote_picture_url = pictures.delete_at(0)
  user.save
  p user

  users << user
end

photos = [
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1527172370/sfjvkicspqt9qavou1yk.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1527172077/nokl2vhwz2jdycuc0per.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1527171806/s6apvw0nxiuas03eysii.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1527171609/mmwcbhnlk0ugikglvriu.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1527862547/lewagon.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_810/v1528286596/katerblau.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528286603/sisyphos-club-berlin.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_800/v1528287419/renate_1.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_800/v1528287450/Kitkat.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_800/v1528287484/Watergate.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528287484/Visionaere.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_800/v1528287468/Butzke.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_800/v1528287448/ipse-berlin.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/c_scale,w_800/v1528287468/Birgit.jpg',
  'https://res.cloudinary.com/dy4yxobpa/image/upload/v1528287492/Matrix.jpg',
]

location = Location.create!([{
  name: "Tresor",
  description: "Tresor is the biggest and most respected Techno club in Berlin. It's history began basically together with the creation of the city’s clubbing scene, right after Germany was unified. They started as a record label called Interfish at Ufo, the original center of Berlin house and techno. After its closure, the Tresor crew thought it would be a good idea to establish their own club.",
  address: "Köpenicker Str. 70, 10179 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "AVENUE Berlin",
  description: "From the Russian specialty restaurant to one of the hippest clubs in the capital - fifty years of condensed Berlin history. The Café Moskau was designed in 1959 by the architects Josef Kaiser and Horst Bauer as one of seven nationality restaurants in the eastern part of Berlin and was built from 1961 to 1964 in the immediate vicinity of the Alexanderplatz. After a long period of vacancy around the turn of the millennium, the young Berlin party scene rediscovered the object, thus setting the course for the contemporary use of this extraordinary location in the heart of Berlin.",
  address: "Karl-Marx-Allee 34, 10178 Berlin",
  music: 'Hip-Hop',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Berghain",
  description: "Berghain is the most well-known club in Berlin - and also one of the worldwide most famous clubs. It’s the church of Techno with the best sound system you can get. So be prepared to dance for hours and listen to top quality music.",
  address: "Am Wriezener Bahnhof, 10243 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Prince Charles",
  description: "In addition to the typical club nights, there are also readings, salon evenings and other cultural events in the calendar of events of the club. The eye-catcher inside is certainly the bar, which stands in the former swimming pool. Yes, that's right! No matter if you stand or sit at the bar, you always look down to the bartender. And otherwise, the extravagant continues in the club. The home cocktail, which is called Prince Charles, means to sit back and listen to the fine electric sounds.",
  address: "Prinzenstraße 85f, 10969 Berlin",
  music: ['Techno', 'House'].sample,
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Le Wagon Kitchen",
  description: "Legendary Cocktail-Nights every second Friday of the month",
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  music: 'Charts',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Kater Blau",
  description: "From the previous owners of Bar 25 & Katerholzig, Kater Blau is a big amusement park for adults. In a huge abandoned soap factory perfectly located by the Spree, you’ll find loads of dancefloors, a huge outside area with amazing lighting and you’ll really feel like part of the city clubbing scene. As in almost every club in town, they don’t mess with the quality of the sound.",
  address: "Holzmarktstraße 25, 10243 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Sisyphos",
  description: "Sisyphos is a place like no other. It’s a festival, it’s a club, it’s a beach, it’s a bar, it’s Alice’s Wonderland. Here you will find diverse ways of having fun. With a huge chill out area, an abandoned bus, a small lake surrounded by sand, a pizza place and a labyrinth of dance floors, you might lose yourself for hours or maybe even days inside.",
  address: "Hauptstraße 15, 10317 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Salon zur Wilden Renate",
  description: "If you’ve ever dreamed about clubbing in a circus, you’ll fall in love with this club. It’s name already describes the kind of atmosphere you’ll find: WILD. Besides a big outside area, a kitsch decoration and many dance floors, their main attraction is a huge and real labyrinth. So if you get lost, you’ll be condemned to live inside a club for the rest of your life. Not bad, huh?",
  address: "Alt-Stralau 70, 10245 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "KitKat",
  description: "Anthropological travel is the best expression to describe what you’ll experience at KitKat. Before you start asking yourself the kind of trouble you’re getting into, let’s make clear that this is a sex club. Don’t be afraid, it’s not as hardcore as it seems. The bathroom cleaner might ask you, if he can watch you while you’re pissing and you’ll probably see a few guys all in fours with someone leading them with a chain around their dick, but don’t feel uncomfortable.",
  address: "Köpenicker Str. 76, 10179 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Watergate",
  description: "Watergate is a hotspot for those who want to enjoy a great night with world's premier DJ talents. Names like Eric Morillo, Chicken Lips and Adam Freeland are common guests playing house, drum and bass and break-beat. There you'll get one of the most beautiful views from the Spree through its floor-ceiling plate glass windows.",
  address: "Falckensteinstraße 49, 10997 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Club der Visionäre",
  description: "Club Der Visionaere – a collection of canalside shacks near the Spree in Kreuzberg – is the destination for those who never want the party to end. True to the Berlinische insistence of relaxation, it's an understated, marginal kind of place where clubbers hang out on post-party weekend mornings or afternoons.",
  address: "Am Flutgraben, 12435 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Ritter Butzke",
  description: "Although it cut its illegal underground roots long ago, Ritter Butzke has hardly gone mainstream. Ensconced in an old factory with the requisite industrial decor, this party temple vibrates with techno, electro and minimal every weekend.",
  address: "Ritterstraße 26, 10969 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Ipse",
  description: "Located very close to Club der Visionaere, although way bigger with a capacity of 700, Ipse is another venue making the most of its waterside spot. Parties go on both inside and outside, house and techno acts making up the bulk of the program.",
  address: "Vor dem Schlesischen Tor 2, 10997 Berlin",
  music: 'Techno',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Birigt und Bier",
  description: "At daytime a biergarten, at night time a club. At Birgit and Bier you can spend the whole day (and nigth) and enjoy the nice atmosphere.",
  address: "Schleusenufer 3, 10997 Berlin",
  music: 'House',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  {
  name: "Matrix",
  description: "The Matrix is ​​a club in Berlin. The club is known as one of the filming locations of the RTL II series Berlin - Day & Night. The club was founded in 1995 and is located since autumn 1996 in ten vaults of the U-Bahn station Warschauer Straße in the district Friedrichshain. It is open seven days a week.",
  address: "Warschauer Pl. 18, 10245 Berlin",
  music: 'Charts',
  price_rating: (1..5).to_a.sample,
  LGBT_rating: (1..5).to_a.sample,
  },
  # {
  # name: "Heideglühen",
  # description: "Changing location often, you would never find Heideglühen if you didn’t know where to look. The venue itself is nestled amongst the trees, a glorified shanty town of DIY style wooden rooms, jutting balconies, benches, and tiny cabins. ",
  # address: "Seestraße 1, 113353 Berlin",
  # music: 'Techno',
  # price_rating: (1..5).to_a.sample,
  # LGBT_rating: (1..5).to_a.sample,
  # },











])

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
1.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (1),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#2 Avenue
2.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (2),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#3 Berghain
5.times do
  check_in = CheckIn.new(
    atmosphere_rating: (7..10).to_a.sample,
    queue_rating: (8..10).to_a.sample,
    location_id: (3),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#4 Prince Charles
1.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (4),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#5 Le Wagon
8.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (5),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#6 Kater Blau
5.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (6),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#7 Sisyphos
4.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..3).to_a.sample,
    location_id: (7),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#8 Salon
3.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..6).to_a.sample,
    queue_rating: (1..4).to_a.sample,
    location_id: (8),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#9 Kit Kat
1.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (9),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#10 Water Gate
4.times do
  check_in = CheckIn.new(
    atmosphere_rating: (9..10).to_a.sample,
    queue_rating: (1..2).to_a.sample,
    location_id: (10),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#11 Clube der Visionäre
5.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (11),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#12 Ritter Butzke
5.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (12),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#13 Ipse
3.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (13),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#14 Birgit & Bier
2.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (14),
    user_id: u)
  check_in.save!

  p check_in
  check_ins << check_in
  u += 1
end

#15 Matrix
1.times do
  check_in = CheckIn.new(
    atmosphere_rating: (1..10).to_a.sample,
    queue_rating: (1..10).to_a.sample,
    location_id: (15),
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

a = 1
30.times do

  friendship = Friendship.new(
  user_id: 52,
  partner_id: a)
  if friendship.user_id != friendship.partner_id
    friendship.save!
  else
    friendship.destroy!
  end

  p friendship
  friendships << friendship
  a += 1
end

b = 1
30.times do

  friendship = Friendship.new(
  user_id: 53,
  partner_id: b)
  if friendship.user_id != friendship.partner_id
    friendship.save!
  else
    friendship.destroy!
  end

  p friendship
  friendships << friendship
  b += 1
end

1.times do
friendship_one = Friendship.new(
  user_id: 51,
  partner_id: 52)
  if friendship_one.user_id != friendship_one.partner_id
    friendship_one.save!
  else
    friendship_one.destroy!
  end

  p friendship_one
  friendships << friendship_one

  friendship_two = Friendship.new(
  user_id: 51,
  partner_id: 53)
  if friendship_two.user_id != friendship_two.partner_id
    friendship_two.save!
  else
    friendship_two.destroy!
  end

  p friendship_two

  friendships << friendship_two

  friendship_three = Friendship.new(
  user_id: 52,
  partner_id: 53)
  if friendship_three.user_id != friendship_three.partner_id
    friendship_three.save!
  else
    friendship_three.destroy!
  end

  p friendship_three

  friendships <<  friendship_three
end




# get rid of redundant friendships




















