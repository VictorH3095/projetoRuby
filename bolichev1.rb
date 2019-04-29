class Adversario

 attr_accessor :energia, :ataque, :vivo, :contador1, :contador2 
 
 def initialize

   self.energia = 10 
   self.vivo = true
   self.contador1 = 0
 end
 
 def bater(alvo)
   if alvo.esta_vivo?
     self.ataque = 1 
     puts "O dano do adversario foi #{self.ataque}"

     alvo.energia -= self.ataque
     self.contador1 += 1
     
   else
     puts 'Voce esta morto'
   end
   
 end  

 def esta_vivo? 
   
   true if self.contador1 < 2
 end
end



class Jogador

attr_accessor :energia, :ataque, :vivo, :numero_de_mortos, :pontuacao, :contadorJogadas  
def initialize
   self.energia = 10 
   self.vivo = true
   self.numero_de_mortos = 0
   self.pontuacao = 0
   self.contadorJogadas = 0
 end

def bater(alvo)
   if alvo.esta_vivo?
     self.ataque = Random.rand(10) 
     puts "A quantidade de pinos derrubados e #{self.ataque}"

     alvo.energia -= self.ataque 
     self.pontuacao += self.ataque
   
   else
   puts "O adversario esta morto\n\n" 
   
   end  
 unless alvo.esta_vivo?
puts "O adversario esta morto\n\n"
self.numero_de_mortos+=1
end
end
 def esta_vivo? 
   true if self.energia > 0

 end
end 



jogador1 = Jogador.new
puts jogador1.inspect

jogador2 = Jogador.new
puts jogador2.inspect


while jogador1.esta_vivo?
adversario1 = Adversario.new
puts adversario1.inspect
adversario2 = Adversario.new
puts adversario2.inspect

while adversario1.esta_vivo? && jogador1.esta_vivo?
jogador1.bater(adversario1)
puts "A quantidade de pinos sobrando e #{adversario1.energia}" if adversario1.esta_vivo?  
if adversario1.esta_vivo?
adversario1.bater(jogador1)
print "A quantidade de tentativas restantes e #{jogador1.energia}" 
puts '' #mesma funcao do \n
end
end




while adversario2.esta_vivo? && jogador2.esta_vivo?
jogador2.bater(adversario2)
puts "A quantidade de pinos sobrando e #{adversario2.energia}" if adversario2.esta_vivo?
if adversario2.esta_vivo?
adversario2.bater(jogador2)
print "A quantidade de tentativas restantes e #{jogador2.energia}" 
puts '' #mesma funcao do \n
end
end
end

puts 'Fim de jogo'
puts "Voce matou #{jogador1.numero_de_mortos} adversarios"
puts "Pontuacao final do jogador 1 #{jogador1.pontuacao} pontos"

puts "Pontuacao final do jogador 2 #{jogador2.pontuacao} pontos"

if jogador1.pontuacao > jogador2.pontuacao
print "Jogador 1 venceu\n"
else
print "Jogador 2 venceu\n" 
end

