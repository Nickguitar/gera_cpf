#!/bin/bash
# Nicholas Ferreira - 06/12/2022
# Gera CPFs válidos. Deve ser usado com shortcuts do teclado
# Feito pelo OpenAI, modificado por mim

digitos=($(shuf -i 0-9 -n 9))

soma=0
for i in $(seq 0 8); do
  soma=$((soma + digitos[i] * (10 - i)))
done
resto=$((soma % 11))
digito1=$((resto < 2 ? 0 : 11 - resto))

soma=0
for i in $(seq 0 8); do
  soma=$((soma + digitos[i] * (11 - i)))
done
soma=$((soma + digito1 * 2))
resto=$((soma % 11))
digito2=$((resto < 2 ? 0 : 11 - resto))

cpf=""
for i in $(seq 0 9); do
  cpf+="${digitos[i]}"
done
cpf+="${digito1}${digito2}"

xdotool sleep 0.100 type --clearmodifiers $cpf
