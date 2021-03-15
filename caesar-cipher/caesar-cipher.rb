def caesar_cipher(message,cipher)
  chars = message.split('')
  newchars = chars.map() do |char|
    code = char.ord
    if code.between?(65,90)
      code = ((code - 65 + cipher) % 26) + 65
      code.chr
    elsif code.between?(97,122)
      code = ((code - 97 + cipher) % 26) + 97
      code.chr
    else
      code.chr
    end
  end
  newchars.join('')
end

def is_integer?(string)
  true if Integer(string) rescue false
end

begin
  puts "Enter your message"
  message = gets.chomp
  begin
    puts "Enter the cipher number"
    cipher = gets.chomp
  end until is_integer?(cipher)
  puts "Your coded message is:"
  puts caesar_cipher(message, cipher.to_i)
  puts "Press enter to run again, q to quit"
end until gets.chomp == 'q'