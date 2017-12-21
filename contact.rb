require 'pry'

class Contact

attr_accessor :first_name, :last_name, :email, :notes
attr_reader :id

  @@contacts = []
  @@next_id = 100

  # This method should initialize the contact's attributes

  def initialize(first_name, last_name, email, notes = 'N/A')
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @notes      = notes

    @id = @@next_id
    @@next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it

  def self.create(first_name, last_name, email, notes = 'N/A')
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts

  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id

  def self.find(looking_for)
    @@contacts.each do |contact|
      if contact.id == looking_for
        return contact
      end
    end
    return
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_info)
    # if attribute == "first_name"
    #   @first_name = new_info
    # end
    case attribute
    when 'first_name'
      @first_name = new_info
    when 'last_name'
      @last_name = new_info
    when 'email'
      @email = new_info
    when 'notes'
      @notes = new_info
    else
      puts "i dont know what you're looking for"
    end
  #   send "#{attribute}=", new_info
  # rescue
  #      puts "i dont know what you're looking for"
  end


  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@contacts.each do |contact|
      case attribute
      when 'first_name'
        if value == contact.first_name
          return contact
        end
      when 'last_name'
        if value == contact.last_name
         return contact
       end
      when 'email'
        if value == contact.email
          return contact
        end
      else
        nil
      end
    end
  end



  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end


  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.each do |contact|
      if contact == self
        @@contacts.delete(contact)
      end
    end
  end

  # READER

  # def first_name
  #   @first_name
  # end
  #
  # def last_name
  #   @last_name
  # end
  #
  # def email
  #   @email
  # end
  #
  # def notes
  #   @notes
  # end
  #
  # def id
  #   @id
  # end
  #
  # #WRITERS
  #
  # def first_name=(first_name)
  #   @first_name = first_name
  # end
  #
  # def last_name=(last_name)
  #   @last_name = last_name
  # end
  #
  # def email=(email)
  #   @email = email
  # end
  #
  # def notes=(notes)
  #   @notes = notes
  # end

  def full_name
    "#{ first_name } #{ last_name }"
    #this works because the reader method defines it up there
  end

end
