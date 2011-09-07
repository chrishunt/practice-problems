require './lib/santa.rb'

people = ['thom',
          'sally',
          'doug',
          'steve']

secret_santa = SecretSanta.new(people)
puts secret_santa.assign_santas
