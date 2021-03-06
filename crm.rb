require_relative './contact.rb'

class CRM

  def initialize(name)
    @name = name

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then abort('Goodbye ;)')
      # Finish off the rest for 3 through 6
      # To be clear, the methods add_new_contact and modify_existing_contact
      # haven't been implemented yet
    end
  end

  def add_new_contact
    puts 'Enter First Name:'
    first_name = gets.chomp

    puts 'Enter Last Name:'
    last_name = gets.chomp

    puts 'Enter Email Address:'
    email = gets.chomp

    puts 'Enter a Note:'
    note = gets.chomp

    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )

    puts 'Added!'
  end

  def modify_existing_contact
    puts 'What id are you looking to modify?'
    id = gets.to_i

    puts 'What attribute are you looking to modify?'
    attribute = gets.chomp

    puts 'What are you looking to replace this with?'
    new_info = gets.chomp

    contact = Contact.find(id)
    contact.update_attributes(attribute => new_info)
  end

  def delete_contact
    puts 'Which id are you looking to delete?'
    id = gets.to_i

    Contact.delete(id)

    puts 'Deleted!'
  end

  def display_all_contacts
    p Contact.all
  end

  def search_by_attribute
    puts 'Attribute?'
    attribute = gets.chomp

    puts "What is the #{attribute}?"
    value = gets.chomp

    p Contact.find_by(attribute => value)
  end

end

lol = CRM.new("lol").main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
