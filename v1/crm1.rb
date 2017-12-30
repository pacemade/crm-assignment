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
    print 'Enter First Name:'
    first_name = gets.chomp

    print 'Enter Last Name:'
    last_name = gets.chomp

    print 'Enter Email Address:'
    email = gets.chomp

    print 'Enter a Note:'
    notes = gets.chomp

    Contact.create(first_name, last_name, email, notes)

    p 'Added!'
  end

  def modify_existing_contact
    p 'What id are you looking to modify?'
    id = gets.to_i

    p 'What attribute are you looking to modify?'
    attribute = gets.chomp

    p 'What are you looking to replace this with?'
    new_info = gets.chomp

    Contact.update(id, attribute, new_info)
  end

  def delete_contact
    p 'Which id are you looking to delete?'
    id = gets.to_i

    Contact.delete(id)

    p 'Deleted!'
  end

  def display_all_contacts
    p Contact.all
  end

  def search_by_attribute
    print 'Attribute?'
    attribute = gets.chomp

    print "What is the #{attribute}?"
    value = gets.chomp

    p Contact.find_by(attribute, value)
  end

end

puts 'Nom pl0x'

check = gets.chomp

crm = CRM.new(check)

crm.main_menu
