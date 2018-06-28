

=begin
array = %w{alejandro Marcelo Pepe Juan Carlos Ramon Rodrigo Martín Osbaldo Santigo Luis Facundo Rodrigo}
array.each do |qwert|
  puts 'Mi nimbre es +: ' + qwert + '!\n'
  puts  qwert + ' es un tonto' + qwert
end
vector= [34,12,3,5,58]
puts vector.sort

=end
#attr_reader :nom :pur
#

=begin


class Operaciones
  def initialize(nombre,apellido)
    @nombre = nombre
    @apellido = apellido
  end

attr_reader :nombre , :apellido

end



cuestionario = Operaciones.new("Cara de.... "," PapaFritaMcGregor")
puts "Hola " + cuestionario.nombre + "\n"
puts " Si #{cuestionario.apellido} es tu apellido ingresa su nombre ahora profavor aqui:"

nombre = gets.chomp

puts "Hola #{nombre} bienvenido a el mundo ruby ... jej"

=end
