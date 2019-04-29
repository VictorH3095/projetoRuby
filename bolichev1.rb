class Adversario
#attr_acessor permite que eu possa ler e escrever nessa variaveis
 attr_accessor :energia, :ataque, :vivo, :contador1, :contador2 
 
 def initialize
#energia = valor do numeroDePinos vai ser 10
   self.energia = 10 
   self.vivo = true
   self.contador1 = 0
 end
 
 def bater(alvo)
   if alvo.esta_vivo? 
     self.ataque = 1 #custa uma tentativa ao jogador
     puts "O dano do adversario foi #{self.ataque}"
#energia = tentativas do jogadador diminui
     alvo.energia -= self.ataque
     self.contador1 += 1
     
   else
     puts 'Voce esta morto'
   end 
 end  

#Esta vivo = se contador nao chegar a 2, 2 seria o numero de jogadas em um frame
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
   puts "Os pinos foram derrubados\n\n" 
   
   end  
 unless alvo.esta_vivo?
puts "Os pinos foram derrubados\n\n"
end
end
 def esta_vivo? 
   true if self.energia > 0
   #true if self.contadorJogadas < 2 
 end
end 

jogador1 = Jogador.new
puts jogador1.inspect


while jogador1.esta_vivo?
adversario1 = Adversario.new
puts adversario1.inspect

while adversario1.esta_vivo? && jogador1.esta_vivo?
jogador1.bater(adversario1)
puts "A quantidade de pinos sobrando e #{adversario1.energia}" if adversario1.esta_vivo? 
if adversario1.esta_vivo?
adversario1.bater(jogador1)
print "A quantidade de tentativas restantes e #{jogador1.energia}" 
puts '' #mesma funcao do \n
end
end
end

puts 'Fim de jogo'

puts "Sua pontuacao final e de #{jogador1.pontuacao} pontos"
