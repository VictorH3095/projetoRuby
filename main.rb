require_relative "jogador1"
require_relative "adversario"



def nao_quer_jogar?
  puts 'Deseja jogar novamente? (S/N)'
  quero_jogar = gets.strip.upcase
  quero_jogar.casecmp('N').zero?
end



loop do

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
  puts "" if adversario1.esta_vivo? 
  if adversario1.esta_vivo?
    adversario1.bater(jogador1)
    print "A quantidade de tentativas restantes e #{jogador1.energia}" 
    puts '' #mesma funcao do \n
    puts "----------------------------//---------------//---------"
  end
end



while adversario2.esta_vivo? && jogador2.esta_vivo?
  jogador2.jogadaMaquina(adversario2)
  puts "" if adversario2.esta_vivo? 
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
   break if nao_quer_jogar? #para o loop externo

  end
