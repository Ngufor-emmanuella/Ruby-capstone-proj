require_relative './app'

def main
  puts
  puts 'WELCOME TO CATALOG OF MY THINGS APP!!'
  puts '============================================================='
  app = App.new 
  app.show_menu
end

main