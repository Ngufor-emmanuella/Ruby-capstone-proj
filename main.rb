require_relative './app'

def main
  puts
  puts 'WELCOME TO CATALOG OF MY THINGS!'
  puts '================================================'

  app = App.new

  loop do
    app.choices
  end
end

main
