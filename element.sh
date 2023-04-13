#!/bin/bash


    

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

    # Check if the parameter is a valid input
    case "$1" in
        1|H|Hydrogen)
            # Display the element information
            display_element_info "Hydrogen" "1" "1.008" "-259.1" "-252.9" "nonmetal" "H"
            ;;
        *)
            # Invalid input - display an error message
            echo "I could not find that element in the database."
            ;;
    esac

fi