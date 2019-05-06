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
     puts "O jogador fez #{self.ataque} tentativa"

     alvo.energia -= self.ataque
     self.contador1 += 1
     
   else
     puts 'Todos os pinos foram derrubados'
   end
   
 end  

 def esta_vivo? 
   
   true if self.contador1 < 2
 end
end









class Jogador

attr_accessor :energia, :var1, :idJogador, :ataque, :vivo, :numero_de_mortos, :pontuacao, :contadorJogadas, :contadorFrames, :contadorStrike  
def initialize
   self.energia = 10 
   self.vivo = true
   self.numero_de_mortos = 0
   self.pontuacao = 0
   self.contadorJogadas = 0
   self.contadorFrames = 0
   self.contadorStrike = 0
self.var1 = 0
   self.idJogador = Random.rand(100) 
   
 end

def bater(alvo)
   if alvo.esta_vivo?
     self.contadorJogadas += 1
     self.ataque = Random.rand(11) 
     puts "\nA quantidade de pinos derrubados pelo jogador #{self.idJogador}  e #{self.ataque}"

     alvo.energia -= self.ataque 
     self.pontuacao += self.ataque
    
     puts "Valor de contadorJogadas e #{self.contadorJogadas}"

     if self.ataque < 10 && contadorJogadas == 1
        self.var1 = 0
        self.var1 += self.ataque
        puts"Valor de var1 e #{self.var1}"
     end
     

     if self.var1 < 10 && contadorJogadas == 2
         self.var1 += self.ataque
         puts"Valor de var1 e #{self.var1}"
     end



     if self.var1 >=10 && contadorJogadas == 2
     puts"Var1 e maior que 10"
     alvo.contador1 -= 1
     self.energia += 1
     puts "Recebeu a tentativa extra do spare de volta + 1 : #{self.energia}"
     end
     
     
    
      
     
     if self.ataque == 10 && self.contadorJogadas == 1
     puts "Mensagem de strike primeiro lance"
     alvo.energia = 10
     alvo.contador1 -= 1
     self.contadorStrike = 1
     self.energia += 2
     puts "Recebeu as tentativas extras de volta + 2 : #{self.energia}"
     end
 
     
if self.contadorStrike == 1 && self.contadorJogadas == 2 
     puts "Mensagem de jogada extra strike segundo lance"
     alvo.energia = 10
end

if self.contadorStrike == 1 && self.contadorJogadas == 3 
     puts "Mensagem de jogada extra strike terceiro lance"
     alvo.energia = 0
end

     if self.contadorJogadas == 2 && self.var1 < 10
        self.contadorJogadas = 0
     end


     if self.contadorJogadas == 3
        self.contadorJogadas = 0
     end

    

     if alvo.energia <= 0
     puts "O jogador derrubou todos os pinos"
     alvo.energia = 0
     end
     
   
   else
   puts "Os pinos foram derrubados\n\n" 
   
   end  
 unless alvo.esta_vivo?
puts "Os pinos foram derrubados\n\n"
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
puts 
puts "Pontuacao final do jogador 1 #{jogador1.pontuacao} pontos"

puts "Pontuacao final do jogador 2 #{jogador2.pontuacao} pontos"

if jogador1.pontuacao > jogador2.pontuacao
print "Jogador 1 venceu\n"
else
print "Jogador 2 venceu\n" 
end

