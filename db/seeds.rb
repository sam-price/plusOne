# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creating seeds to populate my database. A lot of the information on there is going to be
# preset data that the users can select. The only exceptions will be fields like user bio where
# they can write their own strings

######################
### SEEDING TEST USERS
######################
users = User.create([
  { first_name: 'Jack', last_name: 'Rackham', email: 'jack@rackham.com', password: 'password', password_confirmation: 'password' },
  { first_name: 'Billy', last_name: 'Bones', email: 'billy@bones.com', password: 'password', password_confirmation: 'password' },
  { first_name: 'James', last_name: 'McCaw', email: 'james@mccaw.com', password: 'password', password_confirmation: 'password' },
  { first_name: 'Anne', last_name: 'Bonny', email: 'anne@bonny.com', password: 'password', password_confirmation: 'password' },
  { first_name: '"Long" John', last_name: 'Silver', email: 'john@silver.com', password: 'password', password_confirmation: 'password' },
  { first_name: 'Charles', last_name: 'Vayne', email: 'charles@vayne.com', password: 'password', password_confirmation: 'password' },
  { first_name: 'Eleanor', last_name: 'Guthrie', email: 'eleanor@guthrie.com', password: 'password', password_confirmation: 'password' },
  { first_name: 'Edward', last_name: 'Teach', email: 'edward@teach.com', password: 'password', password_confirmation: 'password' }
  ])

######################
### SPORTS
######################
sports = Sport.create([
  { name: 'Cycling' }, { name: 'Running' }, { name: 'Basketball' }, { name: 'Kettlebells' },
  { name: 'Gymnastics' }, { name: 'Yoga' }, { name: 'Weightlifting' },
  { name: 'Bodybuilding' }, { name: 'Going to the Gym' }, { name: 'Calisthenics' }, { name: 'Conditioning'},
  { name: 'Boxing' }
  ])

######################
### GOALS
######################
goals = Goal.create([
  { name: 'Weight Loss' }, { name: 'Size and/or Strength'}, { name: 'Toning' },
  { name: 'Flexibility' }, { name: 'Make Friends' }, { name: 'Improve Skills' },
  { name: 'Learn New Skills'}, { name: 'Other' }
  ])

######################
### CITIES
######################
cities = City.create([
  { name: 'Bath' }, { name: 'Bristol' }, { name: 'Cardiff' }, { name: 'London' },
  { name: 'Plymouth' }, { name: 'Exeter' }, { name: 'Lancaster' }, { name: 'Leeds' }, { name: 'Manchester' },
  { name: 'Liverpool' }, { name: 'Other' }
  ])

bristol = City.find_by_name('Bristol')

######################
### GYMS - Also giving them a city (through associations) to the ones known, currently only using Bristol gyms
######################
gyms = Gym.create([
  { name: 'Horfield Leisure Centre', bio: 'This is an example bio. It make look the same as everyone else as it is seed, but it is dynamic. No need to worry.', city: bristol }, { name: 'MyGym', bio: 'This is an example bio. It make look the same as everyone else as it is seed, but it is dynamic. No need to worry.', city: bristol },
  { name: 'Risk Gymnasium', bio: 'This is an example bio. It make look the same as everyone else as it is seed, but it is dynamic. No need to worry.', city: bristol }, { name: 'BS7 Gym', bio: 'This is an example bio. It make look the same as everyone else as it is seed, but it is dynamic. No need to worry.', city: bristol }, { name: 'PureGym', bio: 'This is an example bio. It make look the same as everyone else as it is seed, but it is dynamic. No need to worry.', city: bristol },
  { name: 'Anytime Fitness', bio: 'This is an example bio. It make look the same as everyone else as it is seed, but it is dynamic. No need to worry.', city: bristol }, { name: 'DW Sports Fitness', bio: 'This is an example bio. It make look the same as everyone else as it is seed, but it is dynamic. No need to worry.', city: bristol }
  ])

######################
### FITNESS LEVELS
######################
fitness_levels = FitnessLevel.create([
  { name: 'Beginner' }, { name: 'Intermediate' }, { name: 'Advanced' },
  { name: 'Elite' }
  ])

######################
### WORKOUTS
######################
workouts = Workout.create([ { name: '1-2' }, { name: '3-4'}, { name: '5-7' } ])

times = Moment.create([ { name: "Morning" }, { name: 'Daytime' }, { name: 'Evening' } ])
