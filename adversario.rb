class Adversario

 attr_accessor :energia, :ataque, :vivo, :contador1, :contador2 
 
 def initialize

   self.energia = 10 
   self.vivo = true
   self.contador1 = 0
 end
 
 def bater(alvo)
   if alvo.esta_vivo?
     self.ataque = 1 #custa uma tentativa ao jogador
     puts "O jogador fez #{self.ataque} tentativa"

     alvo.energia -= self.ataque
     self.contador1 += 1
     
   else
     puts 'Todos os pinos foram derrubados'
   end
   
 end  

 def esta_vivo? 
   # true if self.energia > 0 #esta vivo se energia > 0
   true if self.contador1 < 2
 end
end

