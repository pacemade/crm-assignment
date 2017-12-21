require_relative 'contact'

p dva = Contact.create('Hana', 'Song', 'lovedva@gmail.com')
p elton = Contact.create('Elton', 'John', 'itselton@john.net', 'pretty cool dude')
p tracer = Contact.create('Lena', 'Oxton', 'tracer@overwatch.com', 'Cheers!')

# p Contact.all
#
# p dva
# p elton
#
# p dva.update("notes", "okay")

# p Contact.find(101)
#
# p dva.update("first_name", 'Sandy')
#
# p dva
#
# p dva.update('email', 'richardwing@hotmail.com')

# p Contact.find_by('first_name', 'Elton')
# p Contact.find_by('last_name', 'Oxton')

p elton.delete

p Contact.all

p dva.delete

p Contact.all

p tracer.delete

p Contact.all
