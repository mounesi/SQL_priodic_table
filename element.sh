#!/bin/bash

echo Please provide an element as an argument.

function display_element_info {
  local elelment_name=$1
  local atomic_number=$2
  local atomic_mass=$3
  local melting_point=$4
  local boiling_point=$5
  local type_name=$6
  local symbol_name=$7


  echo "The element with atomic number $atomic_number is $element_name ($symbol_name). It's a $type_name, with a mass of $atomic_mass amu. $element_name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius." 
}

