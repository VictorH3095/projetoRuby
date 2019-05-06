class Jogador

attr_accessor :energia, :var1, :pegaValor, :varStrike0, :var2, :var3, :idJogador, :idMaquina, :ataque, :vivo, :numero_de_mortos, :pontuacao, :contadorJogadas, :contadorFrames, :contadorStrike  

def initialize
   self.energia = 10 
   self.vivo = true
   self.pontuacao = 0
   self.contadorJogadas = 0
   self.contadorStrike = 0
   self.var1 = 0
   self.var2 = 0
   self.var3 = 0
   self.pegaValor = 0
   self.idJogador = 1
   self.idMaquina = 2 
   self.varStrike0 = 0
 end


def jogadaMaquina(alvo)
    
   if alvo.esta_vivo?
     self.contadorJogadas += 1
     self.ataque = Random.rand(0..alvo.energia)
     puts "\nA quantidade de pinos derrubados pelo jogador #{self.idMaquina}  foi #{self.ataque}"
     alvo.energia -= self.ataque 
     self.pontuacao += self.ataque
     

     
    
   if self.ataque < 10 && contadorJogadas == 1 #jogada 1 sem strike
        self.var1 = 0
        self.var1 += self.ataque
   end
     

   if self.var1 < 10 && contadorJogadas == 2 #jogada 2 sem strike
        self.var1 += self.ataque
        self.var3 = self.var1   
   end


   if self.var1 >=10 && contadorJogadas == 2 
       alvo.contador1 -= 1
       self.energia += 1 ##self.energia aumenta aq
       puts "\nRecebeu a tentativa extra pelo SPARE + 1: #{self.energia}"
   end

     
   if self.var1 >= 10 && contadorJogadas == 2
       alvo.energia = 10
   end
    
      
   if self.ataque == 10 && self.contadorJogadas == 1
       puts "\nSTRIKE !"
       alvo.energia = 10
       alvo.contador1 -= 1
       self.contadorStrike = 1
       self.var2 = 10
       puts "\nRecebeu as tentativas extras pelo STRIKE + 2: #{self.energia}"
   end

   
   if alvo.energia == 0 && self.contadorJogadas == 1
       self.contadorJogadas == 0
   end
 
     
   if self.contadorStrike == 1 && self.contadorJogadas == 2 
       puts "\nPrimeira jogada extra por STRIKE"
       alvo.energia = 10
       self.energia = self.energia + 1 ##self.energia aumenta aq
   end


   if self.contadorStrike == 1 && self.contadorJogadas == 3 
       puts "\nSegunda jogada extra por STRIKE"
       alvo.energia = 0
   end

    
   if self.contadorJogadas == 2 && self.var2 < 10 && self.var3 < 10
       self.contadorJogadas = 0 #zera aq
   end
      

   if self.contadorJogadas == 3
       self.var2 = 0 
       self.contadorJogadas = 0 #zera aq
   end


   if alvo.energia <= 0
      puts "\nO jogador derrubou todos os pinos"
      alvo.energia = 0
   end
     
 
   else
   puts "Os pinos foram derrubados\n\n" 
end  
 unless alvo.esta_vivo?
   puts "Os pinos foram derrubados\n\n"
   end
   end

def bater(alvo)
   if alvo.esta_vivo?
     self.contadorJogadas += 1
puts"\n---------------------------//------//---------------------------\n"
 puts"\n Digite o valor do arremesso, 1 para fraco (de 0 a 4 pinos), 2 para forte(de 0 a 9 pinos) ou 3 para jogar com efeito (pode acertar 0 ou 10 pinos)"
     chute = gets.strip.to_i
     puts "\nValor do chute e #{chute}"
    
if chute == 1
   if alvo.energia > 4
   self.ataque = Random.rand(0..4) 
   else
   self.ataque = Random.rand(0..alvo.energia)
   end
end
   

if chute == 2
    if alvo.energia == 10
    self.ataque = Random.rand(0..9)
    else
    self.ataque = Random.rand(0..alvo.energia)
    end
end
   

if chute == 3
    if alvo.energia < 10
      self.ataque = 0
    else
      self.pegaValor = Random.rand(0..1)
    end
    if self.pegaValor == 0
      self.ataque = 0
    else
      self.ataque = 10
    end
    if self.varStrike0 == 1  
      self.ataque  = 0
    end
 end
     
puts "\nA quantidade de pinos derrubados pelo jogador #{self.idJogador}  e #{self.ataque}"

     alvo.energia -= self.ataque 
     self.pontuacao += self.ataque
     
     if self.ataque < 10 && contadorJogadas == 1 #jogada 1 sem strike
        self.var1 = 0
        self.var1 += self.ataque
        self.varStrike0 = 1
     end
     

     if self.var1 < 10 && contadorJogadas == 2   #jogada 2 sem strike
         self.var1 += self.ataque
         self.var3 = self.var1   
          self.varStrike0 = 0
     end



     if self.var3 >=10 && contadorJogadas == 2 
     alvo.contador1 -= 1
     self.energia += 1 ##self.energia aumenta aq
     puts "\nRecebeu a tentativa extra pelo SPARE + 1 : #{self.energia}"
     end

     if self.var1 >= 10 && contadorJogadas == 2
     alvo.energia = 10
     end
    
      
     
     if self.ataque == 10 && self.contadorJogadas == 1
     self.varStrike0 = 0
     puts "\nSTRIKE !"
     alvo.energia = 10
     alvo.contador1 -= 1
     self.contadorStrike = 1
    
     self.var2 = 10
     puts "\nRecebeu as tentativas extras pelo STRIKE + 2 : #{self.energia}"
     end

    if alvo.energia == 0 && self.contadorJogadas == 1
    self.contadorJogadas == 0
    end
 
     
   if self.var2 == 10 && self.contadorJogadas == 2 
     puts "\nPrimeira jogada extra pelo STRIKE"
     alvo.energia = 10
     self.energia = self.energia + 1 ##self.energia aumenta aq
   end

   if self.contadorStrike == 1 && self.contadorJogadas == 3   
        puts "\nSegunda jogada extra pelo STRIKE"
        alvo.energia = 0
   end

   if self.contadorJogadas == 2 && self.var2 < 10 && self.var3 < 10
        self.contadorJogadas = 0 #zera aq
   end
      

   if self.contadorJogadas == 3
        self.varStrike0 = 0
        self.var1 = 0 
        self.var2 = 0 #para nao somar mais 1 lance quando nao for strike
        self.var3 = 0
        self.contadorJogadas = 0 #zera aq
        self.contadorStrike = 0
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
