require_relative './app'

def main
  puts 'Welcome'

  app = App.new

  loop do
    app.choices
  end
end

main