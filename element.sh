#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"
    

function display_element_info {
  local element_name=$1
  local atomic_number=$2
  local atomic_mass=$3
  local melting_point=$4
  local boiling_point=$5
  local type_name=$6
  local symbol_name=$7


  echo "The element with atomic number $atomic_number is $element_name ($symbol_name). It's a $type_name, with a mass of $atomic_mass amu. $element_name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius." 
}

# Check if a parameter was passed to the script
if [ -z "$1" ]; then
    # No input - do something
    echo Please provide an element as an argument.
else
    # Input provided - do something else
    #echo "Input provided: $1"
    if [[ "$1" == "1" || "$1" == "H" || "$1" == "Hydrogen" ]]; then
        # Display the element information
        display_element_info "Hydrogen" "1" "1.008" "-259.1" "-252.9" "nonmetal" "H"
    else
        case "$1" in
            [0-9]*)
                # Input is a number - echo HI
                result=$($PSQL "SELECT name, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, symbol FROM properties FULL JOIN elements USING (atomic_number) FULL JOIN types USING (type_id) WHERE atomic_number = $1")
                #echo $result
                ;;
            [A-Za-z][A-Za-z])
                result=$($PSQL "SELECT name, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, symbol FROM properties FULL JOIN elements USING (atomic_number) FULL JOIN types USING (type_id) WHERE symbol = '$1'")
                #echo $result
                ;;
            *)
                result=$($PSQL "SELECT name, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, symbol FROM properties FULL JOIN elements USING (atomic_number) FULL JOIN types USING (type_id) WHERE name = '$1'")
                ;;
        esac
      
      if [ -n "$result" ];
      then
          echo -e "$result" | while read -r line
          do
            ele_name=$(echo $line | cut -f 1 -d '|')
            ato_num=$(echo $line | cut -f 2 -d '|')
            ato_mas=$(echo $line | cut -f 3 -d '|')
            mel_pnt=$(echo $line | cut -f 4 -d '|')
            bol_pnt=$(echo $line | cut -f 5 -d '|')
            typ_name=$(echo $line | cut -f 6 -d '|')
            sym_name=$(echo $line | cut -f 7 -d '|') 
            
            display_element_info $ele_name $ato_num $ato_mas $mel_pnt $bol_pnt $typ_name $sym_name
          done
      else
          echo I could not find that element in the database.
      fi      
    fi
fi